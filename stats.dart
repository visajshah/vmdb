import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit_results.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StatScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }
}

class FormScreenState extends State<StatScreen>{

  @override
  void initState(){
    super.initState();
    fetchData().then((value){
      setState(() {
        _resultsList.addAll(value);
      });
    });
  }

  List<Result> _resultsList = List <Result> ();

  int movie = 0;
  int animatedMovie = 0;
  int shortAnimatedMovie = 0;
  int shortMovie = 0;
  int documentary = 0;
  int shortDocumentary = 0;
  int series = 0;
  int limitedSeries = 0;
  int theatre = 0;
  int other = 0;
  int stat0 = 0;
  int stat1 = 0;
  int stat2 = 0;

  Future <List<Result>> fetchData () async {
    var url = "";
    var response = await http.get(url);
    var resultsList = List<Result>();

    if (response.statusCode == 200){
      Map<String, dynamic> map = json.decode(response.body);
      for (var result in map.values){
        var jsonData = Result.fromJson(result);
        switch(jsonData.type){
          case 'Movie': {
            movie++;
          }
          break;
          case 'Animated Movie': {
            animatedMovie++;
          }
          break;
          case 'Short Animated Movie': {
            shortAnimatedMovie++;
          }
          break;
          case 'Short Movie': {
            shortMovie++;
          }
          break;
          case 'Documentary': {
            documentary++;
          }
          break;
          case 'Short Documentary': {
            shortDocumentary++;
          }
          break;
          case 'Series': {
            series++;
          }
          break;
          case 'Limited Series': {
            limitedSeries++;
          }
          break;
          case 'Theatre': {
            theatre++;
          }
          break;
          default: {
            other++;
          }
          break;
        }
        switch(jsonData.status){
          case '0':{
            stat0++;
          }
          break;
          case '1': {
            stat1++;
          }
          break;
          case '2': {
            stat2++;
          }
          break;
          default: {
            continue;
          }
          break;
        }
        if (true){
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
            child: Text('Stats'),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Container(
                  width: 500,
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
                                        'Total Records',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                        )
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${_resultsList.length}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Movie',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${movie}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Animated Movie',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${animatedMovie}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Short Animated Movie',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${shortAnimatedMovie}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Short Movie',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${shortMovie}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Documentary',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${documentary}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Short Documentary',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${shortDocumentary}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Limited Series',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${limitedSeries}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Series',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${series}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Theatre',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${theatre}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          'Other',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${other}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Status',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${stat0}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          '1',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Status',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${stat1}',
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
                Container(
                  width: 500,
                  height: 100,
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Flexible(
                                    child: ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      title: Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      subtitle: Text(
                                          'Status',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey
                                          )
                                      ),
                                    )
                                ),
                                Flexible(
                                  child: Text(
                                      '${stat2}',
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
                )
              ],
            )
          )
    )
    );
  }
}