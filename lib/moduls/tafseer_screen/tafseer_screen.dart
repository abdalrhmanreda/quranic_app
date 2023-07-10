import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shop_app_first/moduls/tafseer_screen/tafseer_datails.dart';
import 'package:shop_app_first/shared/components/components.dart';
import 'package:shop_app_first/shared/cubit/states/states.dart';

import '../../shared/assets_images/assets_images.dart';
import '../../shared/cubit/cubit/cubit.dart';
import '../../shared/style/constants.dart';

class TafseerScreen extends StatelessWidget {
  const TafseerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text(
                  'التفسير',
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
                      padding: const EdgeInsets.all(8.0),
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
                                'My Favorite Preyer',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(
                                AssetImages.quranLogo,
                                width: 60,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'فإن علم التفسير من أشرف العلوم وأجلها، وأعظمها بركة، وأوسعها معرفة، وحاجة الأمة إليه ماسة، وقد شرف الله أهل التفسير ورفع مكانهم وجعلهم مرجعاً لعباده في فهم كلامه ومعرفة مراده وكفى بذلك فضلاً وشرفاً. وعلم طالب العلم بفضل علم التفسير وعلو شأنه وجلالة قدره مما يعين على إقبال النفس على تعلمه وأخذه بقوة وجد واجتهاد.',
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
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => listItem(context, index),
                  separatorBuilder: (context, index) => Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 1,
                  ),
                  itemCount: quran.totalSurahCount,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget listItem(context, index) => InkWell(
        onTap: () {
          try {
            QuranicCubit.get(context).getTafsserAyat((index + 1).toString());
          } catch (e) {}
          navigateTo(
              context,
              TafseerDetailsScreen(
                suraName: quran.getSurahNameArabic(index + 1),
              ));
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 9.5,
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
                width: 27,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    quran.getSurahNameArabic(index + 1),
                    style: TextStyle(
                        fontFamily: 'hafs', color: primaryColor, fontSize: 20),
                  ),
                  Text(
                    '${quran.getVerseCount(index + 1)} عدد آياتها ',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 16,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetImages.endOfVerseLogo,
                    width: 27,
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
}
