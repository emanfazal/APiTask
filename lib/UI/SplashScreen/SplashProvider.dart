import 'package:api_task/UI/ProductsScreen/ProductView.dart';
import 'package:flutter/material.dart';

class SplashScreenProvider with ChangeNotifier {



  void navigateToNextScreen(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, ProductView.routeName); // Replace '/product' with your actual route name.
    });
  }
}
