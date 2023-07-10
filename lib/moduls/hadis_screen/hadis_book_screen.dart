import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_first/moduls/hadis_screen/hadis_screen.dart';
import 'package:shop_app_first/shared/cubit/cubit/cubit.dart';
import 'package:shop_app_first/shared/cubit/states/states.dart';

import '../../shared/assets_images/assets_images.dart';
import '../../shared/components/components.dart';
import '../../shared/style/constants.dart';

class HadisBookScreen extends StatelessWidget {
  HadisBookScreen({super.key});
  List<ContentContainer> items = [
    ContentContainer(
      image: AssetImages.hadisLogo,
      title: "موطأ مالك",
      theSeer: 'malik',
      widget: const HadisScreen(
          link:
              'https://islamonline.net/%D9%85%D8%A7%D9%84%D9%83-%D8%A8%D9%86-%D8%A3%D9%86%D8%B3-%D8%B5%D8%A7%D8%AD%D8%A8-%D8%A7%D9%84%D9%85%D9%88%D8%B7%D8%A3-%D9%88%D8%B3%D9%8A%D8%AF-%D8%A7%D9%84%D8%A3%D8%A6%D9%85%D8%A9/#:~:text=%D9%88%D9%8F%D9%84%D8%AF%20%D8%A7%D9%84%D8%A5%D9%85%D8%A7%D9%85%20%D9%85%D8%A7%D9%84%D9%83%20%D8%A8%D8%A7%D9%84%D9%85%D8%AF%D9%8A%D9%86%D8%A9%20%D8%A7%D9%84%D9%85%D9%86%D9%88%D8%B1%D8%A9,%D8%A7%D9%84%D8%B9%D9%84%D9%85%D8%A7%D8%A1%20%D9%85%D8%AB%D9%84%20%D9%86%D8%A7%D9%81%D8%B9%20%D9%85%D9%88%D9%84%D9%89%20%D8%A7%D8%A8%D9%86',
          brief:
              'وُلد الإمام مالك بالمدينة المنورة سنة 93هـ، ونشأ في بيت كان مشتغلاً بعلم الحديث واستطلاع الآثار وأخبار الصحابة وفتاويهم، فحفظ القرآن الكريم في صدر حياته، ثم اتجه إلى حفظ الحديث النبوي وتعلُّمِ الفقه الإسلامي، فلازم فقيه المدينة المنورة ابن هرمز سبع سنين يتعلم عنده' // widget: PreysScreen(),
          ),
    ),
    ContentContainer(
      image: AssetImages.hadisLogo,
      title: "مسند احمد بن حنبل",
      theSeer: 'ahmad',
      widget: const HadisScreen(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A3%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%AD%D9%86%D8%A8%D9%84#:~:text=%D8%A7%D8%B4%D8%AA%D9%8F%D9%87%D8%B1%20%D8%A8%D8%B9%D9%84%D9%85%D9%87%20%D8%A7%D9%84%D8%BA%D8%B2%D9%8A%D8%B1%20%D9%88%D8%AD%D9%81%D8%B8%D9%87%20%D8%A7%D9%84%D9%82%D9%88%D9%8A,%D9%85%D9%86%20%D8%A3%D8%B4%D9%87%D8%B1%20%D9%83%D8%AA%D8%A8%20%D8%A7%D9%84%D8%AD%D8%AF%D9%8A%D8%AB%20%D9%88%D8%A3%D9%88%D8%B3%D8%B9%D9%87%D8%A7',
          brief:
              'اشتُهر بعلمه الغزير وحفظه القوي، وكان معروفاً بالأخلاق الحسنة كالصبر والتواضع والتسامح، وقد أثنى عليه كثير من العلماء منهم الإمام الشافعي بقوله: «خرجتُ من بغداد وما خلَّفتُ بها أحداً أورع ولا أتقى ولا أفقه من أحمد بن حنبل»، ويُعدُّ كتابه «المسند» من أشهر كتب الحديث وأوسعها.'),
    ),
    ContentContainer(
      image: AssetImages.hadisLogo,
      title: "سنن الترمذى ",
      widget: const HadisScreen(
        brief:
            'ولد الترمذي في العقد الأول من القرن الثالث الهجري، في حدود سنة 210 هـ، وقال صلاح الدين الصفدي: ولد سنة بضع ومائتين، وقال ابن الأثير الجزري: ولد سنة 209 هـ. ولد في ترمذ وإليها يُنسب، وترمذ مدينة عظيمة واسعة بخراسان، وقال ابن الأثير: ببلخ، على طرف جيحون. وقيل بل ولد في قرية بُوغ التي تقع على بعد ستة فراسخ من ترمذ.',
        link:
            'https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D9%88_%D8%B9%D9%8A%D8%B3%D9%89_%D9%85%D8%AD%D9%85%D8%AF_%D8%A7%D9%84%D8%AA%D8%B1%D9%85%D8%B0%D9%8A#:~:text=%D9%88%D9%84%D8%AF%20%D9%81%D9%8A%20%D8%AA%D8%B1%D9%85%D8%B0%20%D9%88%D8%A5%D9%84%D9%8A%D9%87%D8%A7%20%D9%8A%D9%8F%D9%86%D8%B3%D8%A8,%D9%83%D9%90%D8%A8%D8%B1%D9%87%20%D8%A8%D8%B9%D8%AF%20%D8%B1%D8%AD%D9%84%D8%AA%D9%87%20%D9%88%D9%83%D8%AA%D8%A7%D8%A8%D8%AA%D9%87%20%D8%A7%D9%84%D8%B9%D9%84%D9%85',
      ),
      theSeer: 'tirmidzi',
    ),
    ContentContainer(
        image: AssetImages.hadisLogo,
        title: " صحيح مسلم",
        widget: const HadisScreen(
          link:
              'https://ar.wikipedia.org/wiki/%D9%85%D8%B3%D9%84%D9%85_%D8%A8%D9%86_%D8%A7%D9%84%D8%AD%D8%AC%D8%A7%D8%AC#:~:text=%D8%A3%D8%A8%D9%88%20%D8%A7%D9%84%D8%AD%D8%B3%D9%8A%D9%86%20%D9%85%D8%B3%D9%84%D9%85%20%D8%A8%D9%86%20%D8%A7%D9%84%D8%AD%D8%AC%D8%A7%D8%AC,%D8%A7%D9%84%D8%AD%D8%AF%D9%8A%D8%AB%20%D8%B5%D8%BA%D9%8A%D8%B1%D9%8B%D8%A7%D8%8C%20%D9%88%D9%83%D8%A7%D9%86%20%D8%A3%D9%88%D9%84%20%D8%B3%D9%85%D8%A7%D8%B9',
          brief:
              'أبو الحسين مسلم بن الحجاج بن مسلم بن وَرْدٍ بن كوشاذ القشيري النيسابوري (206 هـ - 25 رجب 261 هـ) / (822م - 6 يوليو 875م)، هو من أهم علماء الحديث النبوي عند أهل السنة والجماعة، وهو مصنف كتاب صحيح مسلم الذي يعتبر ثاني أصح كتب الحديث بعد صحيح البخاري، وهو أحد كبار الحفّاظ، ولد في نيسابور، طلب الحديث صغيرًا',
        ),
        theSeer: 'muslim'),
    ContentContainer(
      image: AssetImages.hadisLogo,
      title: "سنن ابو داود",
      theSeer: 'abu-dawud',
      widget: const HadisScreen(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A3%D8%A8%D9%88_%D8%AF%D8%A7%D9%88%D8%AF',
          brief:
              'ذكر أبو داود أنه جمع في سننه حوالي 5300 حديثًا، اهتم أبو داود بأحاديث الأحكام التي استدل بها الفقهاء، وبنى عليها علماءُ الأمصار الأحكامَ الفقهية، حيث قال في رسالته لأهل مكة: «فهذه الأحاديث أحاديث السنن كلها في الأحكام، فأما أحاديث كثيرة في الزهد والفضائل، وغيرها من غير هذا فلم أخرجها.»، وقد قسّم كتابه إلى 36 كتابًا'),
    ),
    ContentContainer(
      image: AssetImages.hadisLogo,
      title: "صحيح البخارى",
      theSeer: 'bukhari',
      widget: const HadisScreen(
          link:
              'https://ar.wikipedia.org/wiki/%D9%85%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%A5%D8%B3%D9%85%D8%A7%D8%B9%D9%8A%D9%84_%D8%A7%D9%84%D8%A8%D8%AE%D8%A7%D8%B1%D9%8A',
          brief:
              ' البخارى، ولد فى بخارى إحدى مدن أوزبكستان الحالية عام 194 هجرية (الموافق 810م)، وحصل على مكانته بسبب جمعه للحديث النبوى، وتصنيفه لأهم كتاب فيه والذى يعتمد عليه أهل السنة بصورة أساسية فى كل حياتهم ويعتبرونه الكتاب الأتم والأشمل للسيرة النبوية'),
    ),
    ContentContainer(
      image: AssetImages.hadisLogo,
      title: "سنن ابن ماجه",
      theSeer: 'ibnu-majah',
      widget: const HadisScreen(
          link:
              'https://ar.wikipedia.org/wiki/%D8%A7%D8%A8%D9%86_%D9%85%D8%A7%D8%AC%D9%87',
          brief:
              'أبو عبد الله محمد بن يزيد بن ماجه الربعي (بالولاء) القزويني (209 هـ - 824م / 273 هـ - 886م) هو محدِّث ومفسر ومؤرخ مسلم، وأحد الأئمة في علم الحديث. من أهل قزوين، مولده ووفاته فيها. رحل إلى البصرة وبغداد والشام ومصر ومكة والمدينة والري، في طلب الحديث. وصنف كتابه (سنن ابن ماجه)'),
    ),
    ContentContainer(
      image: AssetImages.hadisLogo,
      title: "سنن النسائي",
      theSeer: 'nasai',
      widget: const HadisScreen(
        link:
            'https://ar.wikipedia.org/wiki/%D8%A3%D8%AD%D9%85%D8%AF_%D8%A8%D9%86_%D8%B4%D8%B9%D9%8A%D8%A8_%D8%A7%D9%84%D9%86%D8%B3%D8%A7%D8%A6%D9%8A',
        brief:
            'أبو عبد الرحمن أحمد بن شعيب بن علي بن سنان بن بحر بن دينار النَّسائي (215 هـ - 303 هـ)، (829م - 915م) محدِث وقاضٍ، وأحد أئمة الحديث النبوي الشريف، صاحب السنن الصغرى والكبرى، المعروف بسنن النسائي، ولد سنة 215 هـ في بلدة نسا من بلاد خراسان قديمًا وتقع في تركمانستان حاليًا، وطلب العلم والحديث وهو صغير',
      ),
    )
  ];
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
                  'أحاديث',
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
                                'Books of Hadis',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(
                                AssetImages.hadisLogo2,
                                color: Colors.white,
                                width: 60,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            ' قال صلى الله عليه وسلم: "من حفظ على أمتي أربعين حديثاً من أمر دينها، بعثه الله يوم القيامة في زمرة الفقهاء والعلماء" وفي رواية " وكنت له يوم القيامة شافعاً وشهيداً" قال النووي رحمه الله تعالى: (واتفق الحفاظ على ضعفه، وإن كثرت طرقه)',
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
                  child: buildItemHadis(context, items),
                ),
              ),
            ]));
      },
    );
  }

  Widget buildItemHadis(context, List<ContentContainer> itemBuilder) =>
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / .8,
        children: List.generate(
            itemBuilder.length,
            (index) => hadisBoxItem(
                itemBuilder: itemBuilder, index: index, context: context)),
      );

  Widget hadisBoxItem({
    context,
    List<dynamic>? itemBuilder,
    int? index,
  }) =>
      InkWell(
        onTap: () {
          QuranicCubit.get(context)
              .getDataHadis('${itemBuilder[index].theSeer}');
          navigateTo(context, itemBuilder[index].widget);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 2.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xffe6f5f1),
                child: Image.asset(
                  itemBuilder![index!].image,
                  height: MediaQuery.of(context).size.height / 19,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              Text(
                '${itemBuilder[index].title}',
                style: GoogleFonts.elMessiri(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    color: primaryColor),
              )
            ],
          ),
        ),
      );
}
