import '../../../../constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/coupon_model.dart';

abstract class CouponRemoteDataSource {
  Future<List<CouponModel>> getAvailableCoupons();
  Future<AppliedCouponModel> validateCoupon(String code, {double? subtotal});
}

class CouponRemoteDataSourceImpl implements CouponRemoteDataSource {
  final ApiClient _client;

  CouponRemoteDataSourceImpl(this._client);

  @override
  Future<List<CouponModel>> getAvailableCoupons() async {
    final response = await _client.get(Urls.couponsAvailable);
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data);
    final rawList = map is Map<String, dynamic>
        ? (map['coupons'] ?? [])
        : (map is List ? map : []);

    final List<CouponModel> coupons = [];
    if (rawList is List) {
      for (final item in rawList) {
        if (item is Map<String, dynamic>) {
          coupons.add(CouponModel.fromJson(item));
        }
      }
    }
    return coupons;
  }

  @override
  Future<AppliedCouponModel> validateCoupon(
    String code, {
    double? subtotal,
  }) async {
    final response = await _client.post(
      Urls.couponValidate,
      data: {
        'code': code,
        if (subtotal != null) 'subtotal': subtotal,
      },
    );
    final data = response.data;
    final map = (data is Map<String, dynamic> ? (data['data'] ?? data) : data)
        as Map<String, dynamic>;
    final couponMap = map['coupon'] is Map<String, dynamic>
        ? map['coupon'] as Map<String, dynamic>
        : map;
    return AppliedCouponModel.fromJson(couponMap);
  }
}
