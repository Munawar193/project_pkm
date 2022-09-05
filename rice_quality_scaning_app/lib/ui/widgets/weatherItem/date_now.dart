import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class DateNow extends StatelessWidget {
  const DateNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.yMMMMEEEEd().format(DateTime.now()),
            style: greenStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: kprimeColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
