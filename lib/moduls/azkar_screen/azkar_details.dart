import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/cubit/cubit/cubit.dart';
import '../../shared/cubit/states/states.dart';
import '../../shared/style/constants.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key, this.listOfZekr});
  final dynamic listOfZekr;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranicCubit, QuranicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Text(
                      '${listOfZekr[0]['category']}',
                      style: GoogleFonts.elMessiri(
                          fontSize: 22, color: primaryColor),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xffdeeece),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            '${listOfZekr[index]['content']}',
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.elMessiri(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'عدد المرات : ${'${listOfZekr[index]['count']}'}',
                                style: GoogleFonts.elMessiri(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: listOfZekr.length,
                  )
                ],
              )),
        );
      },
    );
  }
}
