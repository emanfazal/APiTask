import 'package:api_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'UI/SplashScreen/SplashProvider.dart';
import 'UI/SplashScreen/SplashScreen.dart';
import 'ViewModel/ProductsVM/ProductsVM.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext , Orientation , ScreenType ) { 
      return MultiProvider(  providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) =>  ProductViewModel()),

      ],
          child: Consumer(
          builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: routes,


        );
      },
      ),
      );
    },
      
    );
  }
}

