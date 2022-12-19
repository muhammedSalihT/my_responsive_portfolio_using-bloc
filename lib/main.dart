import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_portfolio/blocs/splash/splash_bloc.dart';
import 'package:responsive_portfolio/constants.dart';
import 'package:responsive_portfolio/pages/home/home_screen.dart';
import 'package:responsive_portfolio/pages/splash/splash_screen.dart';
import 'package:responsive_portfolio/utils/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
      ),
      home: BlocProvider(create: (context) {
        return SplashBloc();
      }, child: Builder(builder: (context) {
        return Responsive.isMobile(context)
            ? const SplashScreen()
            : const HomeScreen();
      })),
    );
  }
}
