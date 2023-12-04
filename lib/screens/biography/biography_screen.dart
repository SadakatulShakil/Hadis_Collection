import 'package:al_hadith/data/model/biography_model.dart';
import 'package:al_hadith/screens/biography/widget/biography_list_view.dart';
import 'package:al_hadith/utill/color_resources.dart';
import 'package:flutter/material.dart';

import '../../data/helper/database_helper.dart';

class BiographyListScreen extends StatefulWidget {

  @override
  _BiographyListScreenState createState() => _BiographyListScreenState();
}

class _BiographyListScreenState extends State<BiographyListScreen> {

  List<BiographyDataModel> _biographyDataList = [];
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
    _loadBiographyData();
  }

  Future<void> _loadBiographyData() async {
    final biography = await DatabaseHelper.instance.getAllBiographyData();
    setState(() {
      _biographyDataList = biography.toList();
      print("chapter_data_length: " + _biographyDataList.length.toString());
      print("chapter_data: " + biography.toString());
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
            child: Text('জীবনী সমূহ',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15))),
      ),
      body:Column(
        children: [
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemCount: _biographyDataList.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return BiographyListView(_biographyDataList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}