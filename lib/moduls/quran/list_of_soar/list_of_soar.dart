import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shop_app_first/shared/components/components.dart';
import 'package:shop_app_first/shared/cubit/cubit/cubit.dart';
import 'package:shop_app_first/shared/cubit/states/states.dart';
import 'package:shop_app_first/shared/style/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/assets_images/assets_images.dart';
import '../../soara/soara.dart';

class SoarScreen extends StatelessWidget {
  SoarScreen(this.ch, {super.key});
  bool? ch;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => listItem(context, index),
            separatorBuilder: (context, index) => Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 1,
            ),
            itemCount: quran.totalSurahCount,
          ),
        );
      },
    );
  }

  Widget listItem(context, index) => InkWell(
        onTap: () {
          if (ch == true) {
            fun(index + 1);
          } else {
            // QuranicCubit.get(context).getAyahs(numberOfSurah: '${index+1}');
            navigateTo(context, SoaraScreen(index + 1));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: quran.getPlaceOfRevelation(index + 1) == 'Makkah'
                    ? AssetImage(AssetImages.kabbaLogo)
                    : AssetImage(
                        AssetImages.mosLogo,
                      ),
                color: primaryColor,
                width: 27.w,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    quran.getSurahNameArabic(index + 1),
                    style: TextStyle(
                        fontFamily: 'hafs',
                        color: primaryColor,
                        fontSize: 20.sp),
                  ),
                  Text(
                    '${quran.getVerseCount(index + 1)} عدد آياتها ',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetImages.endOfVerseLogo,
                    width: 27.w,
                    color: primaryColor,
                  ),
                  Text(
                    "${index + 1}",
                    style: TextStyle(color: primaryColor),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  void fun(index) async {
    Uri url = Uri.parse(quran.getSurahURL(index));
    await launchUrl(url);
  }
}
