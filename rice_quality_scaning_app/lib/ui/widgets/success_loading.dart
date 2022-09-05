import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class SuccessLoading extends StatefulWidget {
  const SuccessLoading({Key? key}) : super(key: key);

  @override
  State<SuccessLoading> createState() => _SuccessLoadingState();
}

class _SuccessLoadingState extends State<SuccessLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Center(
        child: Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_vhhoyvvc.json'),
      ),
    );
  }
}
