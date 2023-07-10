import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_first/moduls/prayer_screen/prey_details/prey_details.dart';
import 'package:shop_app_first/shared/components/components.dart';
import 'package:shop_app_first/shared/style/constants.dart';

import '../../shared/assets_images/assets_images.dart';
import '../../shared/cubit/cubit/cubit.dart';
import '../../shared/cubit/states/states.dart';

class PreysScreen extends StatelessWidget {
  PreysScreen({super.key});

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
                    'أدعية',
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
                                  'My Favorite Preyer',
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
                              ' قال صلى الله عليه وسلم : ” من فُتح له منكم باب الدعاء فتحت له أبواب الرحمة، وما سئل الله شيئًا يعطى أحب إليه من أن يُسأل العافية؛ إن الدعاء ينفع مما نزل ومما لم ينزل؛ فعليكم عباد الله بالدعاء” . (رواه الترمذي)',
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
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => item(
                            QuranicCubit.get(context).preyers[index], context),
                        itemCount: QuranicCubit.get(context).preyers.length)),
              ],
            ),
          );
        });
  }

  Widget item(preyer, context) => ListTile(
        title: Text(
          '${preyer['TITLE']}',
          style: GoogleFonts.elMessiri(
            fontSize: 18,
          ),
          textDirection: TextDirection.rtl,
        ),
        onTap: () {
          QuranicCubit.get(context)
              .getPreyersDetails('${preyer['ID']}.json', '${preyer['TITLE']}');
          navigateTo(
              context,
              PreyDetailsScreen(
                title: '${preyer['TITLE']}',
              ));
        },
      );
}
