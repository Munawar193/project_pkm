import 'package:flutter/material.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';

class CostomTextFromField extends StatelessWidget {
  final IconData icon;
  final String hintext;
  final bool obscureText;
  final TextEditingController controller;

  const CostomTextFromField({
    Key? key,
    required this.hintext,
    this.obscureText = false,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhiteColor,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: blackStyle.copyWith(
          fontSize: 16,
          fontWeight: medium,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          hintText: hintext,
          hintStyle: greyStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
          icon: Icon(
            icon,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
