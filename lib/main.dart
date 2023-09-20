import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,),
          titleMedium: TextStyle(
            color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
          ),
        )
      ),
      home: const HomePage(),
    );
  }
}
