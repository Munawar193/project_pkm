import 'package:flutter/material.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';
import 'package:rice_quality_scanning/ui/widgets/logout_function.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              contentPadding: const EdgeInsets.only(top: 10),
              content: Container(
                height: 150,
                width: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Apakah anda yakin?\ningin keluar dari aplikasi ini',
                    style: greyStyle.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              actions: const [
                Center(
                  child: ButtonLogOut(),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 55,
        width: 55,
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
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Image.asset('assets/images/more.png'),
      ),
    );
  }
}
