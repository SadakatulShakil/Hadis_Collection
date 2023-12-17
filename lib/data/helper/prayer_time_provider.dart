import 'dart:convert';

import 'package:al_hadith/data/model/prayer_timing_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrayerTimeProvider with ChangeNotifier{

  String _fazar = '0:0';
  String _duhor = '0:0';
  String _asar = '0:0';
  String _magrib = '0:0';
  String _isha = '0:0';
  String _date = '0:0';

  PrayerTiming? prayerData;

  String get FazarTime =>_fazar;

  void updateFazarTime(String time){
      _fazar = time;
      notifyListeners();
  }

  String get DuhorTime =>_duhor;

  void updateDuhorTime(String time){
    _duhor = time;
    notifyListeners();
  }

  String get AsarTime =>_asar;

  void updateAsarTime(String time){
    _asar = time;
    notifyListeners();
  }

  String get MagribTime =>_magrib;

  void updateMagribTime(String time){
    _fazar = time;
    notifyListeners();
  }

  String get ishaTime =>_isha;

  void updateIshaTime(String time){
    _isha = time;
    notifyListeners();
  }


  Future<dynamic> getPrayerData(BuildContext context, String formattedDate, ) async{

    final String prayerUrl = 'http://api.aladhan.com/v1/timings/$formattedDate?latitude=23.80042928701889&longitude=90.39726608776283&method=1';

    try {
      final response = await http.get(Uri.parse(prayerUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        prayerData = PrayerTiming.fromJson(jsonData);
        _fazar = prayerData!.data!.timings!.fajr.toString();
        _duhor = prayerData!.data!.timings!.dhuhr.toString();
        _asar= prayerData!.data!.timings!.asr.toString();
        _magrib = prayerData!.data!.timings!.maghrib.toString();
        _isha = prayerData!.data!.timings!.isha.toString();
        _date = prayerData!.data!.date!.hijri!.date.toString();

        print('prayer_time: '+ _fazar+'..'+_duhor+'..'+_asar+'..'+_magrib+'..'+_isha);
        notifyListeners();
      } else {
        notifyListeners();
        print("res: "+ response.statusCode.toString());
        throw Exception('Failed to getData');
      }
    } catch (e) {
      notifyListeners();
      throw Exception('Failed for'+e.toString());
    }
  }

}