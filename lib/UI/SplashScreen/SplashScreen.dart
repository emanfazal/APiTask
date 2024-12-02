import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/Assets.dart';
import 'SplashProvider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashScreenProvider>(context, listen: false)
        .navigateToNextScreen(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.SplashBg), // Replace with your image path
                fit: BoxFit.fill, // Adjust the image to cover the entire screen
              ),
            ),
          ),
          // Foreground content
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'My Store',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
             Spacer(),
               Text('Valkommen',style: TextStyle(
                 fontSize: 20,
                 color: Colors.white,
                 fontWeight: FontWeight.bold
               ),),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400),),
                  ),
                ),
                SizedBox(height: 170,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
