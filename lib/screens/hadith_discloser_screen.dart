import 'dart:math';

import 'package:al_hadith/data/model/books_model.dart';
import 'package:al_hadith/data/model/chapter_model.dart';
import 'package:al_hadith/data/model/hadith_model.dart';
import 'package:flutter/material.dart';

import '../data/helper/database_helper.dart';
import '../utill/color_resources.dart';
import 'hadth_list_screen.dart';

class HadithDiscloserScreen extends StatefulWidget {
  BooksDataModel booksDataList;
  ChapterDataModel chapterDataList;
  HadithDiscloserScreen(this.booksDataList, this.chapterDataList);

  @override
  _HadithDiscloserScreenState createState() => _HadithDiscloserScreenState();
}

class _HadithDiscloserScreenState extends State<HadithDiscloserScreen> {

  List<HadithDataModel> _hadithDataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadLocalHadithData();
  }
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

  String extractValueAfterColon(String inputString) {
    // Remove the trailing semicolon
    if (inputString.endsWith(';')) {
      inputString = inputString.substring(0, inputString.length - 1);
    }

    // Split the string based on ':'
    List<String> parts = inputString.split(':');

    // Extract the part after ':'
    String result = parts.length > 1 ? parts[1] : '';

    return result;
  }
  Future<void> _loadLocalHadithData() async {
    print('check: '+widget.chapterDataList.chapter_id.toString()+'----'+widget.chapterDataList.book_id.toString());
    final hadith = await DatabaseHelper.instance.getAllHadithData(widget.chapterDataList.chapter_id, widget.chapterDataList.book_id);
    setState(() {
      _hadithDataList = hadith.toList();
      print("hadith_data_length: " + _hadithDataList.length.toString());
      print("hadith_data: " + hadith.toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.booksDataList.title)),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.chapterDataList.title,style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15))),
          ],
        ),
      ),
      body:Column(
        children: [
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemCount: _hadithDataList.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context)=> HadithDiscloserScreen(widget.booksDataList, _chapterDataList[index])
                    // ));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: primaryColor.withOpacity(0),
                    child: ListTile(
                      leading: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: accent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: .5, color: accent)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/icon.png', width: 30,height: 30,)),
                      ),
                      title: Text(widget.booksDataList.title, style: TextStyle(color: Colors.white, fontSize: 18)),
                      subtitle: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                              child: Text('হাদিস: '+extractValueAfterColon(_hadithDataList[index].hadith_key), style: TextStyle(color: primaryBackground.withOpacity(.5)))),
                          SizedBox(height: 8,),
                          Text(_hadithDataList[index].ar, style: TextStyle(color: Colors.white, fontSize: 18)),
                          SizedBox(height: 8,),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(_hadithDataList[index].narrator+' থেকে বর্ণিত: ', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600))),
                          SizedBox(height: 8,),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(_hadithDataList[index].bn, style: TextStyle(color: Colors.white, fontSize: 15))),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}