import 'dart:math';

import 'package:al_hadith/screens/home/widget/banners_view.dart';
import 'package:al_hadith/screens/home/widget/dashboard_view.dart';
import 'package:al_hadith/utill/color_resources.dart';
import 'package:flutter/material.dart';
import '../../data/helper/database_helper.dart';
import '../../data/model/books_model.dart';
import '../hadith_chapter/hadth_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BooksDataModel> _booksDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadLocalBooksData();
  }

  Future<void> _loadLocalBooksData() async {
    final books = await DatabaseHelper.instance.getAllBooksData();
    setState(() {
      _booksDataList = books.toList();
      print("books_data_length: " + _booksDataList.length.toString());
      print("books_data: " + books.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text('ঈমান ও সুন্নাহ'),
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        drawer: Drawer(
          child: DrawerContent(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannersView(),
              Stack(
                children: [
                  Positioned(
                    top: 70,
                    left: 40,
                    right: 40,
                    child: Column(
                      children: [
                        Text('Today 9-9-2023', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),),
                        Text('Fazar start 04:50 AM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17)),
                      ],
                    ),
                  ),
                Image.asset('assets/images/mosque_back.png', color: Colors.black.withOpacity(0.3),),
                ],),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),  // Adjust the radius as needed
                    bottomRight: Radius.circular(10.0), // Adjust the radius as needed
                  ),)
        ),
              Container(
                height: 120,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: primaryColor.withOpacity(0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 8, bottom: 8, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/sefa_icon.png', width: 35,height: 35,),
                            SizedBox(height: 8,),
                            Text('কালিমা', style: TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/dua_icon.png', width: 40,height: 40,),
                            SizedBox(height: 8,),
                            Text('দোয়া', style: TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/biography_icon.png', width: 40,height: 40,),
                            SizedBox(height: 8,),
                            Text('জীবনী', style: TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/qibla_icon.png', width: 40,height: 40,),
                            SizedBox(height: 8,),
                            Text('কিবলা', style: TextStyle(color: Colors.white),)
                          ],
                        )
                      ],
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: _booksDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DashboardCard(_booksDataList[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

