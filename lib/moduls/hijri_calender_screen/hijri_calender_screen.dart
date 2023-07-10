import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_first/shared/style/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HijriCalenderScreen extends StatelessWidget {
  const HijriCalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          "التقويم الهجرى",
          style: GoogleFonts.elMessiri(color: primaryColor, fontSize: 19),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: primaryColor, style: BorderStyle.solid),
                        right: BorderSide(
                            color: primaryColor, style: BorderStyle.solid),
                        top: BorderSide(color: primaryColor),
                        bottom: BorderSide(
                            color: primaryColor, style: BorderStyle.solid)),
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle),
                child: SfHijriDateRangePicker(
                  view: HijriDatePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectionShape: DateRangePickerSelectionShape.circle,
                  selectionTextStyle: GoogleFonts.aBeeZee(),
                  monthCellStyle: HijriDatePickerMonthCellStyle(
                      textStyle: GoogleFonts.aBeeZee(),
                      todayTextStyle: GoogleFonts.aBeeZee(color: primaryColor),
                      todayCellDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: primaryColor,
                          ))),
                  showNavigationArrow: true,
                  selectionColor: primaryColor,
                  monthViewSettings: const HijriDatePickerMonthViewSettings(
                      dayFormat: 'EE',
                      viewHeaderStyle: DateRangePickerViewHeaderStyle()),
                  headerStyle: DateRangePickerHeaderStyle(
                      backgroundColor: primaryColor,
                      textStyle: GoogleFonts.aBeeZee(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              item(date: '1 محرم', text: 'الهجرة النبوية الشريفة '),
              item(date: '13 ربيع الاول', text: 'المولد النبوى'),
              item(date: '27 رجب', text: 'ليلة الاسراء والمعراج'),
              item(date: '1 رمضان', text: 'رمضان'),
              item(date: '1 شوال', text: 'عيد الفطر '),
              item(date: '9 ذو الحجة', text: 'وقفة العرفة -الحج'),
              item(date: '10 ذو الحجة', text: 'عيد الاضحي'),
            ],
          ),
        ),
      ),
    );
  }

  Widget item({required String text, required String date}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: GoogleFonts.elMessiri(color: primaryColor, fontSize: 17),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                date,
                style: GoogleFonts.elMessiri(fontSize: 17),
              ),
            ),
          ],
        ),
      );
}
