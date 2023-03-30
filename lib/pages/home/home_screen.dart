import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_portfolio/blocs/home/bloc/home_bloc.dart';
import 'package:responsive_portfolio/constents/const_colors.dart';
import 'package:responsive_portfolio/constents/sized_boxes.dart';
import 'package:responsive_portfolio/constents/text_const.dart';
import 'package:responsive_portfolio/utils/animated_indicators.dart';
import 'package:responsive_portfolio/utils/customtext.dart';
import 'package:responsive_portfolio/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Responsive.getScreenSize(context);
    final bloc = context.read<HomeBloc>();
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const CircleAvatar(
                        maxRadius: 30,
                        minRadius: 10,
                        backgroundImage:
                            AssetImage("assets/photo_2020-05-25_20-48-54.jpg"),
                      ),
                    );
                  }),
                ),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CustomTextWidget(
                        text: TextConst.devName,
                        textColor: AppColors.flutterBlue,
                        textWidth: FontWeight.w700,
                      ),
                      CustomTextWidget(
                        text: TextConst.subTitle,
                        textSize: size.width * .02,
                        textWidth: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : null,
      drawer: Responsive.isMobile(context)
          ? Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    Box.minHeightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            child: Image(
                              width: double.infinity,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/photo_2020-05-25_20-48-54.jpg"),
                            ),
                          ),
                          Box.stdHeightBox,
                          CustomTextWidget(
                              text: "Self Tought",
                              textColor: AppColors.bodyGrey.shade800,
                              textWidth: FontWeight.w700),
                          CustomTextWidget(
                              text: "Software Engineer",
                              textWidth: FontWeight.w700,
                              textColor: AppColors.bodyGrey.shade800),
                          Box.stdHeightBox,
                          Box.stdDivider,
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: CustomTextWidget(
                                    text: "Abilities",
                                    textWidth: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: AnimatedIndicators
                                          .animatedCircularIndicator(
                                              context: context,
                                              label: "Logical\nThinking",
                                              percentage: .8),
                                    ),
                                    Expanded(
                                      child: AnimatedIndicators
                                          .animatedCircularIndicator(
                                              context: context,
                                              label: "Flutter",
                                              percentage: .9),
                                    ),
                                    Expanded(
                                      child: AnimatedIndicators
                                          .animatedCircularIndicator(
                                              context: context,
                                              label: "Node js",
                                              percentage: .7),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Box.stdDivider,
                          Box.minHeightBox,
                          const CustomTextWidget(
                              text: "Coding", textWidth: FontWeight.w700),
                          AnimatedIndicators.animtedLinerIndicator(
                              context: context, label: "Dart", percentage: .8),
                          AnimatedIndicators.animtedLinerIndicator(
                              context: context,
                              label: "Flutter",
                              percentage: .8),
                          AnimatedIndicators.animtedLinerIndicator(
                              context: context, label: "Dart", percentage: .8),
                          const CustomTextWidget(
                              text: "Coding", textWidth: FontWeight.w700),
                          AnimatedIndicators.animtedLinerIndicator(
                              context: context, label: "Dart", percentage: .8),
                          AnimatedIndicators.animtedLinerIndicator(
                              context: context,
                              label: "Flutter",
                              percentage: .8),
                          AnimatedIndicators.animtedLinerIndicator(
                              context: context, label: "Dart", percentage: .8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Responsive.isMobile(context)
          ? Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.indigoAccent,
                    width: 1.sh,
                    child: Center(
                        child: Text(
                      "Salih",
                      style: TextStyle(fontSize: 30.sp),
                    )),
                  ),
                )
              ],
            )
          : Row(
              children: [
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Box.minHeightBox,
                      Column(
                        children: [
                          BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                            return MouseRegion(
                              onHover: (event) {
                                bloc.add(HoverEvent());
                              },
                              onExit: (event) {
                                bloc.add(ReleseHoverEvent());
                              },
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: state.imageBorderColor),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  image: const DecorationImage(
                                    image: ExactAssetImage(
                                        "assets/photo_2020-05-25_20-48-54.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          }),
                          Box.stdHeightBox,
                          CustomTextWidget(
                              textSize: 25,
                              text: "Self Tought",
                              textColor: AppColors.bodyGrey.shade800,
                              textWidth: FontWeight.w700),
                          CustomTextWidget(
                              textSize: 25,
                              text: "Software Engineer",
                              textWidth: FontWeight.w700,
                              textColor: AppColors.bodyGrey.shade800),
                          Box.stdHeightBox,
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Box.stdDivider,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          children: [
                            const CustomTextWidget(
                              textSize: 20,
                              text: "Abilities",
                              textWidth: FontWeight.w700,
                            ),
                            Box.stdHeightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: AnimatedIndicators
                                      .animatedCircularIndicator(
                                          context: context,
                                          label: "Logical\nThinking",
                                          percentage: .8),
                                ),
                                Box.stdWidthBox,
                                Expanded(
                                  child: AnimatedIndicators
                                      .animatedCircularIndicator(
                                          context: context,
                                          label: "Self\nLearning",
                                          percentage: .9),
                                ),
                                Box.stdWidthBox,
                                Expanded(
                                  child: AnimatedIndicators
                                      .animatedCircularIndicator(
                                          context: context,
                                          label: "Comunication",
                                          percentage: .7),
                                ),
                              ],
                            ),
                            Box.stdHeightBox,
                            Box.stdDivider,
                            Box.minHeightBox,
                            const CustomTextWidget(
                                text: "Skills", textWidth: FontWeight.w700),
                            AnimatedIndicators.animtedLinerIndicator(
                                context: context,
                                label: "Dart",
                                percentage: .9),
                            AnimatedIndicators.animtedLinerIndicator(
                                context: context,
                                label: "Flutter",
                                percentage: .9),
                            AnimatedIndicators.animtedLinerIndicator(
                                context: context,
                                label: "Node Js",
                                percentage: .6),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.flutterBlue,
                  ),
                )
              ],
            ),
    );
  }
}
