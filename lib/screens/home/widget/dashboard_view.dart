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
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: .5, color: accent)),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/icon.png', width: 30,height: 30,)),
            ),
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
              booksDataList.number_of_hadis.toString()+' টি হাদিস',
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