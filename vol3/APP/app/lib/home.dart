import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List datas =[];
  String sendingData = '';
  final url = 'http://10.0.2.2:5000/list';
  TextEditingController controller = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Column(children: [
      TextField(controller: controller,),

      TextButton(onPressed: ()async{
        setState(() {
          sendingData = controller.text;
        }); 
        await http.post(Uri.parse(url),body: json.encode({'list':sendingData}));
      }, 
      child: Text("send data")),

      TextButton(onPressed: ()async{
        final response = await http.get(Uri.parse(url));
        final decoded= json.decode(response.body) as Map<String,dynamic>;

        setState(() {
          print(decoded);
          print(decoded['list']);
          datas = decoded['list'] as List;
        });
      }, 
      child: Text("get list")),
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
    ],);
  }
}