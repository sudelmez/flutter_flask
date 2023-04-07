import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();
  List datas =[];
  String text='';
  String sendingData = '';
  String responsetext ='';
  List dcode =[];
  final url = 'http://10.0.2.2:5000/list2'; 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextField(controller: controller,),

        TextButton(onPressed: ()async{
          setState(() {
          sendingData = controller.text;
          print(sendingData);
        }); 
          await http.post(Uri.parse(url),body: json.encode({'list2':sendingData}));
        }, child: Text("Save")),

        TextButton(onPressed: ()async{
          setState(() {
          sendingData = controller.text;
          print(sendingData);
        }); 
          await http.delete(Uri.parse(url),body: json.encode({'list2':sendingData}));
        }, child: Text("Delete person")),

        TextButton(onPressed: ()async{
        final response = await http.get(Uri.parse(url));
        final decoded= json.decode(response.body) as Map<String,dynamic>;

        setState(() {
          print(decoded);
          print(decoded['list2']);
          datas = decoded['list2'] as List;
        });
        }, child: Text("Get Saved List")),

        Container(height: 400,
        child: ListView.builder(itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              color: Colors.yellow,
              child: Center(child: Text(datas[index])),
            ),
          );
        },
        itemCount: datas.length,),
      )

      ],),
    );
  }
}