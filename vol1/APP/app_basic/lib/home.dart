import 'dart:convert';

import 'package:app_basic/functions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url ='';
  var data;
  var output='initial output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flask App'),
     ),
     body: Center(child: Column(children: [
      TextField(onChanged: (value) => url='http://10.0.2.2:5000/api?query='+value.toString(),),
      TextButton(onPressed: (() async{
        data=await fetchdata(url);
        var decoded= jsonDecode(data);
        setState(() {
          output=decoded['output'];
        });
      }), 
      child: Text('Fetch Value')),
      Text(output)
     ],),),
    );
  }
}