import 'package:al_hadith/data/model/biography_model.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';

class BiographyDetailsView extends StatelessWidget {
  BiographyDataModel biographyDataList;
  BiographyDetailsView(this.biographyDataList);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text('নবীর জীবনী',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15))),
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
                            Text(biographyDataList.name, style: TextStyle(fontSize: 18, color: Colors.white),),
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
                      child: Text('ঊনার জীবদ্দশা ছিলঃ ' +biographyDataList.lifetime, textAlign: TextAlign.end, style: TextStyle(fontSize: 18, color: Colors.white,),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(biographyDataList.biography, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),)),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
