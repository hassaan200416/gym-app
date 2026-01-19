/// Entry point of the Gym Landing application.
/// 
/// This function initializes Flutter bindings, sets up Supabase configuration,
/// and launches the application.
import 'package:flutter/material.dart';
import 'core/app.dart';
import 'core/config/supabase_config.dart';

void main() async {
  // Ensure Flutter bindings are initialized before any async operations
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase client with project credentials
  await SupabaseConfig.initialize();
  
  // Launch the application
  runApp(const App());
}
