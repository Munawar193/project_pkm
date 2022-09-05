import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class CardIndicator extends StatelessWidget {
  final String title;
  final double percent;
  final String? textpercent;

  const CardIndicator({
    Key? key,
    required this.title,
    required this.percent,
    required this.textpercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(6, 6),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-6, -6),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: greenStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
                color: kprimeColor.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: CircularPercentIndicator(
                animation: true,
                animationDuration: 3000,
                radius: 50,
                lineWidth: 10,
                percent: percent,
                progressColor: kprimeColor,
                backgroundColor: kprimeColor.withOpacity(0.3),
                circularStrokeCap: CircularStrokeCap.round,
                center: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: kprimeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      textpercent.toString(),
                      style: whiteStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
