import 'package:al_hadith/data/model/kalima_model.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';

class KalimaDetailsView extends StatelessWidget {
  KalimaDataModel kalimaDataList;
  KalimaDetailsView(this.kalimaDataList);

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
                          Text(kalimaDataList.name, style: TextStyle(fontSize: 18, color: Colors.white),),
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
                    child: Text(kalimaDataList.kalima_ar, textAlign: TextAlign.end, style: TextStyle(fontSize: 20, color: arabicColor, fontWeight: FontWeight.w600),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('বাংলা উচ্চারনঃ ', textAlign: TextAlign.end, style: TextStyle(fontSize: 16, color: Colors.white,),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(kalimaDataList.pronunciation, style: TextStyle(fontSize: 16, color: arabicColor, fontWeight: FontWeight.w600),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('বাংলা অনুবাদঃ ', textAlign: TextAlign.end, style: TextStyle(fontSize: 16, color: Colors.white,),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(kalimaDataList.kalima_bn, style: TextStyle(fontSize: 16, color: Colors.white),)),
              )
            ],
          ),
        )
      ),
    );
  }
}
