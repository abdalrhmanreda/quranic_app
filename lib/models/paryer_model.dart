class PrayerModel {
  Data? data;
  PrayerModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Timing? timings;
  Date? date;
  Data.fromJson(Map<String, dynamic> json) {
    timings = Timing.fromJson(json['timings']);
    date = Date.fromJson(json['date']);
  }
}

class Timing {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;
  Timing.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
  }
}

class Date {
  Hijri? hijri;
  Gregorian? gregorian;
  Date.fromJson(Map<String, dynamic> json) {
    hijri = Hijri.fromJson(json['hijri']);
    gregorian = Gregorian.fromJson(json['gregorian']);
  }
}

class Gregorian {
  Weekday2? weekday2;
  Gregorian.fromJson(Map<String, dynamic> json) {
    weekday2 = Weekday2.fromJson(json['weekday']);
  }
}

class Weekday2 {
  String? en;
  Weekday2.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }
}

class Hijri {
  Month? month;
  String? day;
  Weekday? weekday;
  Hijri.fromJson(Map<String, dynamic> json) {
    month = Month.fromJson(json['month']);
    day = json['day'];
    weekday = Weekday.fromJson(json['weekday']);
  }
}

class Weekday {
  String? en;
  String? ar;
  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }
}

class Month {
  int? number;
  String? en;
  String? ar;

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }
}
