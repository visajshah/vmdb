import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'edit_page.dart';
import 'form_edit_widget.dart';

class EditResultsScreen extends StatefulWidget{

  final Data data;
  EditResultsScreen({this.data});

  @override
  FormScreenState createState() => FormScreenState(data);
}

class FormScreenState extends State<EditResultsScreen>{

  final Data data;
  FormScreenState(this.data);

  static String val;

  @override
  void initState(){
    super.initState();
    val = data.name;
    fetchData().then((value){
      setState(() {
        _resultsList.addAll(value);
      });
    });
  }

  List<Result> _resultsList = List <Result> ();
  bool isLoading = true;

  Future <List<Result>> fetchData () async {
    var url = "";
    var response = await http.get(url);
    var resultsList = List<Result>();

    if (response.statusCode == 200){
      isLoading = false;
      Map<String, dynamic> map = json.decode(response.body);
      for (var result in map.values){
        var jsonData = Result.fromJson(result);
        if (jsonData.name.contains(val)){
          resultsList.add(jsonData);
        }
      }
    }
    return resultsList;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Edit Results'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: !isLoading
        ? ListView.builder(
        shrinkWrap: true,
        itemCount: _resultsList.length,
        itemBuilder: (BuildContext context, int index){
            return new Container(
                child: InkWell(
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Card(
                        color: Colors.yellow[100],
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                        '${_resultsList[index].name}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                  )
                                ]
                            )
                        ),
                        elevation: 10
                    ),
                  ),
                  onTap: (){
                    final Result data = _resultsList[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditingScreen(
                                data: data
                            )));
                  },
                )
            );
        }
      )
          : Center(child: CircularProgressIndicator())
    );
  }
}

class Result{
  String name;
  String director;
  String writer1;
  String writer2;
  String leadMale;
  String leadFemale;
  String suppMale;
  String suppFemale;
  String platform;
  String status;
  String year;
  String type;
  String label;
  String id;

  Result(this.name, this.director, this.writer1, this.writer2, this.leadMale, this.leadFemale, this.suppMale, this.suppFemale, this.platform, this.status, this.year, this.type, this.label, this.id);
  Result.fromJson(Map<String, dynamic> json){
    name = json['Name'];
    director = json['Director'];
    writer1 = json['Writer1'];
    writer2 = json['Writer2'];
    leadMale = json['LeadMale'];
    leadFemale = json['LeadFemale'];
    suppMale = json['SuppMale'];
    suppFemale = json['SuppFemale'];
    platform = json['Platform'];
    status = json['Status'];
    year = json['Year'];
    type = json['Type'];
    label = json['Label'];
    id = json['id'];
  }
}