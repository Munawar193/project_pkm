import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class ScanningCard extends StatelessWidget {
  const ScanningCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/scan.png'),
              ),
            ),
          ),
          Text(
            'Lakukan scaning\ndengan memotret',
            textAlign: TextAlign.center,
            style: greenStyle.copyWith(
              fontSize: 12,
              color: kprimeColor.withOpacity(0.8),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/scaning-page');
            },
            child: Neumorphic(
              style: NeumorphicStyle(
                color: backgroundColor,
                depth: 5,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(6),
                ),
                shadowLightColorEmboss: Colors.grey.withOpacity(0.5),
                shadowDarkColorEmboss: Colors.grey.withOpacity(0.6),
              ),
              child: SizedBox(
                height: 38,
                width: 100,
                child: Center(
                  child: Text(
                    'Scan',
                    style: greenStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kprimeColor.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
