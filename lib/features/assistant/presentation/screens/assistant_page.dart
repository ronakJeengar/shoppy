import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_shadows.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/core/widgets/app_network_image.dart';
import 'package:shopp_app/features/assistant/data/models/assistant_message_model.dart';
import 'package:shopp_app/features/assistant/presentation/providers/assistant_providers.dart';
import 'package:shopp_app/features/catalog/data/mappers/catalog_mappers.dart';
import 'package:shopp_app/core/utils/currency_formatter.dart';
import 'package:shopp_app/features/catalog/presentation/screens/product_detail_page.dart';

class AssistantPage extends ConsumerStatefulWidget {
  const AssistantPage({super.key});

  @override
  ConsumerState<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends ConsumerState<AssistantPage> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(AssistantNotifier notifier) {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;

    _inputController.clear();
    notifier.sendMessage(text);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(assistantNotifierProvider);
    final notifier = ref.read(assistantNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: AppIcon(
                  AppIcons.sparkles,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Shoppy Assistant',
                  style: AppTypography.headingSmall,
                ),
                Text(
                  'AI Shopping Companion',
                  style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const AppIcon(AppIcons.commentAdd, size: AppIconSizes.medium),
            tooltip: 'New Conversation',
            onPressed: () {
              notifier.startNewConversation();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Error banner if any
            if (state.errorMessage != null)
              Container(
                width: double.infinity,
                color: AppColors.errorLight,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const AppIcon(AppIcons.errorOutline, color: AppColors.error, size: AppIconSizes.medium),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        state.errorMessage!,
                        style: AppTypography.bodySmall.copyWith(color: AppColors.error),
                      ),
                    ),
                    IconButton(
                      icon: const AppIcon(AppIcons.close, size: AppIconSizes.action, color: AppColors.error),
                      onPressed: () => notifier.clearError(),
                    ),
                  ],
                ),
              ),

            // Main chat message list or empty state
            Expanded(
              child: state.messages.isEmpty
                  ? _buildEmptyState(state, notifier)
                  : _buildMessageList(state, notifier),
            ),

            // Loading / Thinking indicator
            if (state.isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Shoppy AI is finding the best answer...',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

            // Bottom input bar
            _buildInputBar(state, notifier),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(AssistantState state, AssistantNotifier notifier) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.4),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AppIcon(
                AppIcons.sparkles,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'How can I help you shop today?',
            textAlign: TextAlign.center,
            style: AppTypography.headingLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Ask product recommendations, track active orders, inspect cart items, or check return policies.',
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Try asking:',
              style: AppTypography.titleSmall,
            ),
          ),
          const SizedBox(height: 10),
          ...state.suggestedPrompts.map(
            (prompt) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.borderMd,
                  ),
                ),
                onPressed: () {
                  _inputController.text = prompt;
                  _sendMessage(notifier);
                },
                child: Row(
                  children: [
                    const AppIcon(AppIcons.chatBubble, size: AppIconSizes.sm),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        prompt,
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                    const AppIcon(AppIcons.forward, size: AppIconSizes.xs),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(AssistantState state, AssistantNotifier notifier) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: state.messages.length,
      itemBuilder: (context, index) {
        final message = state.messages[index];
        return _buildMessageItem(message, state, notifier);
      },
    );
  }

  Widget _buildMessageItem(
    AssistantMessageModel message,
    AssistantState state,
    AssistantNotifier notifier,
  ) {
    final isUser = message.isUser;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isUser) ...[
                Container(
                  margin: const EdgeInsets.only(right: 8, top: 4),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: AppIcon(
                      AppIcons.sparkles,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isUser
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(isUser ? 16 : 4),
                      bottomRight: Radius.circular(isUser ? 4 : 16),
                    ),
                  ),
                  child: Text(
                    message.content,
                    style: AppTypography.bodyMedium.copyWith(
                      color: isUser ? AppColors.white : AppColors.slate900,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Pending Consequential Action Confirmation Card
          if (message.hasPendingConfirmation) ...[
            const SizedBox(height: 10),
            _buildConfirmationCard(message.pendingConfirmation!, state, notifier, theme),
          ],

          // Embedded Product Cards
          if (message.hasProducts) ...[
            const SizedBox(height: 10),
            _buildProductsCarousel(message.products),
          ],

          // Grounded Knowledge Citations
          if (message.hasSources) ...[
            const SizedBox(height: 8),
            _buildSourcesBadges(message.sources),
          ],

          // Contextual Interactive Actions
          if (message.hasActions) ...[
            const SizedBox(height: 8),
            _buildActionButtons(message.actions, notifier),
          ],
        ],
      ),
    );
  }

  Widget _buildConfirmationCard(
    AssistantConfirmationModel confirmation,
    AssistantState state,
    AssistantNotifier notifier,
    ThemeData theme,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 32, top: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.warningLight,
        borderRadius: AppRadius.borderMd,
        border: Border.all(color: AppColors.warning, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppIcon(AppIcons.warning, color: AppColors.warning, size: AppIconSizes.medium),
              const SizedBox(width: 8),
              Text(
                'Confirmation Required',
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.warning,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            confirmation.summary,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.slate900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'This action cannot be undone automatically.',
            style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
                ),
                onPressed: state.isLoading
                    ? null
                    : () async {
                        final success = await notifier
                            .confirmPendingAction(confirmation.confirmationId);
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(success
                                  ? 'Action confirmed successfully'
                                  : 'Failed to confirm action'),
                              backgroundColor:
                                  success ? AppColors.success : AppColors.error,
                            ),
                          );
                        }
                      },
                icon: const AppIcon(AppIcons.checkCircleOutline, size: AppIconSizes.button),
                label: const Text('Confirm', style: AppTypography.buttonText),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderSm),
                ),
                onPressed: state.isLoading
                    ? null
                    : () async {
                        final success = await notifier
                            .cancelPendingAction(confirmation.confirmationId);
                        if (mounted && success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Action cancelled')),
                          );
                        }
                      },
                child: Text('Cancel', style: AppTypography.buttonText.copyWith(color: AppColors.slate700)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductsCarousel(
    List<AssistantProductCardModel> products,
  ) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final p = products[index];
          return Container(
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                AppNetworkImage(
                  imageUrl: p.productImage,
                  height: 100,
                  width: double.infinity,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  fit: BoxFit.cover,
                  memCacheWidth: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.titleSmall,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            CurrencyFormatter.format(p.price, showDecimals: false),
                            style: AppTypography.priceCard,
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: p.inStock ? AppColors.successLight : AppColors.errorLight,
                              borderRadius: AppRadius.borderSm,
                            ),
                            child: Text(
                              p.inStock ? 'In Stock' : 'Out of Stock',
                              style: AppTypography.caption.copyWith(
                                color: p.inStock ? AppColors.success : AppColors.error,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: double.infinity,
                        height: 28,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                              borderRadius: AppRadius.borderSm,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductDetailPage(
                                  product: p.toProduct().toEntity(),
                                  productId: p.id,
                                ),
                              ),
                            );
                          },
                          child: const Text('View', style: AppTypography.buttonText),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSourcesBadges(List<AssistantSourceModel> sources) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: sources.map((s) {
        final title = s.title.isNotEmpty ? s.title : "Policy";
        final sec = s.section.isNotEmpty ? " - ${s.section}" : "";
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.warningLight,
            borderRadius: AppRadius.borderSm,
            border: Border.all(color: AppColors.warning),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppIcon(AppIcons.verifiedOutline, size: AppIconSizes.xs, color: AppColors.warning),
              const SizedBox(width: 4),
              Text(
                "Source: $title$sec",
                style: AppTypography.caption.copyWith(color: AppColors.warning),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons(
    List<AssistantActionModel> actions,
    AssistantNotifier notifier,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: actions.map((act) {
        return OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.borderSm,
            ),
          ),
          icon: AppIcon(_getActionIcon(act.type), size: AppIconSizes.sm),
          label: Text(act.label, style: AppTypography.buttonText.copyWith(color: AppColors.slate800)),
          onPressed: () => notifier.executeAction(act, context),
        );
      }).toList(),
    );
  }

  String _getActionIcon(String type) {
    switch (type) {
      case 'OPEN_PRODUCT':
        return AppIcons.bag;
      case 'OPEN_SEARCH':
        return AppIcons.search;
      case 'OPEN_CART':
        return AppIcons.cart;
      case 'OPEN_ORDER':
      case 'OPEN_ORDERS':
        return AppIcons.shipping;
      default:
        return AppIcons.arrowForward;
    }
  }

  Widget _buildInputBar(AssistantState state, AssistantNotifier notifier) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputController,
              focusNode: _focusNode,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(notifier),
              decoration: InputDecoration(
                hintText: 'Ask anything about products, orders, returns...',
                hintStyle: AppTypography.bodySmall.copyWith(color: AppColors.slate400),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: const OutlineInputBorder(
                  borderRadius: AppRadius.borderFull,
                  borderSide: BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            icon: const AppIcon(AppIcons.send, size: AppIconSizes.action, color: Colors.white),
            onPressed: state.isLoading ? null : () => _sendMessage(notifier),
          ),
        ],
      ),
    );
  }
}
