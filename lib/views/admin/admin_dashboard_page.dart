import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app/data/models/admin_dashboard_model.dart';
import 'package:shopp_app/providers/admin_provider.dart';
import 'package:shopp_app/views/admin/admin_audit_logs_page.dart';
import 'package:shopp_app/views/admin/admin_orders_page.dart';
import 'package:shopp_app/views/admin/admin_products_page.dart';
import 'package:shopp_app/views/admin/admin_users_page.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminProvider>().loadDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final adminProvider = context.watch<AdminProvider>();
    final metrics = adminProvider.metrics;
    final displayMetrics = metrics ??
        AdminDashboardMetrics(
          totalUsers: 0,
          totalProducts: 0,
          totalOrders: 0,
          totalRevenue: 0.0,
          lowStockProducts: 0,
          ordersByStatus: {},
          recentOrders: [],
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Metrics',
            onPressed: () => adminProvider.loadDashboard(),
          ),
        ],
      ),
      body: adminProvider.isLoadingMetrics && metrics == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => adminProvider.loadDashboard(),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (adminProvider.metricsError != null && metrics == null) ...[
                    Card(
                      color: Colors.orange.shade50,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.orange.shade200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(Icons.cloud_off_outlined,
                                color: Colors.orange, size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                adminProvider.metricsError!,
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // 1. Top KPI Summary Grid
                  _buildKPIGrid(displayMetrics),
                  const SizedBox(height: 16),

                  // 2. Low Stock Alert Banner (if any)
                  if (displayMetrics.lowStockProducts > 0)
                    _buildLowStockBanner(
                        context, displayMetrics.lowStockProducts),

                  // 3. Quick Navigation Hub
                  const SizedBox(height: 16),
                  const Text(
                    'Store Administration',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildQuickNavHub(context),
                  const SizedBox(height: 20),

                  // 4. Order Breakdown
                  const Text(
                    'Orders by Status',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildOrderStatusBreakdown(displayMetrics),
                  const SizedBox(height: 20),

                  // 5. Recent Orders Preview
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Orders',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AdminOrdersPage(),
                          ),
                        ),
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildRecentOrdersList(displayMetrics),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }

  Widget _buildKPIGrid(dynamic metrics) {
    final revenue = metrics?.totalRevenue ?? 0.0;
    final orders = metrics?.totalOrders ?? 0;
    final products = metrics?.totalProducts ?? 0;
    final users = metrics?.totalUsers ?? 0;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.45,
      children: [
        _buildKPICard(
          title: 'Total Revenue',
          value: '\$${revenue.toStringAsFixed(2)}',
          icon: Icons.attach_money,
          color: Colors.green,
        ),
        _buildKPICard(
          title: 'Total Orders',
          value: '$orders',
          icon: Icons.shopping_bag_outlined,
          color: Colors.blue,
        ),
        _buildKPICard(
          title: 'Active Products',
          value: '$products',
          icon: Icons.inventory_2_outlined,
          color: Colors.orange,
        ),
        _buildKPICard(
          title: 'Total Users',
          value: '$users',
          icon: Icons.people_outline,
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildKPICard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CircleAvatar(
                  radius: 14,
                  backgroundColor: color.withValues(alpha: 0.1),
                  child: Icon(icon, size: 16, color: color),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLowStockBanner(BuildContext context, int count) {
    return Card(
      color: Colors.red.shade50,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.red.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.red),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$count Products Low in Stock',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.red.shade900,
                    ),
                  ),
                  Text(
                    'Items with 10 or fewer units remaining',
                    style: TextStyle(fontSize: 11, color: Colors.red.shade700),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const AdminProductsPage(initialLowStockOnly: true),
                ),
              ),
              child: const Text('Inspect'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickNavHub(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildNavButton(
            context,
            icon: Icons.inventory_2_outlined,
            label: 'Products',
            color: Colors.blue,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AdminProductsPage()),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildNavButton(
            context,
            icon: Icons.receipt_long_outlined,
            label: 'Orders',
            color: Colors.indigo,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AdminOrdersPage()),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildNavButton(
            context,
            icon: Icons.people_outline,
            label: 'Users',
            color: Colors.teal,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AdminUsersPage()),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildNavButton(
            context,
            icon: Icons.history_edu_outlined,
            label: 'Audit',
            color: Colors.deepPurple,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AdminAuditLogsPage()),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: color.withValues(alpha: 0.1),
              child: Icon(icon, size: 18, color: color),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatusBreakdown(dynamic metrics) {
    final statusMap = metrics?.ordersByStatus as Map<String, int>? ?? {};

    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            _buildStatusRow(
              'Confirmed',
              statusMap['CONFIRMED'] ?? 0,
              Colors.green,
            ),
            const Divider(height: 16),
            _buildStatusRow(
              'Processing',
              statusMap['PROCESSING'] ?? 0,
              Colors.blue,
            ),
            const Divider(height: 16),
            _buildStatusRow(
              'Shipped',
              statusMap['SHIPPED'] ?? 0,
              Colors.indigo,
            ),
            const Divider(height: 16),
            _buildStatusRow(
              'Delivered',
              statusMap['DELIVERED'] ?? 0,
              Colors.teal,
            ),
            const Divider(height: 16),
            _buildStatusRow(
              'Cancelled',
              statusMap['CANCELLED'] ?? 0,
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, int count, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 13)),
          ],
        ),
        Text(
          '$count',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildRecentOrdersList(dynamic metrics) {
    final recent = metrics?.recentOrders as List? ?? [];
    if (recent.isEmpty) {
      return Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              'No orders recorded yet',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recent.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final o = recent[index];
        return Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            title: Text(
              o.orderNumber,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Text(
              '${o.customerName} • \$${o.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Text(
                o.status,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
