import 'package:flutter/material.dart';
import 'package:untitled1/modules/register/register.dart';
import 'package:untitled1/network/dio.dart';

void main()async {
  await DioHelperPayment.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
