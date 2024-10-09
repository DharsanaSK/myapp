import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/homepage.dart';
import 'pages/explorepage.dart' as explore; // Alias this import
import 'pages/detailpage.dart' as detail; // Alias this import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/explore': (context) => explore.ExplorePage(), // Use alias
        //'/detail': (context) => detail.DetailPage(), // Use alias if needed
      },
    );
  }
}
