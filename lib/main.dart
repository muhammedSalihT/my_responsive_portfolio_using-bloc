import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_portfolio/blocs/home/bloc/home_bloc.dart';
import 'package:responsive_portfolio/blocs/splash/splash_bloc.dart';
import 'package:responsive_portfolio/constents/const_colors.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        )
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              primaryColor: AppColors.bgColor,
              scaffoldBackgroundColor: AppColors.bgColor,
              canvasColor: AppColors.bgColor,
            ),
            home: Builder(
              builder: (context) {
                return Responsive.isMobile(context)
                    ? const SplashScreen()
                    : const HomeScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
