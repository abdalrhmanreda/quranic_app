import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

class SoaraScreen extends StatefulWidget {
  int soaraIndex;
  SoaraScreen(this.soaraIndex);

  @override
  State<SoaraScreen> createState() => _SoaraScreenState();
}

class _SoaraScreenState extends State<SoaraScreen> {
  var scrollController = ScrollController();
  double myValue = 5;
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: InkWell(
            onTap: () {
              setState(() {
                if (myValue == 0 || myValue < 0) {
                  myValue = 1;
                }
                myValue--;
                print(myValue);
                Future.delayed(const Duration(milliseconds: 2), () {
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(
                          seconds: quran.getVerseCount(widget.soaraIndex) *
                              myValue.round()),
                      curve: Curves.linear);
                });
              });
            },
            onDoubleTap: () {
              setState(() {
                myValue++;
                print(myValue);
                Future.delayed(const Duration(milliseconds: 2), () {
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(
                          seconds: quran.getVerseCount(widget.soaraIndex) *
                              myValue.round()),
                      curve: Curves.linear);
                });
              });
            },
            child: Column(
              children: [
                if (widget.soaraIndex != 9 && widget.soaraIndex != 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      quran.basmala,
                      style: GoogleFonts.amiriQuran(fontSize: 22),
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Text(
                    quran
                        .getVerse(widget.soaraIndex, index + 1,
                            verseEndSymbol: true)
                        .replaceAll('', ''),
                    style: GoogleFonts.amiriQuran(
                      fontSize: MediaQuery.of(context).size.width / 19,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quran.getVerseCount(widget.soaraIndex),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
