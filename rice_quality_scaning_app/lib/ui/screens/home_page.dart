import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rice_quality_scanning/model/weather_model.dart';
import 'package:rice_quality_scanning/services/weather_api_client.dart';
import 'package:rice_quality_scanning/ui/screens/navigation_draw.dart';
import 'package:rice_quality_scanning/ui/screens/theme.dart';
import 'package:rice_quality_scanning/ui/widgets/button_profile.dart';
import 'package:rice_quality_scanning/ui/widgets/logout_button.dart';
import 'package:rice_quality_scanning/ui/widgets/not_found_loading.dart';
import 'package:rice_quality_scanning/ui/widgets/scanning_card.dart';
import 'package:rice_quality_scanning/ui/widgets/upload_card.dart';
import 'package:rice_quality_scanning/ui/widgets/weatherItem/waiting_respone.dart';
import 'package:rice_quality_scanning/ui/widgets/weather_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  WeatherApi client = WeatherApi();
  WeatherModel? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather('Aceh');
  }

  @override
  Widget build(BuildContext context) {
    Widget app() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ProfileButton(),
            LogOutButton(),
          ],
        ),
      );
    }

    Widget weather() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: data != null
                    ? WeatherCard(
                        location: data?.name,
                        temp: data!.main!.temp!,
                        description: 'Broken clouds',
                        feel: data!.main!.feelsLike!,
                        humidity: data?.main?.humidity,
                      )
                    : const NotFoundLoading(),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const WaitingRespone();
            } else {
              return const NotFoundLoading();
            }
          },
        ),
      );
    }

    Widget mainContent() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 15,
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: ScanningCard(),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: UploadCard(),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Column screen(
      Widget Function() app,
      Widget Function() weather,
      Widget Function() mainContent,
    ) {
      return Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: 90,
              child: app(),
            ),
          ),
          Flexible(
            flex: 8,
            child: Column(
              children: [
                weather(),
                mainContent(),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: const NavigationDrew(),
      body: SafeArea(
        child: screen(
          app,
          weather,
          mainContent,
        ),
      ),
    );
  }
}
