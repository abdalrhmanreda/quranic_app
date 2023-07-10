import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_first/moduls/azkar_screen/azkar_details.dart';
import 'package:shop_app_first/shared/assets_images/assets_images.dart';
import 'package:shop_app_first/shared/cubit/cubit/cubit.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/states/states.dart';
import '../../shared/style/constants.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<ContentContainer> items = [
          ContentContainer(
              image: AssetImages.moringAzkar,
              title: 'أذكار الصباح',
              widget: AzkarDetailsScreen(
                listOfZekr: QuranicCubit.get(context).moringAzkar,
              )),
          ContentContainer(
              image: AssetImages.nightAzkar,
              title: "أذكار المساء",
              widget: AzkarDetailsScreen(
                listOfZekr: QuranicCubit.get(context).nightAzkar,
              )),
          ContentContainer(
              image: AssetImages.afterPreryAzkar,
              title: "اذكار بعد الصلاة",
              widget: AzkarDetailsScreen(
                listOfZekr: QuranicCubit.get(context).azkarAfterPrey,
              )),
          ContentContainer(
              image: AssetImages.sleepingAzkar,
              title: "أذكار النوم",
              widget: AzkarDetailsScreen(
                listOfZekr: QuranicCubit.get(context).sleepingAzkar,
              )),
          ContentContainer(
              image: AssetImages.wakeUpAzkar,
              title: "أذكار الاستيقاظ",
              widget: AzkarDetailsScreen(
                listOfZekr: QuranicCubit.get(context).wakeUpAzkar,
              )),
        ];
        return Scaffold(
          body: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text(
                  'ذاكار',
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
                expandedHeight: 250,
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
                                'My Favorite Azkar',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(
                                AssetImages.azkarLogo2,
                                width: 60,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'الذكر يوجب صلاة الله عز وجل وملائكته على الذاكر ومن صلى الله تعالى عليه وملائكته فقد افلح كل الفلاح وفاز كل الفوز قال سبحانه وتعالى : ( يا أيها الذين امنوا اذكروا الله ذكرا كثيرا و سبحوه بكرة وأصيلا هو الذي يصلى عليكم وملائكته ليخرجكم من الظلمات إلى النور وكان بالمؤمنين رحيما ).',
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
                  child: buildItem(context, items),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
