import 'dart:math';

import 'package:flutter/material.dart';

import '../../../data/model/books_model.dart';
import '../../../utill/color_resources.dart';
import '../../hadith_chapter/hadth_list_screen.dart';

class DashboardCard extends StatelessWidget {
  BooksDataModel booksDataList;
  DashboardCard(this.booksDataList);

  // Generate a random color with reduced opacity
  Color _generateRandomColor() {
    final random = Random();
    final color = Colors.primaries[random.nextInt(Colors.primaries.length)]
        .withOpacity(0.3);
    return color;
  }

  @override
  Widget build(BuildContext context) {
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
    final randomColor = _generateRandomColor();
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> HadithListScreen(booksDataList)
        ));
      },
      child: Card(
        color: primaryColor.withOpacity(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Align(
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
            SizedBox(height: 10,),
            Text(
              booksDataList.title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'ইমাম '+ removeFirstWord(booksDataList.title),
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Text(
              '${convertToBanglaNumber(booksDataList.number_of_hadis.toString())} টি হাদিস',
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String removeFirstWord(String inputString) {
    // Split the input string into a list of words
    List<String> words = inputString.split(' ');

    // Remove the first word
    words.removeAt(0);

    // Join the remaining words back into a string
    String resultString = words.join(' ');

    // Return the result
    return resultString;
  }

}

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // Image
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/mosque_back.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Green Shadow
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              color:
              primaryColor.withOpacity(0.8), // Semi-transparent green color
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          child: ListTile(
            leading: Icon(Icons.contact_page_outlined),
            title: Text('Contact'),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => AddMerchant('add', userData)));
          },
          child: ListTile(
            leading: Icon(Icons.support_agent_rounded),
            title: Text('About us'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => AllMerchantScreen())); // Navigating to AllMerchantScreen
          },
          child: ListTile(
            leading: Icon(Icons.menu_book_rounded),
            title: Text('About Writer'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => NewOrderScreen()));
          },
          child: ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy policy'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => TotalDeliveryScreen()));
          },
          child: ListTile(
            leading: Icon(Icons.share),
            title: Text('Share App'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => TotalOrderScreen()));
          },
          child: ListTile(
            leading: Icon(Icons.star_rate_outlined),
            title: Text('Rating'),
          ),
        ),
      ],
    );
  }
}