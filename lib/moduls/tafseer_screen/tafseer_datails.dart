import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shop_app_first/models/ayat_model/ayat_model.dart';
import 'package:shop_app_first/shared/style/constants.dart';

import '../../shared/assets_images/assets_images.dart';
import '../../shared/cubit/cubit/cubit.dart';
import '../../shared/cubit/states/states.dart';

class TafseerDetailsScreen extends StatelessWidget {
  TafseerDetailsScreen({super.key, required this.suraName});
  final String suraName;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! GetTafseerAyatLoadingState,
              builder: (context) => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'سورة $suraName',
                          style: GoogleFonts.elMessiri(
                              color: primaryColor, fontSize: 22),
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => item(
                            context,
                            QuranicCubit.get(context)
                                .ayahsModel!
                                .ayatsTransaltion[index],
                            index),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: QuranicCubit.get(context)
                            .ayahsModel!
                            .ayatsTransaltion
                            .length,
                      )
                    ],
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballScaleRippleMultiple,
                    colors: [primaryColor],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget item(context, Result result, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '${result.arabicText}',
                  maxLines: 5,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.amiriQuran(fontSize: 19),
                ),
              ),
              const SizedBox(
                width: 8,
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
                    "${result.aya}",
                    style: TextStyle(color: primaryColor),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xffdeeece),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              '${result.translation}',
              textDirection: TextDirection.rtl,
              style: GoogleFonts.elMessiri(),
            ),
          ),
        ],
      );
}
