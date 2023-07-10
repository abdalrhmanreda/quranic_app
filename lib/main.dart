/*
░█████╗░██████╗░██████╗░░█████╗░██╗░░░░░██████╗░░█████╗░██╗░░██╗███╗░░░███╗░█████╗░███╗░░██╗
██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██║░░██║████╗░████║██╔══██╗████╗░██║
███████║██████╦╝██║░░██║███████║██║░░░░░██████╔╝███████║███████║██╔████╔██║███████║██╔██╗██║
██╔══██║██╔══██╗██║░░██║██╔══██║██║░░░░░██╔══██╗██╔══██║██╔══██║██║╚██╔╝██║██╔══██║██║╚████║
██║░░██║██████╦╝██████╔╝██║░░██║███████╗██║░░██║██║░░██║██║░░██║██║░╚═╝░██║██║░░██║██║░╚███║
╚═╝░░╚═╝╚═════╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shop_app_first/moduls/home_screen/home_screen.dart';
import 'package:shop_app_first/network/local/cache_helper.dart';
import 'package:shop_app_first/network/remote/dio_helper.dart';
import 'package:shop_app_first/network/remote/dio_helper2.dart';
import 'package:shop_app_first/network/remote/dio_helper_azkar.dart';
import 'package:shop_app_first/network/remote/dio_helper_prayer.dart';
import 'package:shop_app_first/shared/blocObserver.dart';
import 'package:shop_app_first/shared/cubit/cubit/cubit.dart';

import 'moduls/on_boarding_screen/on_boarding_screen.dart';
import 'network/remote/dio_helper_tafsser/dio_helper_tafseer.dart';

Position? position;
bool servicesEnabled = false;
late LocationPermission permission;
String city = '';
String country = '';
Future<Position> getCurrentPosition() async {
  servicesEnabled = await Geolocator.isLocationServiceEnabled();
  if (!servicesEnabled) {
    print('services disabled');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  return await Geolocator.getCurrentPosition();
}

getAddressFromCoordinate(lat, lon) async {
  try {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    city = '${place.locality}';
    country = '${place.country}';
  } catch (e) {}
}

String date() {
  var now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  position = await getCurrentPosition();
  await getAddressFromCoordinate(position!.latitude, position!.longitude);
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // dio
  DioHelper.init();
  DioHelperTwo.init();
  DioHelperPrayer.init();
  DioHelperTafseer.init();
  DioHelperAzkar.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding') as bool?;
  Widget widget;
  if (onBoarding != null) {
    widget = HomeScreen();
  } else {
    widget = OnBoardingScreen();
  }
  runApp(QuranicApp(
    lat: position!.latitude.toString(),
    lon: position!.longitude.toString(),
    startWidget: widget,
    date: date(),
  ));
}

class QuranicApp extends StatelessWidget {
  const QuranicApp({
    super.key,
    required this.startWidget,
    required this.lat,
    required this.lon,
    required this.date,
  });

  final Widget startWidget;
  final String lat;
  final String lon;
  final String date;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => QuranicCubit()
              ..getAllParyerToday(lat, lon, date)
              ..getAzkar()
              ..getPreyers()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return startWidget;
                },
              ),
              theme: ThemeData(
                  scaffoldBackgroundColor: const Color(0xfff5fdfd),
                  appBarTheme: AppBarTheme(
                    iconTheme: const IconThemeData(
                      color: Colors.black,
                    ),
                    elevation: 0,
                    titleTextStyle: GoogleFonts.elMessiri(
                      fontSize: 25,
                    ),
                    backgroundColor: const Color(0xfff5fdfd),
                  )),
            );
          }),
    );
  }
}
