import 'package:flutter/material.dart';
import 'query_results.dart';

class QueryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }
}

class FormScreenState extends State<QueryScreen>{

  String _name;
  String _director;
  String _writer;
  String _actor;
  String _platform;
  String _status;
  String _year;
  String _type;
  String _label;
  var _statusOpt = ['', '0', '1', '2'];
  var _currentStatusSelected = '';
  var _typeOpt = ['', 'Movie', 'Animated Movie', 'Short Animated Movie', 'Short Movie', 'Documentary', 'Short Documentary', 'Series', 'Limited Series', 'Theatre', 'Other'];
  var _currentTypeSelected = '';

  TextEditingController _userController1 = new TextEditingController();
  TextEditingController _userController2 = new TextEditingController();
  TextEditingController _userController3 = new TextEditingController();
  TextEditingController _userController4 = new TextEditingController();
  TextEditingController _userController5 = new TextEditingController();
  TextEditingController _userController7 = new TextEditingController();
  TextEditingController _userController9 = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      controller: _userController1,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Name', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _name = value;
      },
    );
  }

  Widget _buildDirector(){
    return TextFormField(
      controller: _userController2,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Director', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _director = value;
      },
    );
  }

  Widget _buildWriter(){
    return TextFormField(
      controller: _userController3,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Writer', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _writer = value;
      },
    );
  }

  Widget _buildActor(){
    return TextFormField(
      controller: _userController4,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _actor = value;
      },
    );
  }

  Widget _buildPlatform(){
    return TextFormField(
      controller: _userController5,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Platform', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _platform = value;
      },
    );
  }

  Widget _buildStatus(){
    return DropdownButtonFormField<String>(
      items: _statusOpt.map((String dropDownStringItem){
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (String newValueSelected){
        setState((){
          this._currentStatusSelected = newValueSelected;
        });
      },
      value: _currentStatusSelected,
      onSaved: (String value){
        _status = value;
      },
      decoration: InputDecoration(labelText: 'Status', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
    );
  }

  Widget _buildYear(){
    return TextFormField(
      controller: _userController7,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Year', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _year = value;
      },
    );
  }

  Widget _buildType(){
    return DropdownButtonFormField<String>(
      items: _typeOpt.map((String dropDownStringItem){
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (String newValueSelected){
        setState((){
          this._currentTypeSelected = newValueSelected;
        });
      },
      value: _currentTypeSelected,
      onSaved: (String value){
        _type = value;
      },
      decoration: InputDecoration(labelText: 'Type', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
    );
  }

  Widget _buildLabel(){
    return TextFormField(
      controller: _userController9,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Label', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _label = value;
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
            title: Center(
              child: Text('Query'),
            )
        ),
        body: Container(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          _buildName(),
                          _buildDirector(),
                          _buildWriter(),
                          _buildActor(),
                          _buildPlatform(),
                          _buildStatus(),
                          _buildYear(),
                          _buildType(),
                          _buildLabel(),
                          new Container(
                              padding: EdgeInsets.all(20.0),
                              child: new FlatButton(
                                  color: Colors.blue,
                                  child: Center(child: Text('Submit')),
                                  onPressed: (){
                                    _formKey.currentState.save();
                                    final data = Data(
                                        name: _name,
                                        director: _director,
                                        writer: _writer,
                                        actor: _actor,
                                        platform: _platform,
                                        status: _status,
                                        year: _year,
                                        type: _type,
                                        label: _label
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QueryResultsScreen(
                                            data: data,
                                          )),
                                    );
                                    _userController1.clear();
                                    _userController2.clear();
                                    _userController3.clear();
                                    _userController4.clear();
                                    _userController5.clear();
                                    _userController7.clear();
                                    _userController9.clear();
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
}

class Data {
  final String name;
  final String director;
  final String writer;
  final String actor;
  final String platform;
  final String status;
  final String year;
  final String type;
  final String label;
  Data({this.name, this.director, this.writer, this.actor, this.platform, this.status, this.year, this.type, this.label});
}