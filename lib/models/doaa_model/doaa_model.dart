class DoaaModel {
  int? id;
  String? arbText;
  int? repeat;
  String? audio;

  DoaaModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    arbText = json['ARABIC_TEXT'];
    repeat = json['REPEAT'];
    audio = json['AUDIO'];
  }
}
