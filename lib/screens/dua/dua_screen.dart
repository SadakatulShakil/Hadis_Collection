import 'package:al_hadith/data/model/dua_model.dart';
import 'package:al_hadith/screens/dua/widget/dua_details_view.dart';
import 'package:al_hadith/screens/dua/widget/dua_list_view.dart';
import 'package:al_hadith/utill/color_resources.dart';
import 'package:flutter/material.dart';

import '../../data/helper/database_helper.dart';

class DuaListScreen extends StatefulWidget {

  @override
  _DuaListScreenState createState() => _DuaListScreenState();
}

class _DuaListScreenState extends State<DuaListScreen> {

  List<DuaDataModel> _duaDataList = [];
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
    _loadDuaData();
  }

  Future<void> _loadDuaData() async {
    final dua = await DatabaseHelper.instance.getAllDuaData();
    setState(() {
      _duaDataList = dua.toList();
      print("chapter_data_length: " + _duaDataList.length.toString());
      print("chapter_data: " + dua.toString());
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
            child: Text('দোয়া সমূহ',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24 / MediaQuery.textScaleFactorOf(context)))),
      ),
      body:Column(
        children: [
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemCount: _duaDataList.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return DuaListView(_duaDataList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}