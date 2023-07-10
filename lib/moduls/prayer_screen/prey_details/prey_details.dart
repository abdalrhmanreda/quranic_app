import 'package:audioplayers/audioplayers.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shop_app_first/shared/cubit/cubit/cubit.dart';
import 'package:shop_app_first/shared/cubit/states/states.dart';
import 'package:shop_app_first/shared/style/constants.dart';

class PreyDetailsScreen extends StatelessWidget {
  PreyDetailsScreen({super.key, required this.title});
  AudioPlayer myAudioPlayer = AudioPlayer();
  final String title;
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! GetPreyerDetailsLoadingState,
            builder: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Text(
                      title,
                      style: GoogleFonts.elMessiri(
                          color: primaryColor, fontSize: 22),
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: item(context,
                                QuranicCubit.get(context).onePreyer[index]),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: QuranicCubit.get(context).onePreyer.length)
                ],
              ),
            ),
            fallback: (context) => Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  colors: [primaryColor],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget item(context, doaaItem) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xffdeeece),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(
              '${doaaItem['ARABIC_TEXT']}',
              textDirection: TextDirection.rtl,
              style: GoogleFonts.elMessiri(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'عدد مرات التكرار :${doaaItem['REPEAT']}',
                  style: GoogleFonts.elMessiri(),
                ),
                IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        myAudioPlayer.pause().then((value) {
                          print('paused success');
                          isPlaying = false;
                        }).catchError((error) {
                          print('paused failed');
                        });
                      } else {
                        Source urlSource = UrlSource(
                            "https://www.hisnmuslim.com/audio/ar/${doaaItem['ID']}.mp3");
                        myAudioPlayer.play(urlSource).then((value) {
                          print('played success');
                          isPlaying = true;
                        }).catchError((error) {
                          print('sada');
                          print('played failed');
                        });
                      }
                    },
                    icon: isPlaying == false
                        ? const Icon(Icons.play_arrow)
                        : const Icon(Icons.pause))
              ],
            )
          ],
        ),
      );
}
