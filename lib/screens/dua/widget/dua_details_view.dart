import 'package:al_hadith/data/model/dua_model.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';

class DuaDetailsView extends StatelessWidget {
  DuaDataModel duaDataList;
  DuaDetailsView(this.duaDataList);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text('দোয়া',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24 / MediaQuery.textScaleFactorOf(context)))),
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
                            Text(duaDataList.name, style: TextStyle(fontSize: 18 / MediaQuery.textScaleFactorOf(context), color: Colors.white),),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_vert, color: Colors.white,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerRight,
                      child: Text(duaDataList.dua_ar, textAlign: TextAlign.end, style: TextStyle(fontSize: 18 / MediaQuery.textScaleFactorOf(context), color: arabicColor, fontWeight: FontWeight.w600),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('বাংলা উচ্চারনঃ ', textAlign: TextAlign.end, style: TextStyle(fontSize: 16 / MediaQuery.textScaleFactorOf(context), color: Colors.white,),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(duaDataList.pronunciation, style: TextStyle(fontSize: 16 / MediaQuery.textScaleFactorOf(context), color: arabicColor, fontWeight: FontWeight.w600),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('বাংলা অনুবাদঃ ', textAlign: TextAlign.end, style: TextStyle(fontSize: 16 / MediaQuery.textScaleFactorOf(context), color: Colors.white,),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(duaDataList.dua_bn, style: TextStyle(fontSize: 16 / MediaQuery.textScaleFactorOf(context), color: Colors.white),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Divider(color: Colors.white,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('দোয়ার '+duaDataList.fazilat, style: TextStyle(fontSize: 16 / MediaQuery.textScaleFactorOf(context), color: Colors.white),)),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
