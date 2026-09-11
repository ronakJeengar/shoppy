import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log_model.freezed.dart';

@freezed
abstract class AuditLogModel with _$AuditLogModel {
  const factory AuditLogModel({
    required String id,
    required String action,
    required String adminEmail,
    required String resourceType,
    required String resourceId,
    @Default({}) Map<String, dynamic> details,
    required DateTime createdAt,
  }) = _AuditLogModel;

  factory AuditLogModel.fromJson(Map<String, dynamic> json) {
    return AuditLogModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      action: json['action']?.toString() ?? 'UNKNOWN_ACTION',
      adminEmail: json['adminEmail']?.toString() ?? 'admin@shoppy.com',
      resourceType: json['resourceType']?.toString() ?? 'SYSTEM',
      resourceId: json['resourceId']?.toString() ?? '',
      details: json['details'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['details'] as Map)
          : {},
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}

extension AuditLogModelX on AuditLogModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'action': action,
      'adminEmail': adminEmail,
      'resourceType': resourceType,
      'resourceId': resourceId,
      'details': details,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

typedef AuditLog = AuditLogModel;
