import 'package:flutter/material.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class TemperatureNow extends StatelessWidget {
  final double temp;

  const TemperatureNow({
    Key? key,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp.toStringAsFixed(0),
          style: greenStyle.copyWith(
            fontSize: 90,
            fontWeight: FontWeight.w700,
            color: kprimeColor.withOpacity(0.8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 35,
          ),
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              color: kOrangeColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 23, left: 5),
          child: Text(
            'C',
            style: orangStyle.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
