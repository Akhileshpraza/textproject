import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:textproject/myModal.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final String url ="https://jsonplaceholder.typicode.com/todos";
  List<myModal> myAllData =[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gatData();
  }
  gatData() async {
    var response = await http.get(url,headers: {"Aceept": "Application/json"});
    if(response.statusCode == 200){
      String responeBody =response.body;
      var jsonBody = json.decode(responeBody);
      print("----------------------------------------------------------------------------");
      print (jsonBody);
      print("----------------------------------------------------------------------------");
      for (var data in jsonBody){
        myAllData.add(new myModal(data['id'],data['title'],data['completed']));
      }
      setState(() {
        myAllData.forEach(((someData)=> print("Title : ${someData.title}")));
      });

    }
    else{
      Fluttertoast.showToast(
          msg: "No Data founds",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightBlue[400],
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: myAllData.length ==0 ? new Center(child: new CircularProgressIndicator(),) : ShowUI(),
    );
  }
  Widget ShowUI() {

    return new ListView.builder(
        itemCount: myAllData.length,
        itemBuilder: (_, index){

          return new Container(
            margin: new EdgeInsets.symmetric(vertical: 1.0,horizontal: 8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text(myAllData[index].title, style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                 subtitle: Text(myAllData[index].id.toString()),
                onLongPress: (){
                  setState(() {
                    myAllData.removeAt(index).title;
                  });
                },
              ),
            ),
          );
        },);
  }
}
