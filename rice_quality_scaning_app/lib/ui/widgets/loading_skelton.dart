import 'package:flutter/material.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';
import 'package:rice_quality_scanning/ui/widgets/skelton.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _imagePicker() => Container(
          color: Colors.black.withOpacity(0.04),
          width: MediaQuery.of(context).size.width,
          height: 400,
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/skelton.png',
                  width: 150,
                ),
              ),
              const Center(
                child: Skelton(
                  height: 10,
                  width: 150,
                ),
              ),
            ],
          ),
        );

    Widget _content() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 475,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Skelton(
                    height: 55,
                    width: 55,
                    padding: 12,
                    radius: 12,
                  ),
                  Column(
                    children: const [
                      Skelton(
                        height: 10,
                        width: 150,
                        radius: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Skelton(
                        height: 10,
                        width: 120,
                        radius: 5,
                      ),
                    ],
                  ),
                  const Skelton(
                    height: 55,
                    width: 55,
                    padding: 12,
                    radius: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Skelton(
                      height: 170,
                      padding: 15,
                      radius: 18,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Skelton(
                      height: 170,
                      padding: 15,
                      radius: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Skelton(
                      height: 170,
                      padding: 15,
                      radius: 18,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Skelton(
                      height: 170,
                      padding: 15,
                      radius: 18,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          _imagePicker(),
          _content(),
        ],
      ),
    );
  }
}
