import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class NotesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }
}

class FormScreenState extends State<NotesScreen>{

  static String val;

  @override
  void initState(){
    super.initState();
    val = 'NOTES';
    fetchData().then((value){
      setState(() {
        _resultsList.addAll(value);
      });
    });
  }

  List<Result> _resultsList = List <Result> ();
  bool isLoading = true;

  Future <List<Result>> fetchData () async {
    var url = "https://vmdb1-23572.firebaseio.com/.json";
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

  final dataBase = FirebaseDatabase.instance.reference();

  void writeData(){
    dataBase.child('NOTES').set({
      'Notes': _notes
    });
    success(context);
  }

  String _notes;

  TextEditingController _userController1 = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNotes(){
    return TextFormField(
      controller: _userController1,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Notes', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onSaved: (String value){
        _notes = value;
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Center(
            child: Text('Notepad'),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          _buildNotes(),
                          new Container(
                              padding: EdgeInsets.all(20.0),
                              child: new FlatButton(
                                  color: Colors.blue,
                                  child: Center(child: Text('Submit')),
                                  onPressed: (){
                                    if(!_formKey.currentState.validate()){
                                      return;
                                    }
                                    _formKey.currentState.save();
                                    writeData();
                                    _userController1.clear();
                                  }
                              )
                          )
                        ]
                    )
                )
            )
        )
    );
  }
  void success(BuildContext context){

    Widget okButton = FlatButton(
        child: Center(
            child: Text('OK')
        ),
        onPressed: (){
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
    );

    var successDialog = AlertDialog(
      title: Text("Notes were successfully added"),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return successDialog;
        }
    );
  }
}