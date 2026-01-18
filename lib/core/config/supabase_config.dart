import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  // Supabase project URL
  static const String supabaseUrl = 'https://mmuanpezzzbijukfddgk.supabase.co';
  
  // Supabase anon/public key
  static const String supabaseAnonKey = 'sb_publishable_s_JGVSOfzrPQ5yRGWdd4qA_Q_W5vFVJ';

  /// Initialize Supabase client
  /// Call this once before runApp in main.dart
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  /// Get the Supabase client instance
  static SupabaseClient get client => Supabase.instance.client;
}
