import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class LocationNow extends StatelessWidget {
  final String location;

  const LocationNow({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            'Location',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kprimeColor.withOpacity(0.8),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              margin: const EdgeInsets.only(right: 5),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/location.png'),
                ),
              ),
            ),
            Text(
              '$location, Indonesia',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: kprimeColor.withOpacity(0.8),
              ),
            )
          ],
        )
      ],
    );
  }
}
