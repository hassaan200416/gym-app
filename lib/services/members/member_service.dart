import '../../core/config/supabase_config.dart';
import '../../models/member.dart';

class MemberService {
  static const String _table = 'members';

  static String _requireUserId() {
    final userId = SupabaseConfig.client.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated.');
    }
    return userId;
  }

  /// Fetch all members from Supabase.
  static Future<List<Member>> getMembers() async {
    try {
      final userId = _requireUserId();
      final response = await SupabaseConfig.client
          .from(_table)
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final data = response as List<dynamic>;
      return data
          .map((item) => Member.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Add a member with [name], [phone], and [membershipType].
  static Future<Member> addMember({
    required String name,
    required String phone,
    required String membershipType,
    DateTime? joinDate,
  }) async {
    try {
      final userId = _requireUserId();
      final response = await SupabaseConfig.client
          .from(_table)
          .insert({
            'name': name,
            'phone': phone,
            'membership_type': membershipType,
            'user_id': userId,
            if (joinDate != null) 'created_at': joinDate.toIso8601String(),
          })
          .select()
          .single();

      return Member.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  /// Update a member by [id].
  static Future<Member> updateMember({
    required String id,
    required String name,
    required String phone,
    required String membershipType,
    DateTime? joinDate,
  }) async {
    try {
      final userId = _requireUserId();
      final response = await SupabaseConfig.client
          .from(_table)
          .update({
            'name': name,
            'phone': phone,
            'membership_type': membershipType,
            if (joinDate != null) 'created_at': joinDate.toIso8601String(),
          })
          .eq('id', id)
          .eq('user_id', userId)
          .select()
          .single();

      return Member.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  /// Delete a member by [id].
  static Future<void> deleteMember(String id) async {
    try {
      final userId = _requireUserId();
      await SupabaseConfig.client
          .from(_table)
          .delete()
          .eq('id', id)
          .eq('user_id', userId);
    } catch (e) {
      rethrow;
    }
  }
}
