import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/core/utils/ui_state.dart';
import 'package:shopp_app/features/addresses/domain/entities/address_entity.dart';
import 'package:shopp_app/features/addresses/presentation/providers/address_providers.dart';
import '../widgets/address_form_dialog.dart';

class AddressesPage extends ConsumerStatefulWidget {
  const AddressesPage({super.key});

  @override
  ConsumerState<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends ConsumerState<AddressesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addressNotifierProvider.notifier).loadAddresses();
    });
  }

  void _openAddressForm({AddressEntity? address}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AddressFormBottomSheet(existingAddress: address),
    );
  }

  void _confirmDelete(AddressEntity address) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Delete Address'),
        content: Text(
          'Are you sure you want to delete the address for "${address.fullName}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.pop(dialogCtx);
              final success = await ref
                  .read(addressNotifierProvider.notifier)
                  .deleteAddress(address.id);
              if (!mounted) return;
              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Address deleted successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final addressState = ref.watch(addressNotifierProvider);
    final addresses = addressState.data ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivery Addresses',
          style: AppTypography.headingSmall,
        ),
        actions: [
          IconButton(
            icon: const AppIcon(AppIcons.add, size: AppIconSizes.large),
            tooltip: 'Add Address',
            onPressed: () => _openAddressForm(),
          ),
        ],
      ),
      body: addressState.isLoading && addresses.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            )
          : addresses.isEmpty
              ? _buildEmptyState(context)
              : RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () =>
                      ref.read(addressNotifierProvider.notifier).loadAddresses(),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: addresses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final addr = addresses[index];
                      return _buildAddressCard(context, addr);
                    },
                  ),
                ),
      bottomNavigationBar: addresses.isNotEmpty
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadius.borderMd,
                    ),
                  ),
                  icon: const AppIcon(AppIcons.addressAdd, size: AppIconSizes.medium),
                  label: const Text(
                    'Add New Address',
                    style: AppTypography.buttonText,
                  ),
                  onPressed: () => _openAddressForm(),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppIcon(
              AppIcons.locationOff,
              size: AppIconSizes.emptyState,
              color: AppColors.slate300,
            ),
            const SizedBox(height: 16),
            const Text(
              'No addresses saved',
              style: AppTypography.headingLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Add a delivery address to speed up your checkout.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const AppIcon(AppIcons.add, size: AppIconSizes.button),
              label: const Text('Add Address'),
              onPressed: () => _openAddressForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(BuildContext context, AddressEntity addr) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: addr.isDefault ? AppColors.primary : Colors.grey.shade200,
          width: addr.isDefault ? 1.5 : 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Recipient name and default badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      addr.fullName,
                      style: AppTypography.titleSmall,
                    ),
                    if (addr.isDefault) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary50,
                          borderRadius: AppRadius.borderSm,
                          border: Border.all(color: AppColors.primaryLight),
                        ),
                        child: Text(
                          'DEFAULT',
                          style: AppTypography.labelSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                PopupMenuButton<String>(
                  icon: const AppIcon(AppIcons.moreVert, size: AppIconSizes.medium, color: AppColors.slate400),
                  onSelected: (val) async {
                    if (val == 'edit') {
                      _openAddressForm(address: addr);
                    } else if (val == 'delete') {
                      _confirmDelete(addr);
                    } else if (val == 'default') {
                      await ref
                          .read(addressNotifierProvider.notifier)
                          .setDefault(addr.id);
                    }
                  },
                  itemBuilder: (ctx) => [
                    if (!addr.isDefault)
                      const PopupMenuItem(
                        value: 'default',
                        child: Text('Set as Default'),
                      ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete', style: AppTypography.buttonText.copyWith(color: AppColors.error)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              addr.formattedAddress,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              'Phone: ${addr.phone}',
              style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
            ),
            const Divider(height: 20),

            // Card footer buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!addr.isDefault)
                  TextButton(
                    onPressed: () async {
                      await ref
                          .read(addressNotifierProvider.notifier)
                          .setDefault(addr.id);
                    },
                    child: const Text('Set as Default'),
                  ),
                TextButton(
                  onPressed: () => _openAddressForm(address: addr),
                  child: const Text('Edit'),
                ),
                TextButton(
                  onPressed: () => _confirmDelete(addr),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
