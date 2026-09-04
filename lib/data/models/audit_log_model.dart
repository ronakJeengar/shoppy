class AuditLogModel {
  final String id;
  final String action;
  final String adminEmail;
  final String resourceType;
  final String resourceId;
  final Map<String, dynamic> details;
  final DateTime createdAt;

  AuditLogModel({
    required this.id,
    required this.action,
    required this.adminEmail,
    required this.resourceType,
    required this.resourceId,
    required this.details,
    required this.createdAt,
  });

  factory AuditLogModel.fromJson(Map<String, dynamic> json) {
    return AuditLogModel(
      id: json['id']?.toString() ?? json['_id']?.toString() ?? '',
      action: json['action']?.toString() ?? 'UNKNOWN_ACTION',
      adminEmail: json['adminEmail']?.toString() ?? 'admin@shoppy.com',
      resourceType: json['resourceType']?.toString() ?? 'SYSTEM',
      resourceId: json['resourceId']?.toString() ?? '',
      details: json['details'] is Map<String, dynamic>
          ? json['details'] as Map<String, dynamic>
          : {},
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
