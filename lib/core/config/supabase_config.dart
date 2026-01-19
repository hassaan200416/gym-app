/// Centralized configuration and initialization for Supabase backend services.
/// 
/// This class provides a single point of configuration for Supabase credentials
/// and manages the global Supabase client instance. All Supabase operations
/// throughout the app should use the client provided by this class.
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  /// Supabase project URL
  static const String supabaseUrl = 'https://mmuanpezzzbijukfddgk.supabase.co';
  
  /// Supabase anonymous/public API key
  static const String supabaseAnonKey = 'sb_publishable_s_JGVSOfzrPQ5yRGWdd4qA_Q_W5vFVJ';

  /// Initializes the Supabase client with project credentials.
  /// 
  /// This method must be called once before `runApp()` in `main.dart`.
  /// It sets up the global Supabase instance that can be accessed via `client` getter.
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  /// Returns the initialized Supabase client instance.
  /// 
  /// Throws an error if `initialize()` has not been called yet.
  static SupabaseClient get client => Supabase.instance.client;
}
