import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shop_app_first/shared/components/components.dart';
import 'package:shop_app_first/shared/style/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/assets_images/assets_images.dart';
import '../../shared/cubit/cubit/cubit.dart';
import '../../shared/cubit/states/states.dart';

class HadisScreen extends StatelessWidget {
  final String brief;
  final String link;
  const HadisScreen({super.key, required this.brief, required this.link});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: ConditionalBuilder(
            condition: QuranicCubit.get(context).hadis.isNotEmpty &&
                QuranicCubit.get(context).name.isNotEmpty,
            builder: (context) => CustomScrollView(
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
                          color: Colors.white,
                          Icons.arrow_back_ios_new_outlined),
                    ),
                    expandedHeight: 320,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Some hadiths from the book\n of ${QuranicCubit.get(context).name}',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 19,
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
                                brief,
                                style:
                                    GoogleFonts.elMessiri(color: Colors.white),
                                textDirection: TextDirection.rtl,
                                maxLines: 7,
                              ),
                              Row(
                                children: [
                                  Text(
                                      'know more about ${QuranicCubit.get(context).name}',
                                      style: GoogleFonts.elMessiri(
                                          color: Colors.white)),
                                  TextButton(
                                    onPressed: () async {
                                      Uri url = Uri.parse(link);
                                      await launchUrl(url);
                                    },
                                    child: Text('press here',
                                        style: GoogleFonts.elMessiri(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.white)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ConditionalBuilder(
                      condition: QuranicCubit.get(context).hadis.isNotEmpty,
                      builder: (context) => ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '${QuranicCubit.get(context).hadis[index]['arab']}',
                                  style: GoogleFonts.elMessiri(
                                      fontSize: 15, color: primaryColor),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: QuranicCubit.get(context).hadis.length),
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
                  ),
                ]),
            fallback: (context) => Center(
              child: SizedBox(
                width: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  colors: [primaryColor],
                ),
              ),
            ),
          ));
        });
  }
}
