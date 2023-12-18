import 'package:al_hadith/data/model/hadith_model.dart';
import 'package:flutter/material.dart';

import '../../../data/model/books_model.dart';
import '../../../utill/color_resources.dart';

class HadithDetailsView extends StatelessWidget {
  BooksDataModel booksDataList;
  HadithDataModel hadithDataList;
  HadithDetailsView(this.booksDataList, this.hadithDataList);

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

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
       /// do Item Click event here
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: primaryColor.withOpacity(0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                          color: accent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: .5, color: accent)),
                    child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.menu_book_rounded, color: Colors.white,)),),
                      ),
                      Column(
                        children: [
                          Text(booksDataList.title, style: TextStyle(fontSize: 18 / MediaQuery.textScaleFactorOf(context), color: Colors.white),),
                          Text('হাদিস: '+extractValueAfterColon(hadithDataList.hadith_key), style: TextStyle(fontSize: 15 / MediaQuery.textScaleFactorOf(context), color: primaryBackground.withOpacity(.5)),),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert, color: Colors.white,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                    child: Text(hadithDataList.ar, textAlign: TextAlign.end, style: TextStyle(fontSize: 18 / MediaQuery.textScaleFactorOf(context), color: arabicColor,),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(hadithDataList.narrator+' থেকে বর্ণিত: ', style: TextStyle(fontSize: 18 / MediaQuery.textScaleFactorOf(context), color: Colors.white, fontWeight: FontWeight.w600),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(hadithDataList.bn, style: TextStyle(fontSize: 16 / MediaQuery.textScaleFactorOf(context), color: Colors.white),)),
              ),
            ],
          ),
        )
      ),
    );
  }
}
