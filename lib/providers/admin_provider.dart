import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/admin_dashboard_model.dart';
import 'package:shopp_app/data/models/admin_user_model.dart';
import 'package:shopp_app/data/models/audit_log_model.dart';
import 'package:shopp_app/data/models/category_model.dart';
import 'package:shopp_app/data/models/order_model.dart';
import 'package:shopp_app/data/models/product_model.dart';
import 'package:shopp_app/data/repositories/admin_repository.dart';

class AdminProvider extends ChangeNotifier {
  final AdminRepository _adminRepo = AdminRepository();

  // Dashboard state
  AdminDashboardMetrics? _metrics;
  bool _isLoadingMetrics = false;
  String? _metricsError;

  // Products state
  List<Product> _products = [];
  bool _isLoadingProducts = false;
  String? _productsError;
  String? _selectedCategory;
  String _productSearch = '';
  String _productStatus = 'all';
  bool _productLowStockOnly = false;

  // Categories state
  List<CategoryModel> _categories = [];
  bool _isLoadingCategories = false;

  // Orders state
  List<OrderModel> _orders = [];
  bool _isLoadingOrders = false;
  String? _ordersError;
  String _selectedOrderStatus = 'ALL';
  String _orderSearch = '';

  // Users state
  List<AdminUserModel> _users = [];
  bool _isLoadingUsers = false;
  String? _usersError;
  String _userSearch = '';
  String? _userRoleFilter;

  // Audit Logs state
  List<AuditLogModel> _auditLogs = [];
  bool _isLoadingAuditLogs = false;
  String? _auditLogsError;

  // Getters
  AdminDashboardMetrics? get metrics => _metrics;
  bool get isLoadingMetrics => _isLoadingMetrics;
  String? get metricsError => _metricsError;

  void setMetricsForTesting(AdminDashboardMetrics metrics) {
    _metrics = metrics;
    _isLoadingMetrics = false;
    _metricsError = null;
    notifyListeners();
  }

  List<Product> get products => _products;
  bool get isLoadingProducts => _isLoadingProducts;
  String? get productsError => _productsError;
  String? get selectedCategory => _selectedCategory;
  String get productSearch => _productSearch;
  String get productStatus => _productStatus;
  bool get productLowStockOnly => _productLowStockOnly;

  List<CategoryModel> get categories => _categories;
  bool get isLoadingCategories => _isLoadingCategories;

  List<OrderModel> get orders => _orders;
  bool get isLoadingOrders => _isLoadingOrders;
  String? get ordersError => _ordersError;
  String get selectedOrderStatus => _selectedOrderStatus;
  String get orderSearch => _orderSearch;

  List<AdminUserModel> get users => _users;
  bool get isLoadingUsers => _isLoadingUsers;
  String? get usersError => _usersError;
  String get userSearch => _userSearch;
  String? get userRoleFilter => _userRoleFilter;

  List<AuditLogModel> get auditLogs => _auditLogs;
  bool get isLoadingAuditLogs => _isLoadingAuditLogs;
  String? get auditLogsError => _auditLogsError;

  void clearAdminState() {
    _metrics = null;
    _products = [];
    _categories = [];
    _orders = [];
    _users = [];
    _auditLogs = [];
    _isLoadingMetrics = false;
    _isLoadingProducts = false;
    _isLoadingOrders = false;
    _isLoadingUsers = false;
    _isLoadingAuditLogs = false;
    notifyListeners();
  }

  // 1. Dashboard
  Future<void> loadDashboard() async {
    _isLoadingMetrics = true;
    _metricsError = null;
    notifyListeners();

    try {
      final response = await _adminRepo.getDashboardMetrics();
      if (response.status && response.data is AdminDashboardMetrics) {
        _metrics = response.data as AdminDashboardMetrics;
      } else {
        _metricsError = response.message;
      }
    } catch (e) {
      log('AdminProvider loadDashboard error: $e');
      _metricsError = 'Failed to load dashboard metrics';
    } finally {
      _isLoadingMetrics = false;
      notifyListeners();
    }
  }

  // 2. Products
  Future<void> loadProducts({
    String? category,
    String? search,
    String? status,
    bool? lowStock,
  }) async {
    if (category != null) _selectedCategory = category.isEmpty ? null : category;
    if (search != null) _productSearch = search;
    if (status != null) _productStatus = status;
    if (lowStock != null) _productLowStockOnly = lowStock;

    _isLoadingProducts = true;
    _productsError = null;
    notifyListeners();

    try {
      final response = await _adminRepo.getAdminProducts(
        page: 1,
        limit: 50,
        category: _selectedCategory,
        search: _productSearch,
        status: _productStatus,
        lowStock: _productLowStockOnly,
      );

      if (response.status && response.data is List<Product>) {
        _products = response.data as List<Product>;
      } else {
        _productsError = response.message;
      }
    } catch (e) {
      log('AdminProvider loadProducts error: $e');
      _productsError = 'Failed to load products';
    } finally {
      _isLoadingProducts = false;
      notifyListeners();
    }
  }

  Future<bool> createProduct(Map<String, dynamic> data) async {
    try {
      final response = await _adminRepo.createProduct(data);
      if (response.status && response.data is Product) {
        _products.insert(0, response.data as Product);
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProvider createProduct error: $e');
      return false;
    }
  }

  Future<bool> updateProduct(String id, Map<String, dynamic> data) async {
    try {
      final response = await _adminRepo.updateProduct(id, data);
      if (response.status && response.data is Product) {
        final updated = response.data as Product;
        final index = _products.indexWhere((p) => p.id == id);
        if (index != -1) {
          _products[index] = updated;
          notifyListeners();
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProvider updateProduct error: $e');
      return false;
    }
  }

  Future<bool> updateStock(String id, int quantity, String operation) async {
    try {
      final response =
          await _adminRepo.updateProductStock(id, quantity, operation);
      if (response.status && response.data is Product) {
        final updated = response.data as Product;
        final index = _products.indexWhere((p) => p.id == id);
        if (index != -1) {
          _products[index] = updated;
          notifyListeners();
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProvider updateStock error: $e');
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final response = await _adminRepo.deleteProduct(id);
      if (response.status) {
        final index = _products.indexWhere((p) => p.id == id);
        if (index != -1) {
          // Update local status to inactive
          _products[index] = Product(
            id: _products[index].id,
            productName: _products[index].productName,
            sellerName: _products[index].sellerName,
            description: _products[index].description,
            price: _products[index].price,
            stock: _products[index].stock,
            productRating: _products[index].productRating,
            productImage: _products[index].productImage,
            categoryId: _products[index].categoryId,
            categoryName: _products[index].categoryName,
            isActive: false,
          );
          notifyListeners();
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProvider deleteProduct error: $e');
      return false;
    }
  }

  // 3. Categories
  Future<void> loadCategories() async {
    _isLoadingCategories = true;
    notifyListeners();

    try {
      final response = await _adminRepo.getAdminCategories();
      if (response.status && response.data is List<CategoryModel>) {
        _categories = response.data as List<CategoryModel>;
      }
    } catch (e) {
      log('AdminProvider loadCategories error: $e');
    } finally {
      _isLoadingCategories = false;
      notifyListeners();
    }
  }

  Future<bool> createCategory(String name) async {
    try {
      final response = await _adminRepo.createCategory(name);
      if (response.status) {
        await loadCategories();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // 4. Orders
  Future<void> loadOrders({String? status, String? search}) async {
    if (status != null) _selectedOrderStatus = status;
    if (search != null) _orderSearch = search;

    _isLoadingOrders = true;
    _ordersError = null;
    notifyListeners();

    try {
      final response = await _adminRepo.getAdminOrders(
        page: 1,
        limit: 50,
        status: _selectedOrderStatus,
        search: _orderSearch,
      );

      if (response.status && response.data is List<OrderModel>) {
        _orders = response.data as List<OrderModel>;
      } else {
        _ordersError = response.message;
      }
    } catch (e) {
      log('AdminProvider loadOrders error: $e');
      _ordersError = 'Failed to load orders';
    } finally {
      _isLoadingOrders = false;
      notifyListeners();
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
      final response = await _adminRepo.updateOrderStatus(
        id,
        status: status,
        carrier: carrier,
        trackingNumber: trackingNumber,
        note: note,
      );
      if (response.status && response.data is OrderModel) {
        final updated = response.data as OrderModel;
        final index = _orders.indexWhere((o) => o.id == id);
        if (index != -1) {
          _orders[index] = updated;
          notifyListeners();
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProvider updateOrderStatus error: $e');
      return false;
    }
  }

  // 5. Users
  Future<void> loadUsers({String? search, String? role}) async {
    if (search != null) _userSearch = search;
    if (role != null) _userRoleFilter = role.isEmpty ? null : role;

    _isLoadingUsers = true;
    _usersError = null;
    notifyListeners();

    try {
      final response = await _adminRepo.getAdminUsers(
        page: 1,
        limit: 50,
        search: _userSearch,
        role: _userRoleFilter,
      );

      if (response.status && response.data is List<AdminUserModel>) {
        _users = response.data as List<AdminUserModel>;
      } else {
        _usersError = response.message;
      }
    } catch (e) {
      log('AdminProvider loadUsers error: $e');
      _usersError = 'Failed to load users';
    } finally {
      _isLoadingUsers = false;
      notifyListeners();
    }
  }

  Future<bool> updateUserStatus(String id, bool isActive) async {
    try {
      final response = await _adminRepo.updateUserStatus(id, isActive);
      if (response.status) {
        final index = _users.indexWhere((u) => u.id == id);
        if (index != -1) {
          _users[index] = _users[index].copyWith(isActive: isActive);
          notifyListeners();
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProvider updateUserStatus error: $e');
      return false;
    }
  }

  Future<bool> updateUserRole(String id, String role) async {
    try {
      final response = await _adminRepo.updateUserRole(id, role);
      if (response.status) {
        final index = _users.indexWhere((u) => u.id == id);
        if (index != -1) {
          _users[index] = _users[index].copyWith(role: role);
          notifyListeners();
        }
        return true;
      }
      return false;
    } catch (e) {
      log('AdminProvider updateUserRole error: $e');
      return false;
    }
  }

  // 6. Audit Logs
  Future<void> loadAuditLogs() async {
    _isLoadingAuditLogs = true;
    _auditLogsError = null;
    notifyListeners();

    try {
      final response = await _adminRepo.getAuditLogs(page: 1, limit: 50);
      if (response.status && response.data is List<AuditLogModel>) {
        _auditLogs = response.data as List<AuditLogModel>;
      } else {
        _auditLogsError = response.message;
      }
    } catch (e) {
      log('AdminProvider loadAuditLogs error: $e');
      _auditLogsError = 'Failed to load audit logs';
    } finally {
      _isLoadingAuditLogs = false;
      notifyListeners();
    }
  }
}
