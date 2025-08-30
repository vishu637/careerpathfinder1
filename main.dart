import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Temporary username until you implement login
    const String username = "guest_user";

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(username: username), // ✅ pass username
        );
    }
}