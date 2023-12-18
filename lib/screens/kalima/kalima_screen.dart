import 'package:al_hadith/screens/kalima/widget/kalima_details_view.dart';
import 'package:al_hadith/utill/color_resources.dart';
import 'package:flutter/material.dart';

import '../../data/helper/database_helper.dart';
import '../../data/model/kalima_model.dart';

class KilimaListScreen extends StatefulWidget {

  @override
  _KilimaListScreenState createState() => _KilimaListScreenState();
}

class _KilimaListScreenState extends State<KilimaListScreen> {

  List<KalimaDataModel> _kalimaDataList = [];
  String convertToBanglaNumber(String englishNumber) {
    Map<String, String> digitMap = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };

    String banglaNumber = '';

    for (int i = 0; i < englishNumber.length; i++) {
      String digit = englishNumber[i];
      banglaNumber += digitMap[digit] ?? digit;
    }

    return banglaNumber;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadKalimaData();
  }

  Future<void> _loadKalimaData() async {
    final kalima = await DatabaseHelper.instance.getAllKalimaData();
    setState(() {
      _kalimaDataList = kalima.toList();
      print("chapter_data_length: " + _kalimaDataList.length.toString());
      print("chapter_data: " + kalima.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text('কালিমা সমূহ',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24 / MediaQuery.textScaleFactorOf(context)))),
      ),
      body:Column(
        children: [
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemCount: _kalimaDataList.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return KalimaDetailsView(_kalimaDataList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}