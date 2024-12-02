import 'package:api_task/UI/ProductsScreen/ProductView.dart';
import 'package:flutter/material.dart';

import 'UI/SplashScreen/SplashScreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ProductView.routeName: (context) => ProductView(),

};
