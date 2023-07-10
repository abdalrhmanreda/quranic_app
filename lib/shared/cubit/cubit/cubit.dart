import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_first/models/ayat_model/ayat_model.dart';
import 'package:shop_app_first/models/paryer_model.dart';
import 'package:shop_app_first/network/remote/dio_helper2.dart';
import 'package:shop_app_first/network/remote/dio_helper_prayer.dart';
import 'package:shop_app_first/network/remote/dio_helper_tafsser/dio_helper_tafseer.dart';
import 'package:shop_app_first/shared/cubit/states/states.dart';

import '../../../network/remote/dio_helper.dart';

class QuranicCubit extends Cubit<QuranicStates> {
  QuranicCubit() : super(initialQuranicState());
  static QuranicCubit get(context) => BlocProvider.of(context);

  double tasbihNumber = 0;
  void changeTasbihNumber() {
    tasbihNumber++;
    emit(TasbihChangeState());
  }

  void changeTasbihNumberZero() {
    tasbihNumber = 0;
    emit(TasbihChangeZero());
  }

  List<dynamic> hadis = [];
  String name = '';
  void getDataHadis(String theSeer) {
    hadis = [];
    name = '';
    DioHelperTwo.getData('hadith/$theSeer?page=1&limit=150')!.then((value) {
      hadis = value.data['items'];
      //print(hadis.length);
      name = value.data['name'];

      //print(hadis.toString());

      emit(HadisSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HadisErrorState());
    });
  }

  PrayerModel? prayerModel;
  void getAllParyerToday(String date, String lat, String lon) {
    DioHelperPrayer.getData(
            key: '/timings/$date?latitude=$lat&longitude=$lon&method=4')!
        .then((value) {
      prayerModel = PrayerModel.fromJson(value.data);
      emit(GetAllParyerTodaySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllParyerTodayErrorState());
    });
  }

  AyahsModel? ayahsModel;
  void getTafsserAyat(String index) {
    emit(GetTafseerAyatLoadingState());
    ayahsModel == null;
    DioHelperTafseer.getData(key: '/translation/sura/arabic_moyassar/$index')!
        .then((value) {
      ayahsModel = AyahsModel.fromJson(value.data);
      emit(GetTafseerAyatSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTafseerAyatErrorState());
    });
  }

  // void getAzkar() {
  //   DioHelperAzkar.getData(
  //           key:
  //               '/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json')!
  //       .then((value) {
  //     emit(GetAzkarSuccessState());
  //     print(value.data[10]);
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetAzkarErrorState());
  //   });
  // }

  List<dynamic> moringAzkar = [];
  List<dynamic> nightAzkar = [];
  List<dynamic> azkarAfterPrey = [];
  List<dynamic> sleepingAzkar = [];
  List<dynamic> wakeUpAzkar = [];
  List<dynamic> tesbeeh = [];
  List<dynamic> quranPreyer = [];
  List<dynamic> massengerPreyer = [];

  void getAzkar() {
    rootBundle.loadString('assets/jsonFiles/azkar.json').then((value) {
      var data = json.decode(value);
      moringAzkar = data['أذكار الصباح'];
      nightAzkar = data["أذكار المساء"];
      azkarAfterPrey = data['أذكار بعد السلام من الصلاة المفروضة'];
      sleepingAzkar = data['أذكار النوم'];
      wakeUpAzkar = data['أذكار الاستيقاظ'];
      tesbeeh = data['تسابيح'];
      massengerPreyer = data['أدعية الأنبياء'];
      quranPreyer = data['أدعية قرآنية'];
      emit(GetAzkarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAzkarErrorState());
    });
  }

  List<dynamic> preyers = [];
  void getPreyers() {
    rootBundle.loadString('assets/jsonFiles/preys.json').then((value) {
      var data = json.decode(value);
      preyers = data['data'];
      emit(GetPreyerSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPreyerErrorState());
    });
  }

  List<dynamic> onePreyer = [];
  void getPreyersDetails(String key, String titile) {
    emit(GetPreyerDetailsLoadingState());
    DioHelper.getData(key: key)!.then((value) {
      onePreyer = value.data[titile];
      print(onePreyer[0]['ARABIC_TEXT']);
      emit(GetPreyerDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPreyerDetailsErrorState());
    });
  }
}
