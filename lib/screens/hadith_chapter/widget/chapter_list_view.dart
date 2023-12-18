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
                color: primaryColor.withOpacity(0),
                borderRadius: BorderRadius.circular(20)),
            child: Align(
                alignment: Alignment.center,
                child: booksDataList.id ==1 ?
                Image.asset('assets/images/book_icon.png', width: 40,height: 45,):
                booksDataList.id ==2 ?
                Image.asset('assets/images/book_icon2.png', width: 40,height: 45,):
                booksDataList.id ==3 ?
                Image.asset('assets/images/book_icon3.png', width: 40,height: 45,):
                booksDataList.id ==4 ?
                Image.asset('assets/images/book_icon4.png', width: 40,height: 45,):
                booksDataList.id ==5 ?
                Image.asset('assets/images/book_icon5.png', width: 40,height: 45,):
                Image.asset('assets/images/book_icon6.png', width: 40,height: 45,)),
          ),
          title: Text(chapterDataList.title, style: TextStyle(color: Colors.white, fontSize: 18 / MediaQuery.textScaleFactorOf(context)),),
          subtitle: Text('হাদিসের রেন্জ: '+chapterDataList.hadis_range,style: TextStyle(color: primaryBackground.withOpacity(.5), fontSize: 16 / MediaQuery.textScaleFactorOf(context))),
        ),
      ),
    );
  }
}
