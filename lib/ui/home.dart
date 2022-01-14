import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding:EdgeInsets.all(50),child: Center(child: Column(children:[Padding(padding: EdgeInsets.all(20),child: Text('Made with',style: TextStyle(fontSize: 50),),),Padding(padding: EdgeInsets.all(20),child: Icon(Icons.favorite,color: Colors.red,size: 50,),),Padding(padding: EdgeInsets.all(20),child: Image.asset('assets/logos/vilupuram png.png',height: 200),)])),);
  }
}
