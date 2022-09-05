import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class LoadingDeletSuccess extends StatefulWidget {
  const LoadingDeletSuccess({Key? key}) : super(key: key);

  @override
  State<LoadingDeletSuccess> createState() => _LoadingDeletSuccessState();
}

class _LoadingDeletSuccessState extends State<LoadingDeletSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Center(
        child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_jP0UkE.json'),
      ),
    );
  }
}
