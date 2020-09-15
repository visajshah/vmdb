import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'details_page.dart';
import 'form_query_widget.dart';

class QueryResultsScreen extends StatefulWidget{

  final Data data;
  QueryResultsScreen({this.data});

  @override
  FormScreenState createState() => FormScreenState(data);
}

class FormScreenState extends State<QueryResultsScreen>{

  final Data data;
  FormScreenState(this.data);

  static String _name;
  static String _director;
  static String _writer;
  static String _actor;
  static String _platform;
  static String _status;
  static String _year;
  static String _type;
  static String _label;

  static bool name1;
  static bool director1;
  static bool writer1;
  static bool actor1;
  static bool platform1;
  static bool status1;
  static bool year1;
  static bool type1;
  static bool label1;

  @override
  void initState(){
    super.initState();
    _name = data.name;
    if (_name == ''){
      name1 = false;
    }
    else{
      name1 = true;
    }
    _director = data.director;
    if (_director == ''){
      director1 = false;
    }
    else{
      director1 = true;
    }
    _actor = data.actor;
    if (_actor == ''){
      actor1 = false;
    }
    else{
      actor1 = true;
    }
    _platform = data.platform;
    if (_platform == ''){
      platform1 = false;
    }
    else{
      platform1 = true;
    }
    _writer = data.writer;
    if (_writer == ''){
      writer1 = false;
    }
    else{
      writer1 = true;
    }
    _status = data.status;
    if (_status == ''){
      status1 = false;
    }
    else{
      status1 = true;
    }
    _year = data.year;
    if (_year == ''){
      year1 = false;
    }
    else{
      year1 = true;
    }
    _type = data.type;
    if (_type == ''){
      type1 = false;
    }
    else{
      type1 = true;
    }
    _label = data.label;
    if (_label == ''){
      label1 = false;
    }
    else{
      label1 = true;
    }

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
    isLoading = false;
    var resultsList = List<Result>();

    if (response.statusCode == 200){
      Map<String, dynamic> map = json.decode(response.body);

      for (var result in map.values){
        var jsonData = Result.fromJson(result);
        bool temp1 = true;
        bool temp2 = true;
        bool temp3 = true;
        bool temp4 = true;
        bool temp5 = true;
        bool temp6 = true;
        bool temp7 = true;
        bool temp8 = true;
        bool temp9 = true;
        if(name1){
          if(jsonData.name.contains(_name)){
            temp1 = true;
          }
          else{
            temp1 = false;
          }
        }
        if(director1){
          if(jsonData.director.contains(_director)){
            temp2 = true;
          }
          else{
            temp2 = false;
          }
        }
        if(writer1){
          if(jsonData.writer1.contains(_writer) || jsonData.writer2.contains(_writer)){
            temp3 = true;
          }
          else{
            temp3 = false;
          }
        }
        if(actor1){
          if(jsonData.leadMale.contains(_actor) || jsonData.leadFemale.contains(_actor) || jsonData.suppMale.contains(_actor) || jsonData.suppFemale.contains(_actor)){
            temp4 = true;
          }
          else{
            temp4 = false;
          }
        }
        if(platform1){
          if(jsonData.platform.contains(_platform)){
            temp5 = true;
          }
          else{
            temp5 = false;
          }
        }
        if(year1){
          if(_year == jsonData.year){
            temp6 = true;
          }
          else{
            temp6 = false;
          }
        }
        if(type1){
          if(_type == jsonData.type){
            temp7 = true;
          }
          else{
            temp7 = false;
          }
        }
        if(status1){
          if(_status == jsonData.status){
            temp8 = true;
          }
          else{
            temp8 = false;
          }
        }
        if(label1){
          if(jsonData.label.contains(_label)){
            temp9 = true;
          }
          else{
            temp9 = false;
          }
        }
        if (temp1 && temp2 && temp3 && temp4 && temp5 && temp6 && temp7 && temp8 && temp9){
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
          child: Text('Query Results'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: !isLoading
          ?ListView.builder(
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
                            builder: (context) => DetailsScreen(
                                data: data
                            )));
                  },
                )
            );
          }
      )
          : Center(child: CircularProgressIndicator()),
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