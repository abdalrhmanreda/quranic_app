import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_first/moduls/home_screen/home_screen.dart';
import 'package:shop_app_first/network/local/cache_helper.dart';
import 'package:shop_app_first/shared/assets_images/assets_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/style/constants.dart';

class OnBoarding {
  final String image;
  final String description;

  OnBoarding({required this.image, required this.description});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoarding> onBoardingList = [
    OnBoarding(
        image: AssetImages.onBoarding1,
        description:
            'Islamic apps can be useful tools for Muslims who want to practice their faith in their daily lives'),
    OnBoarding(
        image: AssetImages.onBoarding2,
        description:
            'Islamic apps can be particularly helpful for Muslims who live in areas where it may be difficult to find local resources or communities'),
    OnBoarding(
        image: AssetImages.onBoarding3,
        description:
            'The program has a tasbeeh feature that enables the number of tasbeehs that it performs to be counted'),
  ];

  var pageController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 23,
            top: MediaQuery.of(context).size.height / 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Quranic',
              style:
                  GoogleFonts.elMessiri(fontSize: 30.sp, color: primaryColor),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (context, index) =>
                    onBoardingItem(onBoardingList[index]),
                itemCount: onBoardingList.length,
                onPageChanged: (index) {
                  if (index == onBoardingList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 35,
              ),
              child: SmoothPageIndicator(
                  controller: pageController,
                  count: onBoardingList.length,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 8.0.w,
                      dotHeight: 8.0.h,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: primaryColor)),
            ),
            button(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 16,
                buttonColor: primaryColor,
                onPressed: () {
                  if (isLast) {
                    CacheHelper.saveData(key: 'onBoarding', value: true)!
                        .then((value) {
                      navigateAndFinish(context, HomeScreen());
                    });
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastEaseInToSlowEaseOut);
                  }
                },
                borderRadius: 21,
                text: 'Next'),
          ],
        ),
      ),
    );
  }

  Widget onBoardingItem(OnBoarding onBoarding) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            onBoarding.image,
            width: 340.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: Text(
              onBoarding.description,
              style:
                  GoogleFonts.elMessiri(fontSize: 15.5.sp, color: primaryColor),
            ),
          ),
        ],
      );
}
