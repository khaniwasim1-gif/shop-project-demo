import 'dart:async';
import 'package:flutter/material.dart';

import 'home.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  HomeScreen()),
      );
    });
  }@override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('E‑Commerce App', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}