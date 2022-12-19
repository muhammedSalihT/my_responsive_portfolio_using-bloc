import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_portfolio/blocs/splash/splash_bloc.dart';
import 'package:responsive_portfolio/constents/text_const.dart';
import 'package:responsive_portfolio/pages/home/home_screen.dart';
import 'package:responsive_portfolio/utils/responsive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Responsive.getScreenSize(context);
    BlocProvider.of<SplashBloc>(context).add(MoveToHomeEvent());
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is Loaded) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: animatedText(
                    size: size,
                    text: TextConst.devName,
                    textStyle: TextStyle(fontSize: size.width * .07)),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * .28),
                child: animatedText(
                    size: size,
                    text: TextConst.subTitle,
                    textStyle: TextStyle(fontSize: size.width * .04)),
              ),
            ],
          );
        },
      ),
    );
  }

  AnimatedTextKit animatedText(
      {required Size size,
      required String text,
      required TextStyle textStyle}) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(text,
            textStyle: textStyle,
            curve: Curves.easeIn,
            speed: const Duration(milliseconds: 180)),
      ],
    );
  }
}
