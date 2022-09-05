import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class WaitingRespone extends StatelessWidget {
  const WaitingRespone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      margin: const EdgeInsets.only(bottom: 15, top: 20),
      padding: const EdgeInsets.only(
        left: 25,
        top: 25,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Center(
        child: Lottie.network(
            'https://assets4.lottiefiles.com/private_files/lf30_jmgekfqg.json'),
      ),
    );
  }
}
