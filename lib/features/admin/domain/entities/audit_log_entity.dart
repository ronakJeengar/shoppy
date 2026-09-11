import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log_entity.freezed.dart';

@freezed
abstract class AuditLogEntity with _$AuditLogEntity {
  const factory AuditLogEntity({
    required String id,
    required String action,
    required String adminEmail,
    required String resourceType,
    required String resourceId,
    @Default({}) Map<String, dynamic> details,
    required DateTime createdAt,
  }) = _AuditLogEntity;
}
