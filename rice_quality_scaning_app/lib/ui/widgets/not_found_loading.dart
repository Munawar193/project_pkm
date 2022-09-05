import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class NotFoundLoading extends StatefulWidget {
  const NotFoundLoading({Key? key}) : super(key: key);

  @override
  State<NotFoundLoading> createState() => NotFoundLoadingState();
}

class NotFoundLoadingState extends State<NotFoundLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Lottie.asset('assets/lottie/not-found.json'),
      ),
    );
  }
}
