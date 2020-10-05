import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizz_flutter/Quizz.dart';

class Homepage extends StatefulWidget{
  Homepage(String app_title){
    this.app_title = app_title;
  }

  String app_title;

  @override
  State<StatefulWidget> createState() {
    return new _HomepageState(app_title);
  }

}

class _HomepageState extends State<Homepage> {
  String title;
  _HomepageState(String title){
    this.title = title;
  }



  @override
  Widget build(BuildContext context) {
    var device_width = MediaQuery.of(context).size.width;
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
        body : new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width : device_width * 0.9,
                height: device_width * 0.9,
                child: new Card(
                  child: new Image.asset('images/cover.jpg',
                    fit : BoxFit.fitHeight
                  ),
                  elevation: 10.0,
                  // margin: EdgeInsetsGeometry.infinity,
                ),
              ),
              RaisedButton(
                onPressed: launch,
                color: Colors.red[700],
                padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
                elevation: 5.0,
                child: Text('Commencer le quizz',
                  textScaleFactor: 1.7,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  void launch() {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
      return new Quizz();
    }));
  }
}