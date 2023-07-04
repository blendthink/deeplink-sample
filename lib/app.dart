import 'package:deeplink/main_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple.withOpacity(0.8),
        ),
      ),
      home: const MainPage(),
    );
  }
}
