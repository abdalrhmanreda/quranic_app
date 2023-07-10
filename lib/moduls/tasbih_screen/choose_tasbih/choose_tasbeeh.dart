import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit/cubit.dart';
import '../../../shared/cubit/states/states.dart';
import '../../../shared/style/constants.dart';

class TasbeehPage {
  final String arText;
  final String enText;
  final String desc;

  TasbeehPage({
    required this.arText,
    required this.enText,
    required this.desc,
  });
}

class ChooseTasbeehScreen extends StatelessWidget {
  ChooseTasbeehScreen({Key? key}) : super(key: key);

  var pageController = PageController();

  List<TasbeehPage> items = [
    TasbeehPage(
        arText: 'سُبْحَانَ اللَّهِ',
        enText: 'Subhan Allah',
        desc: 'Glory to God'),
    TasbeehPage(
        arText: 'الْحَمْدُ لِلَّهِ',
        enText: 'al-hamdulillah',
        desc: 'Thank God'),
    TasbeehPage(
        arText: 'اللّهُ أكْبَر',
        enText: 'Allah Akbar',
        desc: 'Allah is the Greatest'),
    TasbeehPage(
        arText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ِ',
        enText: 'Subhana allah we bihamdihi',
        desc: 'Glorified is God and by His Praise'),
    TasbeehPage(
        arText: 'لا اله الا اللهِ ِ', enText: 'La ilaha illa\'llah', desc: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.9,
                  child: PageView.builder(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => tabeehItem(
                        QuranicCubit.get(context).tesbeeh[index], context),
                    itemCount: QuranicCubit.get(context).tesbeeh.length - 1,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    allowImplicitScrolling: true,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 1.8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: primaryColor,
                        width: 10),
                  ),
                  child: Text(
                    "${QuranicCubit.get(context).tasbihNumber.round()}",
                    style: GoogleFonts.elMessiri(fontSize: 50),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 15,
                ),
                button(
                    width: 150,
                    height: 50,
                    text: 'تسبيح',
                    onPressed: () {
                      QuranicCubit.get(context).changeTasbihNumber();
                    },
                    buttonColor: primaryColor,
                    borderRadius: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 19,
                ),
                button(
                    width: 150,
                    height: 50,
                    text: 'اعادة',
                    onPressed: () {
                      QuranicCubit.get(context).changeTasbihNumberZero();
                    },
                    buttonColor: primaryColor,
                    borderRadius: 10),
              ],
            ),
          );
        });
  }

  Widget tabeehItem(tesbeeh, context) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tesbeeh['content'],
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: GoogleFonts.elMessiri(
                fontSize: 21,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              tesbeeh['description'],
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: GoogleFonts.elMessiri(
                  fontSize: 17, color: Colors.white, height: 1.5),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'مرة ${tesbeeh['count']}',
              style: GoogleFonts.elMessiri(fontSize: 17, color: Colors.white),
            ),
          ],
        ),
      );
}
