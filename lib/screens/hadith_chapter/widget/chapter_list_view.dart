import 'package:al_hadith/data/model/chapter_model.dart';
import 'package:flutter/material.dart';

import '../../../data/model/books_model.dart';
import '../../../utill/color_resources.dart';
import '../../hadith_details/hadith_discloser_screen.dart';

class ChapterView extends StatelessWidget {
  BooksDataModel booksDataList;
  ChapterDataModel chapterDataList;
  ChapterView(this.booksDataList, this.chapterDataList);


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> HadithDiscloserScreen(booksDataList, chapterDataList)
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
          title: Text(chapterDataList.title, style: TextStyle(color: Colors.white, fontSize: 18),),
          subtitle: Text('হাদিসের রেন্জ: '+chapterDataList.hadis_range,style: TextStyle(color: primaryBackground.withOpacity(.5))),
        ),
      ),
    );
  }
}
