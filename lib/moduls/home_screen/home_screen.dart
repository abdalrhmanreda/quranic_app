import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_app_first/moduls/azkar_screen/azkar_screen.dart';
import 'package:shop_app_first/moduls/hadis_screen/hadis_book_screen.dart';
import 'package:shop_app_first/moduls/hijri_calender_screen/hijri_calender_screen.dart';
import 'package:shop_app_first/moduls/prayer_timings/prayer_timing.dart';
import 'package:shop_app_first/moduls/quran/choose/choose.dart';
import 'package:shop_app_first/moduls/tafseer_screen/tafseer_screen.dart';
import 'package:shop_app_first/moduls/tasbih_screen/choose_tasbih/choose_tasbeeh.dart';
import 'package:shop_app_first/shared/assets_images/assets_images.dart';
import 'package:shop_app_first/shared/components/components.dart';
import 'package:shop_app_first/shared/cubit/cubit/cubit.dart';
import 'package:shop_app_first/shared/style/constants.dart';

import '../../main.dart';
import '../../shared/cubit/states/states.dart';
import '../prayer_screen/preys_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<ContentContainer> items = [
    ContentContainer(
      image: AssetImages.quranLogo,
      title: "تفسير",
      widget: const TafseerScreen(),
    ),
    ContentContainer(
      image: AssetImages.tafLogo,
      title: "القرآن الكريم",
      widget: ChooseScreen(),
    ),
    ContentContainer(
        image: AssetImages.daLogo, title: " أدعية", widget: PreysScreen()
        // widget: PreysScreen(),
        ),
    ContentContainer(
      image: AssetImages.tasbihLogo,
      title: " تسبيح",
      widget: ChooseTasbeehScreen(),
    ),
    ContentContainer(
      image: AssetImages.azkarLogo,
      title: "أذكار ",
      widget: const AzkarScreen(),
    ),
    ContentContainer(
      image: AssetImages.haLogo,
      title: " أحاديث",
      widget: HadisBookScreen(),
    ),
    ContentContainer(
      image: AssetImages.mosqueLogo,
      title: " مواقيت الصلاة",
      widget: PrayerTimingScreen(),
    ),
    ContentContainer(
      image: AssetImages.calenderLogo,
      title: "التقويم الهجرى",
      widget: const HijriCalenderScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(
                  Iconsax.location,
                  color: primaryColor,
                  size: MediaQuery.of(context).size.width / 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$city , $country',
                  style:
                      GoogleFonts.aBeeZee(color: primaryColor, fontSize: 18.sp),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 22,
                  ),
                  child: Text(
                    'Quranic',
                    style: GoogleFonts.elMessiri(
                        fontSize: MediaQuery.of(context).size.width / 12,
                        color: const Color(0xff008037)),
                  ),
                ),
                Image.asset(
                  AssetImages.mainLogo,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.7,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: buildItem(context, items),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
