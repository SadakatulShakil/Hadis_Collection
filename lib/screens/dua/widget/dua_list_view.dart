import 'package:al_hadith/data/model/dua_category_model.dart';
import 'package:al_hadith/data/model/dua_model.dart';
import 'package:flutter/material.dart';
import '../../../data/helper/database_helper.dart';
import '../../../utill/color_resources.dart';
import 'dua_details_view.dart';

class DuaListView extends StatefulWidget {
  DuaCategoryModel duaCategoryList;
  DuaListView(this.duaCategoryList);

  @override
  _DuaListViewState createState() => _DuaListViewState();
}

class _DuaListViewState extends State<DuaListView> {
  List<DuaDataModel> _duaDataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDuaData();
  }

  Future<void> _loadDuaData() async {
    final dua = await DatabaseHelper.instance.getAllDuaData();
    setState(() {
      _duaDataList = dua.where((element) => element.category_id == widget.duaCategoryList.id).toList();
      print("chapter_data_length: " + _duaDataList.length.toString());
      print("chapter_data: " + dua.toString());
    });
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
            child: Text('দোয়া সমূহ',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24 / MediaQuery.textScaleFactorOf(context)))),
      ),
      body:Column(
        children: [
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemCount: _duaDataList.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return DuaDetailsView(_duaDataList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
