import 'package:al_hadith/data/model/dua_category_model.dart';
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

  List<DuaCategoryModel> _duaCategoryList = [];
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
    _loadDuaCategory();
  }

  Future<void> _loadDuaCategory() async {
    final duaCategory = await DatabaseHelper.instance.getDuaCategoryData();
    setState(() {
      _duaCategoryList = duaCategory.toList();
      print("chapter_data_length: " + _duaCategoryList.length.toString());
      print("chapter_data: " + duaCategory.toString());
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
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _duaDataList.length,
          //     padding: const EdgeInsets.symmetric(horizontal: 8),
          //     itemBuilder: (context, index) {
          //       return DuaListView(_duaDataList[index]);
          //     },
          //   ),
          // ),

      Container(
        width: MediaQuery.of(context).size.width-20, // Set width as per your requirement
        height: MediaQuery.of(context).size.height/5, // Set height as per your requirement
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Set border radius as per your requirement
          child: Image.asset(
            'assets/images/dua_banner.png', // Replace with your image URL
            fit: BoxFit.cover,
          ),
        )
      ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _duaCategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=> DuaListView(_duaCategoryList[index])
                      ));
                    },
                    child: Card(
                      color: primaryColor.withOpacity(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Align(
                              alignment: Alignment.center,
                              child: _duaCategoryList[index].id ==1 ?
                              Image.asset('assets/images/rabbana.png', width: 40,height: 45,):
                              _duaCategoryList[index].id ==2 ?
                              Image.asset('assets/images/parents.png', width: 40,height: 45,):
                              _duaCategoryList[index].id ==3 ?
                              Image.asset('assets/images/personal.png', width: 40,height: 45,):
                              Image.asset('assets/images/relative.png', width: 40,height: 45,)),
                          SizedBox(height: 10,),
                          _duaCategoryList[index].id ==1?
                          Text('৪০ রব্বানা\nদোয়া',textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15 / MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ):
                          _duaCategoryList[index].id ==2?
                          Text('পিতা-মাতার\nদোয়া',textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15 / MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ):
                          _duaCategoryList[index].id ==3?
                          Text('নিজের জন্য\nদোয়া',textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15 / MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ):Text('আত্মীয়ের জন্য\nদোয়া', textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15 / MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}