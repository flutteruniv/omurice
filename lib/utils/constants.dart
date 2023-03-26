import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

bool isAuthenticated() {
  return supabase.auth.currentUser != null;
}

Future<void> refreshSession() async {
  if (isAuthenticated() && supabase.auth.currentSession != null) {
    final expiresAt = DateTime.fromMillisecondsSinceEpoch(
        supabase.auth.currentSession!.expiresAt! * 1000);
    if (expiresAt
        .isBefore(DateTime.now().subtract(const Duration(seconds: 2)))) {
      debugPrint("expired token!");
      await supabase.auth.refreshSession();
    }
  }
}
