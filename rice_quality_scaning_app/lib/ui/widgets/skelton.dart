import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.width,
    this.height,
    this.padding = 0,
    this.radius = 12,
  }) : super(key: key);

  final double? width, height, padding, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.06),
          borderRadius: BorderRadius.circular(radius!)),
    );
  }
}
