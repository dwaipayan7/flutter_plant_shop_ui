import 'package:flutter/material.dart';

class PlantsHomeScreen extends StatefulWidget {
  const PlantsHomeScreen({super.key});

  @override
  State<PlantsHomeScreen> createState() => _PlantsHomeScreenState();
}

class _PlantsHomeScreenState extends State<PlantsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Dwaipayan")),
    );
  }
}
