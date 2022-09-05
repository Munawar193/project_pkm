import 'package:flutter/material.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';
import 'package:rice_quality_scanning/ui/widgets/weatherItem/date_now.dart';
import 'package:rice_quality_scanning/ui/widgets/weatherItem/location_now.dart';
import 'package:rice_quality_scanning/ui/widgets/weatherItem/temperatur_now.dart';

class WeatherCard extends StatelessWidget {
  final String? location;
  final double temp;
  final String? description;
  final double feel;
  final int? humidity;

  const WeatherCard({
    Key? key,
    required this.location,
    required this.temp,
    required this.description,
    required this.feel,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(
        left: 25,
        top: 25,
        bottom: 15,
      ),
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
            offset: Offset(-8, -8),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // User Location
              LocationNow(
                location: location.toString(),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                // color: kGreyColor,
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Temperatur
                    TemperatureNow(
                      temp: temp,
                    ),
                  ],
                ),
              ),
              const DateNow()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //
                //
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                    right: 15,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(2, 2),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'feels like',
                        style: greenStyle.copyWith(
                          fontWeight: semibold,
                          color: kprimeColor.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feel.toStringAsFixed(0),
                                style: greenStyle.copyWith(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w700,
                                  color: kprimeColor.withOpacity(0.9),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: kOrangeColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 3),
                                child: Text(
                                  'C',
                                  style: orangStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //

                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                    right: 15,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(2, 2),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'humidity',
                        style: greenStyle.copyWith(
                          fontWeight: semibold,
                          color: kprimeColor.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                          child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              humidity.toString(),
                              style: greenStyle.copyWith(
                                fontSize: 42,
                                fontWeight: FontWeight.w700,
                                color: kprimeColor.withOpacity(0.8),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 3),
                              child: Text(
                                '%',
                                style: orangStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
