class Member {
  final String id;
  final String name;
  final String phone;
  final String membershipType;
  final DateTime? joinDate;
  final DateTime? createdAt;
  final String? userId;

  const Member({
    required this.id,
    required this.name,
    required this.phone,
    required this.membershipType,
    this.joinDate,
    this.createdAt,
    this.userId,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    final createdAtStr = json['created_at'] as String?;
    final createdAt = createdAtStr != null ? DateTime.tryParse(createdAtStr) : null;

    return Member(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      membershipType: json['membership_type'] as String? ?? '',
      joinDate: createdAt,
      createdAt: createdAt,
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'membership_type': membershipType,
      if (joinDate != null) 'created_at': joinDate!.toIso8601String(),
      if (userId != null) 'user_id': userId,
    };
  }
}
