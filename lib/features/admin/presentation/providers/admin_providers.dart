import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../data/models/admin_dashboard_model.dart';
import '../../../../data/models/admin_user_model.dart';
import '../../../../data/models/audit_log_model.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/models/review_model.dart';
import '../../../../data/repositories/admin_repository.dart' as legacy_admin;
import '../../../../data/repositories/review_repository.dart' as legacy_review;

final legacyAdminRepoProvider = Provider<legacy_admin.AdminRepository>((ref) {
  return legacy_admin.AdminRepository();
});

final legacyReviewRepoProvider = Provider<legacy_review.ReviewRepository>((ref) {
  return legacy_review.ReviewRepository();
});

// ==========================================
// 1. DASHBOARD
// ==========================================
class AdminDashboardState {
  final AdminDashboardMetrics? metrics;
  final bool isLoading;
  final String? error;

  const AdminDashboardState({
    this.metrics,
    this.isLoading = false,
    this.error,
  });

  AdminDashboardState copyWith({
    AdminDashboardMetrics? metrics,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return AdminDashboardState(
      metrics: metrics ?? this.metrics,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class AdminDashboardNotifier extends StateNotifier<AdminDashboardState> {
  final legacy_admin.AdminRepository _repo;

  AdminDashboardNotifier(this._repo) : super(const AdminDashboardState()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _repo.getDashboardMetrics();
      if (response.status && response.data is AdminDashboardMetrics) {
        state = state.copyWith(
          metrics: response.data as AdminDashboardMetrics,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          error: response.message,
          isLoading: false,
        );
      }
    } catch (e) {
      log('AdminDashboardNotifier loadDashboard error: $e');
      state = state.copyWith(
        error: 'Failed to load dashboard metrics',
        isLoading: false,
      );
    }
  }
}

final adminDashboardNotifierProvider =
    StateNotifierProvider<AdminDashboardNotifier, AdminDashboardState>((ref) {
  return AdminDashboardNotifier(ref.watch(legacyAdminRepoProvider));
});

// ==========================================
// 2. PRODUCTS & CATEGORIES
// ==========================================
class AdminProductsState {
  final List<Product> products;
  final List<CategoryModel> categories;
  final bool isLoading;
  final bool isLoadingCategories;
  final String? error;
  final String? selectedCategory;
  final String search;
  final String status;
  final bool lowStockOnly;

  const AdminProductsState({
    this.products = const [],
    this.categories = const [],
    this.isLoading = false,
    this.isLoadingCategories = false,
    this.error,
    this.selectedCategory,
    this.search = '',
    this.status = 'all',
    this.lowStockOnly = false,
  });

  AdminProductsState copyWith({
    List<Product>? products,
    List<CategoryModel>? categories,
    bool? isLoading,
    bool? isLoadingCategories,
    String? error,
    bool clearError = false,
    String? selectedCategory,
    bool clearCategory = false,
    String? search,
    String? status,
    bool? lowStockOnly,
  }) {
    return AdminProductsState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      error: clearError ? null : (error ?? this.error),
      selectedCategory: clearCategory
          ? null
          : (selectedCategory ?? this.selectedCategory),
      search: search ?? this.search,
      status: status ?? this.status,
      lowStockOnly: lowStockOnly ?? this.lowStockOnly,
    );
  }
}

class AdminProductsNotifier extends StateNotifier<AdminProductsState> {
  final legacy_admin.AdminRepository _repo;

  AdminProductsNotifier(this._repo) : super(const AdminProductsState());

  Future<void> loadCategories() async {
    state = state.copyWith(isLoadingCategories: true);
    try {
      final response = await _repo.getAdminCategories();
      if (response.status && response.data is List<CategoryModel>) {
        state = state.copyWith(
          categories: response.data as List<CategoryModel>,
          isLoadingCategories: false,
        );
      } else {
        state = state.copyWith(isLoadingCategories: false);
      }
    } catch (e) {
      log('AdminProductsNotifier loadCategories error: $e');
      state = state.copyWith(isLoadingCategories: false);
    }
  }

  Future<void> loadProducts({
    String? category,
    String? search,
    String? status,
    bool? lowStock,
  }) async {
    final selCat =
        category != null ? (category.isEmpty ? null : category) : state.selectedCategory;
    final sQuery = search ?? state.search;
    final sStatus = status ?? state.status;
    final sLowStock = lowStock ?? state.lowStockOnly;

    state = state.copyWith(
      selectedCategory: selCat,
      clearCategory: category != null && category.isEmpty,
      search: sQuery,
      status: sStatus,
      lowStockOnly: sLowStock,
      isLoading: true,
      clearError: true,
    );

    try {
      final response = await _repo.getAdminProducts(
        page: 1,
        limit: 50,
        category: selCat,
        search: sQuery,
        status: sStatus,
        lowStock: sLowStock,
      );

      if (response.status && response.data is List<Product>) {
        state = state.copyWith(
          products: response.data as List<Product>,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          error: response.message,
          isLoading: false,
        );
      }
    } catch (e) {
      log('AdminProductsNotifier loadProducts error: $e');
      state = state.copyWith(
        error: 'Failed to load products',
        isLoading: false,
      );
    }
  }

  Future<bool> createProduct(Map<String, dynamic> data) async {
    try {
      final response = await _repo.createProduct(data);
      if (response.status && response.data is Product) {
        state = state.copyWith(
          products: [response.data as Product, ...state.products],
        );
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProductsNotifier createProduct error: $e');
      return false;
    }
  }

  Future<bool> updateProduct(String id, Map<String, dynamic> data) async {
    try {
      final response = await _repo.updateProduct(id, data);
      if (response.status && response.data is Product) {
        final updated = response.data as Product;
        final list = [...state.products];
        final index = list.indexWhere((p) => p.id == id);
        if (index != -1) {
          list[index] = updated;
          state = state.copyWith(products: list);
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProductsNotifier updateProduct error: $e');
      return false;
    }
  }

  Future<bool> updateStock(String id, int quantity, String operation) async {
    try {
      final response = await _repo.updateProductStock(id, quantity, operation);
      if (response.status && response.data is Product) {
        final updated = response.data as Product;
        final list = [...state.products];
        final index = list.indexWhere((p) => p.id == id);
        if (index != -1) {
          list[index] = updated;
          state = state.copyWith(products: list);
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProductsNotifier updateStock error: $e');
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final response = await _repo.deleteProduct(id);
      if (response.status) {
        final list = [...state.products];
        final index = list.indexWhere((p) => p.id == id);
        if (index != -1) {
          list[index] = Product(
            id: list[index].id,
            productName: list[index].productName,
            sellerName: list[index].sellerName,
            description: list[index].description,
            price: list[index].price,
            stock: list[index].stock,
            productRating: list[index].productRating,
            productImage: list[index].productImage,
            categoryId: list[index].categoryId,
            categoryName: list[index].categoryName,
            isActive: false,
          );
          state = state.copyWith(products: list);
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProductsNotifier deleteProduct error: $e');
      return false;
    }
  }
}

final adminProductsNotifierProvider =
    StateNotifierProvider<AdminProductsNotifier, AdminProductsState>((ref) {
  return AdminProductsNotifier(ref.watch(legacyAdminRepoProvider));
});

// ==========================================
// 3. ORDERS
// ==========================================
class AdminOrdersState {
  final List<OrderModel> orders;
  final bool isLoading;
  final String? error;
  final String selectedStatus;
  final String search;

  const AdminOrdersState({
    this.orders = const [],
    this.isLoading = false,
    this.error,
    this.selectedStatus = 'ALL',
    this.search = '',
  });

  AdminOrdersState copyWith({
    List<OrderModel>? orders,
    bool? isLoading,
    String? error,
    bool clearError = false,
    String? selectedStatus,
    String? search,
  }) {
    return AdminOrdersState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      selectedStatus: selectedStatus ?? this.selectedStatus,
      search: search ?? this.search,
    );
  }
}

class AdminOrdersNotifier extends StateNotifier<AdminOrdersState> {
  final legacy_admin.AdminRepository _repo;

  AdminOrdersNotifier(this._repo) : super(const AdminOrdersState());

  Future<void> loadOrders({String? status, String? search}) async {
    final sStatus = status ?? state.selectedStatus;
    final sSearch = search ?? state.search;

    state = state.copyWith(
      selectedStatus: sStatus,
      search: sSearch,
      isLoading: true,
      clearError: true,
    );

    try {
      final response = await _repo.getAdminOrders(
        page: 1,
        limit: 50,
        status: sStatus,
        search: sSearch,
      );

      if (response.status && response.data is List<OrderModel>) {
        state = state.copyWith(
          orders: response.data as List<OrderModel>,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          error: response.message,
          isLoading: false,
        );
      }
    } catch (e) {
      log('AdminOrdersNotifier loadOrders error: $e');
      state = state.copyWith(
        error: 'Failed to load orders',
        isLoading: false,
      );
    }
  }

  Future<bool> updateOrderStatus(
    String id, {
    required String status,
    String? carrier,
    String? trackingNumber,
    String? note,
  }) async {
    try {
      final response = await _repo.updateOrderStatus(
        id,
        status: status,
        carrier: carrier,
        trackingNumber: trackingNumber,
        note: note,
      );
      if (response.status && response.data is OrderModel) {
        final updated = response.data as OrderModel;
        final list = [...state.orders];
        final index = list.indexWhere((o) => o.id == id);
        if (index != -1) {
          list[index] = updated;
          state = state.copyWith(orders: list);
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminOrdersNotifier updateOrderStatus error: $e');
      return false;
    }
  }
}

final adminOrdersNotifierProvider =
    StateNotifierProvider<AdminOrdersNotifier, AdminOrdersState>((ref) {
  return AdminOrdersNotifier(ref.watch(legacyAdminRepoProvider));
});

// ==========================================
// 4. USERS
// ==========================================
class AdminUsersState {
  final List<AdminUserModel> users;
  final bool isLoading;
  final String? error;
  final String search;
  final String? roleFilter;

  const AdminUsersState({
    this.users = const [],
    this.isLoading = false,
    this.error,
    this.search = '',
    this.roleFilter,
  });

  AdminUsersState copyWith({
    List<AdminUserModel>? users,
    bool? isLoading,
    String? error,
    bool clearError = false,
    String? search,
    String? roleFilter,
    bool clearRoleFilter = false,
  }) {
    return AdminUsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      search: search ?? this.search,
      roleFilter: clearRoleFilter ? null : (roleFilter ?? this.roleFilter),
    );
  }
}

class AdminUsersNotifier extends StateNotifier<AdminUsersState> {
  final legacy_admin.AdminRepository _repo;

  AdminUsersNotifier(this._repo) : super(const AdminUsersState());

  Future<void> loadUsers({String? search, String? role}) async {
    final sSearch = search ?? state.search;
    final sRole = role != null ? (role.isEmpty ? null : role) : state.roleFilter;

    state = state.copyWith(
      search: sSearch,
      roleFilter: sRole,
      clearRoleFilter: role != null && role.isEmpty,
      isLoading: true,
      clearError: true,
    );

    try {
      final response = await _repo.getAdminUsers(
        page: 1,
        limit: 50,
        search: sSearch,
        role: sRole,
      );

      if (response.status && response.data is List<AdminUserModel>) {
        state = state.copyWith(
          users: response.data as List<AdminUserModel>,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          error: response.message,
          isLoading: false,
        );
      }
    } catch (e) {
      log('AdminUsersNotifier loadUsers error: $e');
      state = state.copyWith(
        error: 'Failed to load users',
        isLoading: false,
      );
    }
  }

  Future<bool> updateUserStatus(String id, bool isActive) async {
    try {
      final response = await _repo.updateUserStatus(id, isActive);
      if (response.status) {
        final list = [...state.users];
        final index = list.indexWhere((u) => u.id == id);
        if (index != -1) {
          list[index] = list[index].copyWith(isActive: isActive);
          state = state.copyWith(users: list);
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminUsersNotifier updateUserStatus error: $e');
      return false;
    }
  }

  Future<bool> updateUserRole(String id, String role) async {
    try {
      final response = await _repo.updateUserRole(id, role);
      if (response.status) {
        final list = [...state.users];
        final index = list.indexWhere((u) => u.id == id);
        if (index != -1) {
          list[index] = list[index].copyWith(role: role);
          state = state.copyWith(users: list);
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminUsersNotifier updateUserRole error: $e');
      return false;
    }
  }
}

final adminUsersNotifierProvider =
    StateNotifierProvider<AdminUsersNotifier, AdminUsersState>((ref) {
  return AdminUsersNotifier(ref.watch(legacyAdminRepoProvider));
});

// ==========================================
// 5. REVIEWS
// ==========================================
class AdminReviewsState {
  final List<AdminReviewModel> reviews;
  final bool isLoading;
  final String? error;
  final String search;
  final String statusFilter;

  const AdminReviewsState({
    this.reviews = const [],
    this.isLoading = false,
    this.error,
    this.search = '',
    this.statusFilter = 'ALL',
  });

  AdminReviewsState copyWith({
    List<AdminReviewModel>? reviews,
    bool? isLoading,
    String? error,
    bool clearError = false,
    String? search,
    String? statusFilter,
  }) {
    return AdminReviewsState(
      reviews: reviews ?? this.reviews,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      search: search ?? this.search,
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}

class AdminReviewsNotifier extends StateNotifier<AdminReviewsState> {
  final legacy_review.ReviewRepository _repo;

  AdminReviewsNotifier(this._repo) : super(const AdminReviewsState());

  Future<void> loadReviews({String? search, String? status}) async {
    final sSearch = search ?? state.search;
    final sStatus = status ?? state.statusFilter;

    state = state.copyWith(
      search: sSearch,
      statusFilter: sStatus,
      isLoading: true,
      clearError: true,
    );

    try {
      final response = await _repo.getAdminReviews(
        page: 1,
        limit: 50,
        status: sStatus == 'ALL' ? null : sStatus,
        search: sSearch.isEmpty ? null : sSearch,
      );

      if (response.status && response.data is List<AdminReviewModel>) {
        state = state.copyWith(
          reviews: response.data as List<AdminReviewModel>,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          error: response.message,
          isLoading: false,
        );
      }
    } catch (e) {
      log('AdminReviewsNotifier loadReviews error: $e');
      state = state.copyWith(
        error: 'Failed to load reviews',
        isLoading: false,
      );
    }
  }

  Future<bool> moderateReview(
    String reviewId, {
    required String status,
    String? reason,
  }) async {
    try {
      final response = await _repo.updateAdminReviewStatus(
        reviewId,
        status: status,
        reason: reason,
      );

      if (response.status) {
        final list = [...state.reviews];
        final idx = list.indexWhere((r) => r.id == reviewId);
        if (idx != -1) {
          list[idx] = list[idx].copyWith(status: status);
          state = state.copyWith(reviews: list);
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminReviewsNotifier moderateReview error: $e');
      return false;
    }
  }
}

final adminReviewsNotifierProvider =
    StateNotifierProvider<AdminReviewsNotifier, AdminReviewsState>((ref) {
  return AdminReviewsNotifier(ref.watch(legacyReviewRepoProvider));
});

// ==========================================
// 6. AUDIT LOGS
// ==========================================
class AdminAuditLogsState {
  final List<AuditLogModel> logs;
  final bool isLoading;
  final String? error;

  const AdminAuditLogsState({
    this.logs = const [],
    this.isLoading = false,
    this.error,
  });

  AdminAuditLogsState copyWith({
    List<AuditLogModel>? logs,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return AdminAuditLogsState(
      logs: logs ?? this.logs,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class AdminAuditLogsNotifier extends StateNotifier<AdminAuditLogsState> {
  final legacy_admin.AdminRepository _repo;

  AdminAuditLogsNotifier(this._repo) : super(const AdminAuditLogsState());

  Future<void> loadAuditLogs() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _repo.getAuditLogs(page: 1, limit: 50);
      if (response.status && response.data is List<AuditLogModel>) {
        state = state.copyWith(
          logs: response.data as List<AuditLogModel>,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          error: response.message,
          isLoading: false,
        );
      }
    } catch (e) {
      log('AdminAuditLogsNotifier loadAuditLogs error: $e');
      state = state.copyWith(
        error: 'Failed to load audit logs',
        isLoading: false,
      );
    }
  }
}

final adminAuditLogsNotifierProvider =
    StateNotifierProvider<AdminAuditLogsNotifier, AdminAuditLogsState>((ref) {
  return AdminAuditLogsNotifier(ref.watch(legacyAdminRepoProvider));
});
