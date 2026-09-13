import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/constants/app_icon_sizes.dart';
import 'package:shopp_app/core/theme/app_colors.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/theme/app_radius.dart';
import 'package:shopp_app/core/theme/app_typography.dart';
import 'package:shopp_app/core/utils/currency_formatter.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import '../../domain/entities/invoice_entity.dart';
import '../providers/invoice_providers.dart';

class InvoicePage extends ConsumerWidget {
  final String orderId;

  const InvoicePage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceAsync = ref.watch(orderInvoiceProvider(orderId));

    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const AppIcon(
            AppIcons.arrowBack,
            size: AppIconSizes.medium,
            color: AppColors.slate800,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Tax Invoice',
          style: AppTypography.headlineSmall.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.slate900,
          ),
        ),
        actions: [
          invoiceAsync.when(
            data: (invoice) => IconButton(
              icon: const AppIcon(
                AppIcons.copy,
                size: AppIconSizes.medium,
                color: AppColors.slate700,
              ),
              tooltip: 'Copy Invoice Details',
              onPressed: () {
                final summary = 'Shoppy GST Tax Invoice\n'
                    'Invoice No: ${invoice.invoiceNumber}\n'
                    'Date: ${_formatDate(invoice.invoiceDate)}\n'
                    'Order No: ${invoice.orderNumber}\n'
                    'Grand Total: ${CurrencyFormatter.format(invoice.totals.grandTotal)}\n'
                    'Seller: ${invoice.seller.tradeName} (GSTIN: ${invoice.seller.gstin})\n'
                    'Status: ${invoice.invoiceStatus}';
                Clipboard.setData(ClipboardData(text: summary));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invoice details copied to clipboard'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: invoiceAsync.when(
        data: (invoice) => _buildInvoiceContent(context, invoice),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIcon(
                  AppIcons.errorOutline,
                  size: AppIconSizes.xl,
                  color: AppColors.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load tax invoice',
                  style: AppTypography.headlineSmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.slate800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  err.toString().replaceAll('Exception: ', ''),
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => ref.invalidate(orderInvoiceProvider(orderId)),
                  icon: const AppIcon(
                    AppIcons.refresh,
                    size: AppIconSizes.small,
                    color: Colors.white,
                  ),
                  label: const Text('Retry'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInvoiceContent(BuildContext context, InvoiceEntity invoice) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Header Card with Status Badge
          _buildHeaderCard(invoice),
          const SizedBox(height: 16),

          // 2. Seller Information Card
          _buildSellerCard(invoice),
          const SizedBox(height: 16),

          // 3. Customer Billing & Shipping Card
          _buildCustomerAddressCard(invoice),
          const SizedBox(height: 16),

          // 4. Line Items Table / Cards
          _buildItemsCard(invoice),
          const SizedBox(height: 16),

          // 5. HSN / SAC Tax Summary Card
          _buildTaxSummaryCard(invoice),
          const SizedBox(height: 16),

          // 6. Payment & Delivery Card
          _buildPaymentAndDeliveryCard(invoice),
          const SizedBox(height: 16),

          // 7. Order Totals Card
          _buildTotalsCard(invoice),
          const SizedBox(height: 16),

          // 8. Legal Disclaimer Footer
          _buildFooter(invoice),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(InvoiceEntity invoice) {
    final isCancelled = invoice.isCancelled;
    final badgeColor = isCancelled ? AppColors.error : AppColors.success;
    final badgeBg = isCancelled ? AppColors.errorLight : AppColors.successLight;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TAX INVOICE',
                    style: AppTypography.headlineSmall.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Original for Recipient • GST Rules 2017',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.slate500,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Text(
                  invoice.invoiceStatus,
                  style: AppTypography.labelSmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: badgeColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: AppColors.slate200),
          _buildKeyValueRow('Invoice No:', invoice.invoiceNumber, isBold: true),
          const SizedBox(height: 6),
          _buildKeyValueRow('Invoice Date:', _formatDate(invoice.invoiceDate)),
          const SizedBox(height: 6),
          _buildKeyValueRow('Order No:', invoice.orderNumber),
          const SizedBox(height: 6),
          _buildKeyValueRow('Order Date:', _formatDate(invoice.orderDate)),
        ],
      ),
    );
  }

  Widget _buildSellerCard(InvoiceEntity invoice) {
    final seller = invoice.seller;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppIcon(
                AppIcons.store,
                size: AppIconSizes.small,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'SOLD BY (SELLER)',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.slate900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            seller.legalName,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.slate900,
            ),
          ),
          if (seller.tradeName.isNotEmpty && seller.tradeName != seller.legalName)
            Text(
              'Trade Name: ${seller.tradeName}',
              style: AppTypography.bodySmall.copyWith(color: AppColors.slate700),
            ),
          const SizedBox(height: 4),
          Text(
            '${seller.address}, ${seller.city}',
            style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
          ),
          Text(
            '${seller.state} - ${seller.pinCode}, ${seller.country}',
            style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.slate100,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildKeyValueRow('Seller GSTIN:', seller.gstin, isBold: true),
                if (seller.pan.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  _buildKeyValueRow('PAN:', seller.pan),
                ],
                if (seller.cin.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  _buildKeyValueRow('CIN:', seller.cin),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerAddressCard(InvoiceEntity invoice) {
    final bill = invoice.billingAddress;
    final ship = invoice.shippingAddress;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppIcon(
                AppIcons.address,
                size: AppIconSizes.small,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'BILLING & DELIVERY DETAILS',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.slate900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Bill To:',
            style: AppTypography.labelSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.slate700,
            ),
          ),
          Text(
            bill.fullName,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.slate900,
            ),
          ),
          Text(
            '${bill.addressLine1} ${bill.addressLine2}'.trim(),
            style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
          ),
          Text(
            '${bill.city}, ${bill.state} - ${bill.pinCode}',
            style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
          ),
          Text(
            'Phone: ${bill.phone}',
            style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
          ),
          const SizedBox(height: 6),
          Text(
            invoice.customerGstin.isNotEmpty
                ? 'Customer GSTIN: ${invoice.customerGstin}'
                : 'Customer Type: Unregistered Consumer',
            style: AppTypography.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: invoice.customerGstin.isNotEmpty ? AppColors.primary : AppColors.slate600,
            ),
          ),
          const Divider(height: 20, color: AppColors.slate200),
          Text(
            'Place of Supply:',
            style: AppTypography.labelSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.slate700,
            ),
          ),
          Text(
            '${ship.state} (${invoice.isInterState ? "Inter-State / IGST" : "Intra-State / CGST + SGST"})',
            style: AppTypography.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.slate800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsCard(InvoiceEntity invoice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppIcon(
                AppIcons.shoppingBag,
                size: AppIconSizes.small,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'ITEMS & TAX BREAKDOWN',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.slate900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...invoice.items.asMap().entries.map((entry) {
            final idx = entry.key;
            final item = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.slate50,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: AppColors.slate200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#${idx + 1} ',
                        style: AppTypography.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.slate500,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.productName,
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.slate900,
                          ),
                        ),
                      ),
                      Text(
                        CurrencyFormatter.format(item.lineTotal),
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.slate900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'SKU: ${item.sku}',
                        style: AppTypography.labelSmall.copyWith(color: AppColors.slate500),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'HSN: ${item.hsnCode}',
                        style: AppTypography.labelSmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.slate700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Qty: ${item.quantity} × ${CurrencyFormatter.format(item.unitPrice)}',
                        style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
                      ),
                      if (item.discount > 0)
                        Text(
                          'Disc: -${CurrencyFormatter.format(item.discount)}',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.error,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Taxable: ${CurrencyFormatter.format(item.taxableAmount)}',
                        style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
                      ),
                      Text(
                        invoice.isInterState
                            ? 'IGST (${item.gstRate}%): ${CurrencyFormatter.format(item.igst)}'
                            : 'GST (${item.gstRate}%): ${CurrencyFormatter.format(item.cgst + item.sgst)}',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.slate700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTaxSummaryCard(InvoiceEntity invoice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppIcon(
                AppIcons.tag,
                size: AppIconSizes.small,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'HSN / SAC TAX SUMMARY',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.slate900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Table(
            border: TableBorder.all(color: AppColors.slate200),
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1.8),
              2: FlexColumnWidth(1.0),
              3: FlexColumnWidth(1.8),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(color: AppColors.slate100),
                children: [
                  _buildTableCell('HSN', isHeader: true),
                  _buildTableCell('Taxable', isHeader: true),
                  _buildTableCell('Rate', isHeader: true),
                  _buildTableCell(invoice.isInterState ? 'IGST' : 'CGST+SGST', isHeader: true),
                ],
              ),
              ...invoice.taxSummary.map(
                (t) => TableRow(
                  children: [
                    _buildTableCell(t.hsnCode),
                    _buildTableCell(CurrencyFormatter.format(t.taxableAmount)),
                    _buildTableCell('${t.gstRate.toInt()}%'),
                    _buildTableCell(CurrencyFormatter.format(t.totalTax)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentAndDeliveryCard(InvoiceEntity invoice) {
    final isCod = invoice.isCod;
    final isPending = invoice.payment.status == 'PENDING';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppIcon(
                isCod ? AppIcons.cash : AppIcons.creditCard,
                size: AppIconSizes.small,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'PAYMENT & DELIVERY',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.slate900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildKeyValueRow('Payment Method:', isCod ? 'Cash on Delivery' : invoice.payment.method),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment Status:', style: AppTypography.bodySmall.copyWith(color: AppColors.slate600)),
              Container(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                 decoration: BoxDecoration(
                   color: isPending ? AppColors.warningLight : AppColors.successLight,
                   borderRadius: BorderRadius.circular(AppRadius.sm),
                 ),
                 child: Text(
                   isPending && isCod ? 'Pending (Pay on Delivery)' : invoice.payment.status,
                   style: AppTypography.labelSmall.copyWith(
                     fontWeight: FontWeight.bold,
                     color: isPending ? AppColors.warning : AppColors.success,
                   ),
                 ),
              ),
            ],
          ),
          if (invoice.payment.transactionId.isNotEmpty) ...[
            const SizedBox(height: 6),
            _buildKeyValueRow('Transaction ID:', invoice.payment.transactionId),
          ],
          const Divider(height: 20, color: AppColors.slate200),
          _buildKeyValueRow('Shipping Method:', invoice.shipping.methodName),
          const SizedBox(height: 6),
          _buildKeyValueRow('Delivery Zone:', invoice.shipping.shippingZone),
        ],
      ),
    );
  }

  Widget _buildTotalsCard(InvoiceEntity invoice) {
    final totals = invoice.totals;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppIcon(
                AppIcons.priceTag,
                size: AppIconSizes.small,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'ORDER TOTALS',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.slate900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildKeyValueRow('Items Subtotal:', CurrencyFormatter.format(totals.subtotal)),
          if (totals.discount > 0) ...[
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Promotional Discount:', style: AppTypography.bodySmall.copyWith(color: AppColors.error)),
                Text(
                  '-${CurrencyFormatter.format(totals.discount)}',
                  style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 6),
          _buildKeyValueRow('Net Taxable Value:', CurrencyFormatter.format(totals.taxableAmount)),
          const SizedBox(height: 6),
          if (!invoice.isInterState) ...[
            _buildKeyValueRow('CGST:', CurrencyFormatter.format(totals.cgst)),
            const SizedBox(height: 6),
            _buildKeyValueRow('SGST:', CurrencyFormatter.format(totals.sgst)),
          ] else ...[
            _buildKeyValueRow('IGST:', CurrencyFormatter.format(totals.igst)),
          ],
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee:', style: AppTypography.bodySmall.copyWith(color: AppColors.slate600)),
              Text(
                totals.shippingFee == 0 ? 'FREE' : CurrencyFormatter.format(totals.shippingFee),
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: totals.shippingFee == 0 ? AppColors.success : AppColors.slate900,
                ),
              ),
            ],
          ),
          if (totals.codFee > 0) ...[
            const SizedBox(height: 6),
            _buildKeyValueRow('Cash on Delivery (COD) Fee:', CurrencyFormatter.format(totals.codFee)),
          ],
          const Divider(height: 24, thickness: 1.5, color: AppColors.slate300),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grand Total:',
                style: AppTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.slate900,
                ),
              ),
              Text(
                CurrencyFormatter.format(totals.grandTotal),
                style: AppTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          if (totals.amountInWords.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Amount in Words: ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      totals.amountInWords,
                      style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFooter(InvoiceEntity invoice) {
    return Column(
      children: [
        Text(
          'This is a computer-generated tax invoice. No physical signature is required under the Information Technology Act, 2000.',
          textAlign: TextAlign.center,
          style: AppTypography.bodySmall.copyWith(
            fontSize: 10,
            color: AppColors.slate500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${invoice.seller.legalName} • CIN: ${invoice.seller.cin}',
          textAlign: TextAlign.center,
          style: AppTypography.bodySmall.copyWith(
            fontSize: 10,
            color: AppColors.slate400,
          ),
        ),
      ],
    );
  }

  Widget _buildKeyValueRow(String key, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: AppTypography.bodySmall.copyWith(color: AppColors.slate600),
        ),
        Text(
          value,
          style: AppTypography.bodySmall.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: AppColors.slate900,
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? AppColors.slate900 : AppColors.slate700,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
