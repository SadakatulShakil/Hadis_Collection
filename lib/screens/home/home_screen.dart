import 'dart:math';
import 'package:al_hadith/data/helper/prayer_time_provider.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:al_hadith/screens/dua/dua_screen.dart';
import 'package:al_hadith/screens/home/widget/banners_view.dart';
import 'package:al_hadith/screens/home/widget/dashboard_view.dart';
import 'package:al_hadith/screens/qibla_compass/qibla_compass.dart';
import 'package:al_hadith/utill/color_resources.dart';
import 'package:flutter/material.dart';
import '../../data/helper/database_helper.dart';
import '../../data/model/books_model.dart';
import '../../data/model/prayer_timing_model.dart';
import '../biography/biography_screen.dart';
import '../kalima/kalima_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BooksDataModel> _booksDataList = [];
  String formattedDate = 'Demo date';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadLocalBooksData();
    _getPrayerData();
  }

  String convertToBanglaNumber(String englishNumber) {
    Map<String, String> digitMap = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };

    String banglaNumber = '';

    for (int i = 0; i < englishNumber.length; i++) {
      String digit = englishNumber[i];
      banglaNumber += digitMap[digit] ?? digit;
    }

    return banglaNumber;
  }

  Future<dynamic> _getPrayerData() async {
    PrayerTiming? prayerData;
    DateTime currentDate = DateTime.now();
    // Format the date in the desired format
    formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);

    final prayerProvider = Provider.of<PrayerTimeProvider>(context, listen: false);
    await prayerProvider.getPrayerData(context, formattedDate);
    setState((){
    });
  }

  Future<void> _loadLocalBooksData() async {
    final books = await DatabaseHelper.instance.getAllBooksData();
    setState(() {
      _booksDataList = books.toList();
      print("books_data_length: " + _booksDataList.length.toString());
      print("books_data: " + books.toString());
    });
  }

  String getNextPrayerTime() {
    final prayerProvider = Provider.of<PrayerTimeProvider>(context, listen: false);
    final List<String> prayerTimes = [
      prayerProvider.FazarTime,
      prayerProvider.DuhorTime,
      prayerProvider.AsarTime,
      prayerProvider.MagribTime,
      prayerProvider.ishaTime
    ];
    final List<String> prayerName = [
      'ফযর ওয়াক্ত শুরু',
      'যহর ওয়াক্ত শুরু',
      'আসর ওয়াক্ত শুরু',
      'মাগরিব ওয়াক্ত শুরু',
      'ঈসা ওয়াক্ত শুরু'
    ];
    DateTime currentTime = DateTime.now();

    for (int i = 0; i<prayerTimes.length; i++) {
      // Convert the prayer time to DateTime format
      DateTime parsedPrayerTime = DateFormat('HH:mm').parse(prayerTimes[i]);

      // Set the date to today, as we only care about the time
      parsedPrayerTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        parsedPrayerTime.hour,
        parsedPrayerTime.minute,
      );

      if (parsedPrayerTime.isAfter(currentTime)) {
        String formattedPrayerTime = DateFormat('hh:mm a').format(parsedPrayerTime);
        return '${prayerName[i]} : ${convertToBanglaNumber(formattedPrayerTime)}';
      }
    }

    return 'ইন্টারনেট দিন এবং নিচে টেনে রিফ্রেশ করুণ';
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getPrayerData,
      child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            title: Text('ঈমান ও সুন্নাহ', style: TextStyle(fontSize: 24 / MediaQuery.textScaleFactorOf(context)),),
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
                      top: 80,
                      left: 40,
                      right: 40,
                      child: Column(
                        children: [
                          Text('আজকের তারিখ: ${convertToBanglaNumber(formattedDate)}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16 / MediaQuery.of(context).textScaleFactor),),
                          Text(getNextPrayerTime(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17 / MediaQuery.of(context).textScaleFactor)),
                        ],
                      ),
                    ),
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      child: Image.asset('assets/images/mosque_back.png', color: Colors.black.withOpacity(0.3),)),
                  ],),
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
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> KilimaListScreen()
                              ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/sefa_icon.png', width: 35,height: 35,),
                                SizedBox(height: 8,),
                                Text('কালিমা', style: TextStyle(color: Colors.white, fontSize: 15 / MediaQuery.textScaleFactorOf(context)))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> DuaListScreen()
                              ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/dua_icon.png', width: 40,height: 40,),
                                SizedBox(height: 8,),
                                Text('দোয়া', style: TextStyle(color: Colors.white , fontSize: 15 / MediaQuery.textScaleFactorOf(context)))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> BiographyListScreen()
                              ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/biography_icon.png', width: 40,height: 40,),
                                SizedBox(height: 8,),
                                Text('জীবনী', style: TextStyle(color: Colors.white, fontSize: 15 / MediaQuery.textScaleFactorOf(context)))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> QiblahCompass()
                              ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/qibla_icon.png', width: 40,height: 40,),
                                SizedBox(height: 8,),
                                Text('কিবলা', style: TextStyle(color: Colors.white, fontSize: 15 / MediaQuery.textScaleFactorOf(context)),)
                              ],
                            ),
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
          )),
    );
  }
}

