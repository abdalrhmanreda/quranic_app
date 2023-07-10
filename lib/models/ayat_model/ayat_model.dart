class AyahsModel {
  List<Result> ayatsTransaltion = [];
  AyahsModel.fromJson(Map<String, dynamic> json) {
    json['result'].forEach((element) {
      ayatsTransaltion.add(Result.fromJson(element));
    });
  }
}

class Result {
  String? id;
  String? sura;
  String? aya;
  String? arabicText;
  String? translation;
  Result.fromJson(Map<String, dynamic> fromJson) {
    id = fromJson['id'];
    sura = fromJson['sura'];
    aya = fromJson['aya'];
    arabicText = fromJson['arabic_text'];
    translation = fromJson['translation'];
  }
}
