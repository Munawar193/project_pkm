import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class LottieFile extends StatefulWidget {
  const LottieFile({Key? key}) : super(key: key);

  @override
  State<LottieFile> createState() => _LottieFileState();
}

class _LottieFileState extends State<LottieFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Lottie.network(
            'https://assets5.lottiefiles.com/packages/lf20_5owbstbu.json'),
      ),
    );
  }
}
