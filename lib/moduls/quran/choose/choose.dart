import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_first/moduls/quran/list_of_soar/list_of_soar.dart';
import 'package:shop_app_first/shared/assets_images/assets_images.dart';
import 'package:shop_app_first/shared/components/components.dart';

import '../../../shared/style/constants.dart';

class ChooseScreen extends StatelessWidget {
  ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            widget(
              ContentContainer(
                  image: AssetImages.saveLogo,
                  title: 'حفظ',
                  widget: SoarScreen(true)),
              context,
            ),
            widget(
              ContentContainer(
                  image: AssetImages.readLogo,
                  title: 'قرأءة',
                  widget: SoarScreen(false)),
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget widget(build, context) => Padding(
        padding: EdgeInsets.all(10.w),
        child: InkWell(
          onTap: () {
            navigateTo(context, build.widget);
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2.3,
            height: MediaQuery.of(context).size.height / 4.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xffe6f5f1),
                    child: Image.asset(build.image,
                        height: MediaQuery.of(context).size.height / 21),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 33),
                  Text(
                    build.title,
                    style: GoogleFonts.elMessiri(
                        fontSize: MediaQuery.of(context).size.width / 23,
                        color: primaryColor),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
