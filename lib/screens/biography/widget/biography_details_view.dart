import 'package:al_hadith/data/model/biography_model.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';

class BiographyDetailsView extends StatelessWidget {
  BiographyDataModel biographyDataList;
  BiographyDetailsView(this.biographyDataList);

  RichText highlightArabicWords(String text) {
    final arabicRegex = RegExp(r' [^ء-ي0-9 ] ', unicode: true, );
    final spans = <TextSpan>[];

    // Split the text into segments of Arabic and non-Arabic words
    final segments = text.split(arabicRegex);

    for (var i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final isArabic = arabicRegex.hasMatch(segment);

      spans.add(
        TextSpan(
          text: segment,
          style: TextStyle(
              fontFamily: 'Arial',
            color: isArabic ? Colors.black : Colors.white,
            fontSize: 16,
              fontWeight: isArabic ? FontWeight.w600 : FontWeight.normal
            // Add any other styles as needed
          ),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
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
            child: Text('নবীর জীবনী',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24 / MediaQuery.textScaleFactorOf(context)))),
      ),
      body: SingleChildScrollView(
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
                            Text(biographyDataList.name, style: TextStyle(fontSize: 20 / MediaQuery.textScaleFactorOf(context), color: Colors.white),),
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
                    alignment: Alignment.centerLeft,
                      child: Text('ঊনার জীবদ্দশা ছিলঃ ' +biographyDataList.lifetime, textAlign: TextAlign.start, style: TextStyle(fontSize: 20 / MediaQuery.textScaleFactorOf(context), color: Colors.white,),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: highlightArabicWords(
                        biographyDataList.biography,
                      ),
                      //Text(biographyDataList.biography, style: TextStyle(fontSize: 16, color: Colors.white),)),
                )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
