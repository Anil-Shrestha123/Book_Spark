// import 'dart:async';

// import 'package:book_spark/Pages/auth/services/auth_wrapper.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter/scheduler.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {


//   @override
//   void initState() {
//     super.initState();

//     Timer(Duration(seconds: 2), (){
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthWrapper()));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.orange,
//         child: Center(
//           child: Text("Book Spark", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
//         ),
//       ),
//     );
//   }
// }


import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book_spark/Pages/auth/services/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset("assets/Animated_logo.json"),
      ), 
      nextScreen: AuthWrapper(),
      splashIconSize: 300,
      duration: 2200,
    );
  }
}