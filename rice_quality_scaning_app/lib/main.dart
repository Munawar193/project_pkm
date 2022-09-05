import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rice_quality_scanning/cubit/auth_cubit.dart';
import 'package:rice_quality_scanning/ui/screens/home_page.dart';
import 'package:rice_quality_scanning/ui/screens/scanning_camera_page.dart';
import 'package:rice_quality_scanning/ui/screens/scanning_upload_page.dart';
import 'package:rice_quality_scanning/ui/screens/sign_in_page.dart';
import 'package:rice_quality_scanning/ui/screens/sign_up_page.dart';
import 'package:rice_quality_scanning/ui/screens/spalsh_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rice Quality Scaning App',
        routes: {
          '/': (context) => const SplashPage(),
          '/signIn-page': (context) => const SignInPage(),
          '/signUp-page': (context) => const SignUpPage(),
          '/main-page': (context) => const MainPage(),
          '/scaning-page': (context) => const ScaningPage(),
          '/upload-page': (context) => const ScanningWithUpload(),
        },
      ),
    );
  }
}
