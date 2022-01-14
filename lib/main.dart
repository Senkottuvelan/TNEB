import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'ui/bill_calculator.dart';
import 'ui/navigator_bottom.dart';

void main(){
  runApp(const tnebCalc());
}

class tnebCalc extends StatefulWidget {
  const tnebCalc({Key? key}) : super(key: key);

  @override
  _tnebCalcState createState() => _tnebCalcState();
}

class _tnebCalcState extends State<tnebCalc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Column(crossAxisAlignment:CrossAxisAlignment.end,children:[Expanded(child:SplashScreen(
      seconds: 2,
      navigateAfterSeconds: AfterSplash(),
      image: Image.asset('assets/logos/TNEB_splash.gif'),
      backgroundColor: Colors.black,
      useLoader: false,
      photoSize: 120,
    ) ),])
    ,debugShowCheckedModeBanner: false,);
  }
}
class AfterSplash extends StatefulWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Container(child:Image.asset('assets/logos/TNEB.png',height: 100.0,),),centerTitle: true,),
      body: Navigator_Bottom()//bill_calculator(),
    ),
      theme:ThemeData(
          fontFamily: 'Bebas Neue',
          primarySwatch: Colors.blueGrey,
          brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false);
  }
}



