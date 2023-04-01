import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    String data='';
    String final_response='';
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextFormField(key: formkey,controller: controller,
        onSaved: (value) {
          (value) => data=value;
        },),

        TextButton(onPressed: ()async{
          final url ='http://10.0.2.2:5000/name';

          setState(() {
          data = controller.text;
            });
          
          final response=await http.post(Uri.parse(url),body: json.encode({'name' : data}));
          print(data);
          
          }, 
          child: Text("Send data")),

        TextButton(onPressed: (() async{
        final url ='http://10.0.2.2:5000/name';

        final response = await http.get(Uri.parse(url));
        final decoded= json.decode(response.body) as Map<String,dynamic>;
        print(decoded['name']);
        setState(() {
          final_response = decoded['name'];
        });
      }), 
      child: Text("Get datas")),


        Text(final_response,style: TextStyle(fontSize: 30,color: Colors.red),)
        
      ],),
    );
  }


}