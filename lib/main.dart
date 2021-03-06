import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}






class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Claim History Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }




  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  _dsiplayDialogue(BuildContext context,claimId) async{
 /* return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Claim Details "+claimId),
          content: Text("Claim Status:Paid"),

        );
      }
  );*/
   return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.height -  100,
              padding: EdgeInsets.all(80),
              color: Colors.white,
              child: Column(
                children: [
                  Table(

                    columnWidths: {
                      0: FixedColumnWidth(200.0),
                      1: FlexColumnWidth(),
                      2: FixedColumnWidth(200.0),
                    },
                    children: [
                      TableRow(children: [
                        Text('Claim ID:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text(claimId,style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Status:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('In Progress',style:TextStyle(fontSize: 16.0,color: Colors.red,fontWeight: FontWeight.bold)),
                      ]),
                      TableRow(children: [
                        Text('Reference ID:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('123456',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Payment Status:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Paid',style:TextStyle(fontSize: 16.0,color: Colors.red,fontWeight: FontWeight.bold)),
                      ]),
                      TableRow(children: [
                        Text('Created By:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Same Name',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Created date:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('12/09/2018 12:30 PM',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                      ]),
                      TableRow(children: [
                        Text('Modified By:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Same Name',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Created date:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('12/09/2018 11:30 AM',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                      ]),
                      TableRow(children: [
                        Text('Primary Insured:',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Dr.Same Name',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Claim Details',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident',style:TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold)),
                      ]),
                    ],
                  ),


                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.black,
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var list = [{'id':"123123","date":"20/08/2016","description":"Claim Description"},
      {'id':"123124","date":"26/08/2016","description":"Claim Description"},
      {'id':"123125","date":"26/08/2016","description":"Claim Description"},
      {'id':"123126","date":"26/08/2016","description":"Claim Description"}

      ];


    
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Recent Claims'),
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: {
                0: FixedColumnWidth(100.0),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(100.0)
              },
              children: [
                TableRow(children: [
                  Text('Claim ID',style:TextStyle(fontWeight: FontWeight.bold)),
                  Text('Date',style:TextStyle(fontWeight: FontWeight.bold)),
                  Text('View',style:TextStyle(fontWeight: FontWeight.bold)),
                ]),
              ],
            ),
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: {
                0: FixedColumnWidth(100.0),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(100.0)
              },
              children:[
                for(var item in list )  TableRow(children: [
                  Text(item['id']),
                  Text(item['date']+":"+item['description']),
                  RaisedButton(
                    child: Text("View"),
                    onPressed: () => _dsiplayDialogue(context,item['id']),
                    color: Colors.red,
                    textColor: Colors.white,
                    splashColor: Colors.grey,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  )
              ]
    )
    ]
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          /***/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
