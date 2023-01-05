import 'package:flutter/material.dart';
import 'package:flutter_rekadigi/di/service_locator.dart';
import 'package:flutter_rekadigi/view/home_screen.dart';
import 'package:flutter_rekadigi/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
