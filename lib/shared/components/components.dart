import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/constants.dart';

// --------------------------- item of tesbeeh------------------------

Widget myDivider() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    );

// ------------------------------ navigate ---------------------------
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

// ---------------------------------- button ---------------------------------
Widget button({
  required String text,
  required Function onPressed,
  required double width,
  required double height,
  required Color buttonColor,
  double? borderRadius,
  String? fontFamily,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: GoogleFonts.elMessiri(fontSize: 19, color: Colors.white),
          maxLines: 1,
        ),
      ),
    );

//------------------------------------- text form filed
Widget defaultTextFormField({
  required bool isPassword,
  required TextInputType type,
  required TextEditingController controller,
  String? Function(String?)? onSubmitted,
  String? Function(String?)? onChanged,
  String? Function(String?)? validate,
  String? hint,
  IconData? prefix,
  IconData? suffixIcon,
  Function? onTap,
  Function? suffixPressed,
  bool? isClick = true,
  InputBorder? border,
  EdgeInsetsGeometry? edgeInsetsGeometry,
}) =>
    TextFormField(
      obscureText: isPassword,
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validate,
      onTap: () {
        onTap;
      },
      enabled: isClick,
      decoration: InputDecoration(
        contentPadding: edgeInsetsGeometry,
        prefixIcon: Icon(
          prefix,
          color: Colors.black45,
        ),
        border: border,
        hintText: hint,
      ),
    );
// ------------------------- toast --------------------------------------------------

Future<bool?> toast() => Fluttertoast.showToast(
    msg: "This is Center Short Toast",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

void showToast({
  required String message,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: stateColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

Color stateColor(ToastState state) {
  Color? color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

// ----------------------------box in home screen and choose screen ----------------------

// ---------------------------------------- class use it in box item ---------------------

class ContentContainer {
  final String image;
  final String title;
  Widget? widget;
  String? theSeer;

  ContentContainer({
    required this.image,
    required this.title,
    this.widget,
    this.theSeer,
  });
}

Widget buildItem(context, List<ContentContainer> itemBuilder) => GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 10.w,
      //childAspectRatio: 1 / .8,
      children: List.generate(
          itemBuilder.length,
          (index) => mainBoxItem(
              itemBuilder: itemBuilder, index: index, context: context)),
    );

Widget mainBoxItem({
  context,
  List<dynamic>? itemBuilder,
  int? index,
}) =>
    InkWell(
      onTap: () {
        navigateTo(context, itemBuilder[index].widget);
      },
      child: Container(
        padding: EdgeInsets.all(10.h),
        width: MediaQuery.of(context).size.width / 2.2,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xffe6f5f1),
              child: Image.asset(
                itemBuilder![index!].image,
                height: MediaQuery.of(context).size.height / 19,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Text(
              '${itemBuilder[index].title}',
              style:
                  GoogleFonts.elMessiri(fontSize: 16.sp, color: primaryColor),
            )
          ],
        ),
      ),
    );
