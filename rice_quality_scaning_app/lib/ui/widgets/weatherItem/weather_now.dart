import 'package:flutter/material.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class WeatherNow extends StatelessWidget {
  final String? description;

  const WeatherNow({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 125,
            width: 125,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/partlycloudy.png'),
              ),
            ),
          ),
          Text(
            description.toString(),
            style: greenStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: kprimeColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
