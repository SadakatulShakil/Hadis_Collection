import 'dart:math';
import 'package:al_hadith/data/model/books_model.dart';
import 'package:al_hadith/data/model/chapter_model.dart';
import 'package:al_hadith/utill/color_resources.dart';
import 'package:flutter/material.dart';

import '../data/helper/database_helper.dart';
import 'hadith_discloser_screen.dart';

class HadithListScreen extends StatefulWidget {
  BooksDataModel booksDataList;
  HadithListScreen(this.booksDataList);

  @override
  _HadithListScreenState createState() => _HadithListScreenState();
}

class _HadithListScreenState extends State<HadithListScreen> {

  List<ChapterDataModel> _chapterDataList = [];
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
    _loadLocalChapterData();
  }

  Future<void> _loadLocalChapterData() async {
    final chapter = await DatabaseHelper.instance.getAllChapterData();
    setState(() {
      _chapterDataList = chapter.where((element) => element.book_id == widget.booksDataList.id).toList();
      print("chapter_data_length: " + _chapterDataList.length.toString());
      print("chapter_data: " + chapter.toString());
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
                child: Text(widget.booksDataList.number_of_hadis.toString()+' টি হাদিস',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15))),
          ],
        ),
      ),
      body:Column(
        children: [
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemCount: _chapterDataList.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> HadithDiscloserScreen(widget.booksDataList, _chapterDataList[index])
                    ));
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
                      title: Text(_chapterDataList[index].title, style: TextStyle(color: Colors.white, fontSize: 18),),
                      subtitle: Text('হাদিসের রেন্জ: '+_chapterDataList[index].hadis_range,style: TextStyle(color: primaryBackground.withOpacity(.5))),
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