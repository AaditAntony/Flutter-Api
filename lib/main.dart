import 'package:flutter/material.dart';
import 'package:trial/complex_jaon_with_models.dart';
import 'package:trial/homePage.dart';
import 'package:http/http.dart' as http;
import 'package:trial/model_less_Api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ComplexApiWithModels(),debugShowCheckedModeBanner: false,);
  }
}
