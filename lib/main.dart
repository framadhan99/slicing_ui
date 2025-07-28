import 'package:flutter/material.dart';
import 'package:slicing_ui/pages/home_page.dart';

import 'app/config/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloth App',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
