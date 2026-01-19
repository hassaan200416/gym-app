import 'package:supabase_flutter/supabase_flutter.dart';

class WaitlistService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> addEmail(String email) async {
    await _client.from('waitlist').insert({
      'email': email,
    });
  }
}
