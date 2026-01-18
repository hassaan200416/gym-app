import 'package:flutter/material.dart';
import 'core/app.dart';
import 'core/config/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase before running the app
  await SupabaseConfig.initialize();
  
  runApp(const App());
}
