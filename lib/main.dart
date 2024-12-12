import 'package:api_calling/controller/gemini_controller.dart';
import 'package:api_calling/controller/product_controller.dart';
import 'package:api_calling/controller/translate_controller.dart';
import 'package:api_calling/screens/geminii/gemini_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductController()),
      ChangeNotifierProvider(create: (_) => TranslateController()),
      ChangeNotifierProvider(create: (_) => GeminiController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeminiScreen(),
    );
  }
}
