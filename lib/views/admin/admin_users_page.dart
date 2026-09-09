import 'package:flutter/material.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/data/models/admin_user_model.dart';
import 'package:shopp_app/features/admin/presentation/providers/admin_providers.dart';

class AdminUsersPage extends ConsumerStatefulWidget {
  const AdminUsersPage({super.key});

  @override
  ConsumerState<AdminUsersPage> createState() => _AdminUsersPageState();
}

class _AdminUsersPageState extends ConsumerState<AdminUsersPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminUsersNotifierProvider.notifier).loadUsers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _confirmToggleStatus(BuildContext context, AdminUserModel user) {
    final newStatus = !user.isActive;
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: Text(newStatus ? 'Activate User' : 'Suspend User'),
        content: Text(
          newStatus
              ? 'Re-activate "${user.fullName}"? They will regain access to sign in.'
              : 'Suspend "${user.fullName}"? They will be immediately blocked from signing in.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: newStatus ? Colors.green : Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.pop(dialogCtx);
              final success = await ref
                  .read(adminUsersNotifierProvider.notifier)
                  .updateUserStatus(user.id, newStatus);
              if (!mounted) return;
              if (success) {
                ScaffoldMessenger.of(this.context).showSnackBar(
                  SnackBar(
                    content: Text(newStatus
                        ? 'User activated successfully'
                        : 'User suspended successfully'),
                    backgroundColor: newStatus ? Colors.green : Colors.orange,
                  ),
                );
              }
            },
            child: Text(newStatus ? 'Activate' : 'Suspend'),
          ),
        ],
      ),
    );
  }

  void _confirmRoleChange(BuildContext context, AdminUserModel user) {
    final newRole = user.role == 'ADMIN' ? 'CUSTOMER' : 'ADMIN';
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Change User Role'),
        content: Text(
          'Change "${user.fullName}" role from ${user.role} to $newRole?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(dialogCtx);
              final success = await ref
                  .read(adminUsersNotifierProvider.notifier)
                  .updateUserRole(user.id, newRole);
              if (!mounted) return;
              if (success) {
                ScaffoldMessenger.of(this.context).showSnackBar(
                  SnackBar(
                    content: Text('Role updated to $newRole successfully'),
                    backgroundColor: Colors.blue,
                  ),
                );
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usersState = ref.watch(adminUsersNotifierProvider);
    final usersNotifier = ref.read(adminUsersNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users by name or email...',
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(12),
                  child: AppIcon(AppIcons.search, size: 20),
                ),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const AppIcon(AppIcons.close, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          usersNotifier.loadUsers(search: '');
                        },
                      )
                    : null,
              ),
              onSubmitted: (query) {
                usersNotifier.loadUsers(search: query);
              },
            ),
          ),

          // User Directory List
          Expanded(
            child: usersState.isLoading && usersState.users.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : usersState.users.isEmpty
                    ? const Center(
                        child: Text(
                          'No users found matching search criteria',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => usersNotifier.loadUsers(),
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
                          itemCount: usersState.users.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final u = usersState.users[index];

                            return Card(
                              elevation: 0.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: u.isActive
                                      ? Colors.grey.shade200
                                      : Colors.red.shade200,
                                ),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: u.role == 'ADMIN'
                                      ? Colors.purple.shade100
                                      : Colors.blue.shade100,
                                  child: Text(
                                    u.fullName.isNotEmpty
                                        ? u.fullName[0].toUpperCase()
                                        : 'U',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: u.role == 'ADMIN'
                                          ? Colors.purple.shade900
                                          : Colors.blue.shade900,
                                    ),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        u.fullName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: u.isActive
                                              ? null
                                              : TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: u.role == 'ADMIN'
                                            ? Colors.purple.shade50
                                            : Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        u.role,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: u.role == 'ADMIN'
                                              ? Colors.purple.shade700
                                              : Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: u.isActive
                                            ? Colors.green.shade50
                                            : Colors.red.shade50,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        u.isActive ? 'ACTIVE' : 'SUSPENDED',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: u.isActive
                                              ? Colors.green.shade700
                                              : Colors.red.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  u.email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                trailing: PopupMenuButton<String>(
                                  onSelected: (val) {
                                    if (val == 'status') {
                                      _confirmToggleStatus(context, u);
                                    } else if (val == 'role') {
                                      _confirmRoleChange(context, u);
                                    }
                                  },
                                  itemBuilder: (ctx) => [
                                    PopupMenuItem(
                                      value: 'status',
                                      child: Text(u.isActive
                                          ? 'Suspend User'
                                          : 'Activate User'),
                                    ),
                                    PopupMenuItem(
                                      value: 'role',
                                      child: Text(u.role == 'ADMIN'
                                          ? 'Demote to Customer'
                                          : 'Promote to Admin'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
