import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trial/models/JsonComplex.dart';
import 'package:http/http.dart' as http;

class ComplexApiWithModels extends StatefulWidget {
  const ComplexApiWithModels({super.key});

  @override
  State<ComplexApiWithModels> createState() => _ComplexApiWithModelsState();
}

class _ComplexApiWithModelsState extends State<ComplexApiWithModels> {
  List<JsonComplex> jsonList = [];
  Future<List<JsonComplex>> getInfo() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        jsonList.add(JsonComplex.fromJson(i));
      }
      return jsonList;
    } else {
      return jsonList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComplexApiWithModels'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(future: getInfo(),
            builder: (context,AsyncSnapshot<List<JsonComplex>> snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
             else{ return ListView.builder(itemCount: jsonList.length,
              itemBuilder: (context,index){ return
              ListTile(title:
              Text(snapshot.data![index].name.toString()),
              subtitle:  Text(snapshot.data![index].address!.geo!.lng.toString()),);
              });}
            },
          ))
        ],
      ),
    );
  }
}
