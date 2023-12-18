import 'package:al_hadith/data/model/biography_model.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import 'biography_details_view.dart';

class BiographyListView extends StatelessWidget {
  BiographyDataModel biographyDataList;
  BiographyListView(this.biographyDataList);


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> BiographyDetailsView(biographyDataList)
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
                child: Image.asset('assets/images/book_icon6.png', width: 40,height: 45,)),
          ),
          title: Text(biographyDataList.name, style: TextStyle(color: Colors.white, fontSize: 18 / MediaQuery.textScaleFactorOf(context)),),
        ),
      ),
    );
  }
}
