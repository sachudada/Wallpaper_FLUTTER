import 'package:flutter/material.dart';
//import 'package:flutter_app123456/app_screens/first_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'key.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart'as http;

void main() => runApp(Flutterapp());
class Flutterapp extends StatelessWidget {

      @override
      Widget  build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: "Sachin Kumar's App",
      home: Pixbay()
          );
}
}


class Pixbay extends StatefulWidget {
  @override
  _PixbayState createState() => _PixbayState();
}

class _PixbayState extends State<Pixbay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixbay',
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: new FutureBuilder(
        future: getPics(),
          builder: (context, snapShot){
          Map data = snapShot.data;
          if(snapShot.hasError){
              print(snapShot.error);
              return Text('failed to get response from server',
              style: TextStyle(color: Colors.red,
              fontSize: 22.0),);
            }else if(snapShot.hasData){
              return new Center(
                child: new ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context, index){
                    return new Column(
                      children: <Widget>[
                        new Padding(padding: const EdgeInsets.all(5.0)),
                        new Container(
                          child: new InkWell(
                            onTap: (){},
                            child: new Image.network(
                              "${data['hits']['index']['largeImageURL']}"
                            ),
                          ),
                        )
                      ],
                    );
                    }),
              );
            }else if(!snapShot.hasData){
              return new Center(child: CircularProgressIndicator(),);
            }
          },
    ));
  }
}


Future<Map> getPics() async{
  String url = 'https://pixabay.com/api/?key=$key&q=yellow+flowers&image_type=photo&pretty=true';
  http.Response response = await http.get(url);
  return json.decode(response.body);

}