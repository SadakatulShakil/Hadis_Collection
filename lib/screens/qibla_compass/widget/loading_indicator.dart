import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Image.asset(
          'assets/images/qibla_indicator.gif', // Replace with the path of your file
          width: 100.0, // Adjust the width as needed
          height: 100.0, // Adjust the height as needed
        ),
      );
}
