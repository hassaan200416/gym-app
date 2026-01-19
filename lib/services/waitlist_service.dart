/// Service layer for waitlist operations.
/// 
/// Handles all interactions with the Supabase 'waitlist' table.
/// This service encapsulates database logic and provides a clean
/// interface for waitlist-related operations.
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/config/supabase_config.dart';

class WaitlistService {
  final SupabaseClient _client = SupabaseConfig.client;

  /// Adds an email address to the waitlist table.
  /// 
  /// Throws an exception if:
  /// - Email is invalid
  /// - Email already exists (unique constraint violation)
  /// - Network or database error occurs
  Future<void> addEmail(String email) async {
    await _client.from('waitlist').insert({
      'email': email,
    });
  }
}
