import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shop_app_first/main.dart';
import 'package:shop_app_first/shared/components/components.dart';
import 'package:shop_app_first/shared/cubit/cubit/cubit.dart';

import '../../shared/assets_images/assets_images.dart';
import '../../shared/cubit/states/states.dart';
import '../../shared/style/constants.dart';
import '../azkar_screen/azkar_screen.dart';
import '../hadis_screen/hadis_book_screen.dart';
import '../hijri_calender_screen/hijri_calender_screen.dart';
import '../quran/choose/choose.dart';
import '../tasbih_screen/choose_tasbih/choose_tasbeeh.dart';

class PrayerTimingScreen extends StatelessWidget {
  PrayerTimingScreen({super.key});
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<PrayerTimingItem> items = [
          PrayerTimingItem(
              prayerIcon: AssetImages.fajrLogo,
              prayerName: 'Fajr',
              prayerTime:
                  '${QuranicCubit.get(context).prayerModel!.data!.timings!.fajr} AM'),
          PrayerTimingItem(
              prayerIcon: AssetImages.sunRiseLogo,
              prayerName: 'Sunrise',
              prayerTime:
                  '${QuranicCubit.get(context).prayerModel!.data!.timings!.sunrise} AM'),
          PrayerTimingItem(
              prayerIcon: AssetImages.dhuhrLogo,
              prayerName: 'Dhuhr',
              prayerTime:
                  '${QuranicCubit.get(context).prayerModel!.data!.timings!.dhuhr} PM'),
          PrayerTimingItem(
              prayerIcon: AssetImages.asrLogo,
              prayerName: 'Asr',
              prayerTime:
                  '${QuranicCubit.get(context).prayerModel!.data!.timings!.asr} PM'),
          PrayerTimingItem(
              prayerIcon: AssetImages.magLogo,
              prayerName: 'Maghrib',
              prayerTime:
                  '${QuranicCubit.get(context).prayerModel!.data!.timings!.maghrib} PM'),
          PrayerTimingItem(
              prayerIcon: AssetImages.ashaLogo,
              prayerName: 'Isha',
              prayerTime:
                  '${QuranicCubit.get(context).prayerModel!.data!.timings!.isha} PM'),
        ];
        List<ContentContainer> items2 = [
          ContentContainer(
            image: AssetImages.daLogo,
            title: "Prayers",
            // widget: PreysScreen(),
          ),
          ContentContainer(
            image: AssetImages.quranLogo,
            title: "Quran",
            widget: ChooseScreen(),
          ),
          ContentContainer(
            image: AssetImages.tasbihLogo,
            title: "Tasbeeh",
            widget: ChooseTasbeehScreen(),
          ),
          ContentContainer(
            image: AssetImages.azkarLogo,
            title: "Azkar",
            widget: AzkarScreen(),
          ),
          ContentContainer(
            image: AssetImages.haLogo,
            title: "Hadis",
            widget: HadisBookScreen(),
          ),
          ContentContainer(
            image: AssetImages.calenderLogo,
            title: "Hijri Calender",
            widget: const HijriCalenderScreen(),
          ),
        ];
        return Scaffold(
            body: CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                slivers: [
              SliverAppBar(
                title: Text(
                  'مواقيت الصلاة',
                  style: GoogleFonts.elMessiri(),
                ),
                pinned: true,
                backgroundColor: primaryColor,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                      color: Colors.white, Icons.arrow_back_ios_new_outlined),
                ),
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Prayer Timings',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(
                                AssetImages.mosqueLogo,
                                width: 50,
                              )
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Row(
                              children: [
                                const Icon(
                                  Iconsax.location,
                                  color: Colors.white,
                                ),
                                Text(
                                  '$city , $country',
                                  style:
                                      GoogleFonts.aBeeZee(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'عن عبد الله بن عمرو رضي الله عنهما عن النبي صلى الله عليه وسلم أنه ذكر الصلاة يوماً فقال: «من حافظ عليها كانت له نوراً وبرهاناً ونجاة يوم القيامة ومن لم يحافظ عليها لم يكن له نور ولا برهان ولا نجاة وكان يوم القيامة مع قارون وهامان وفرعون وأبي بن خلف» (أخرجه ابن حبان في صحيحه).',
                            style: GoogleFonts.elMessiri(color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${QuranicCubit.get(context).prayerModel!.data!.date!.gregorian!.weekday2!.en} ${QuranicCubit.get(context).prayerModel!.data!.date!.hijri!.day!.replaceAll('0', '')} ,${QuranicCubit.get(context).prayerModel!.data!.date!.hijri!.month!.en} ',
                          style: GoogleFonts.aBeeZee(
                              color: primaryColor, fontSize: 19),
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              prayerItem(items, context, index),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: items.length,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Discover',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 20, color: primaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  discoverItem(items2, index, context),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 20,
                                  ),
                              itemCount: items2.length),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]));
      },
    );
  }

  Widget prayerItem(List<PrayerTimingItem> prayers, context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  prayers[index].prayerIcon,
                  width: 20,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  prayers[index].prayerName,
                  style: GoogleFonts.aBeeZee(color: primaryColor, fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  prayers[index].prayerTime,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.volume_up,
                  color: primaryColor,
                ),
              ],
            )
          ],
        ),
      );

  Widget discoverItem(List<ContentContainer> items, index, context) => Column(
        children: [
          InkWell(
            onTap: () {
              navigateTo(context, items[index].widget);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xffdef1e8),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                items[index].image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            items[index].title,
            style: GoogleFonts.aBeeZee(color: primaryColor, fontSize: 12),
          )
        ],
      );
}

class PrayerTimingItem {
  final String prayerIcon;
  final String prayerName;
  final String prayerTime;

  PrayerTimingItem(
      {required this.prayerIcon,
      required this.prayerName,
      required this.prayerTime});
}
