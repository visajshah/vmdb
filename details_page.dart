import 'package:flutter/material.dart';
import 'query_results.dart';

class DetailsScreen extends StatefulWidget{

  final Result data;
  DetailsScreen({this.data});

  @override
  FormScreenState createState() => FormScreenState(data);
}

class FormScreenState extends State<DetailsScreen>{

  final Result data;
  FormScreenState(this.data);

  TextEditingController _userController1;
  TextEditingController _userController2;
  TextEditingController _userController3;
  TextEditingController _userController4;
  TextEditingController _userController5;
  TextEditingController _userController6;
  TextEditingController _userController7;
  TextEditingController _userController8;
  TextEditingController _userController9;
  TextEditingController _userController10;
  TextEditingController _userController11;
  TextEditingController _userController12;
  TextEditingController _userController13;

  @override
  void initState() {

    super.initState();
    _userController1 = TextEditingController(text: "${data.name}");
    _userController2 = TextEditingController(text: "${data.director}");
    _userController3 = TextEditingController(text: "${data.writer1}");
    _userController4 = TextEditingController(text: "${data.writer2}");
    _userController5 = TextEditingController(text: "${data.leadMale}");
    _userController6 = TextEditingController(text: "${data.leadFemale}");
    _userController7 = TextEditingController(text: "${data.suppMale}");
    _userController8 = TextEditingController(text: "${data.suppFemale}");
    _userController9 = TextEditingController(text: "${data.platform}");
    _userController10 = TextEditingController(text: "${data.status}");
    _userController11 = TextEditingController(text: "${data.year}");
    _userController12 = TextEditingController(text: "${data.type}");
    _userController13 = TextEditingController(text: "${data.label}");

  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Name', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController1,
      readOnly: true
    );
  }

  Widget _buildDirector(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Director', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController2,
      readOnly: true
    );
  }

  Widget _buildWriter1(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Writer 1', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController3,
      readOnly: true
    );
  }

  Widget _buildWriter2(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Writer 2', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController4,
      readOnly: true
    );
  }

  Widget _buildLeadMale(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Lead Male Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController5,
      readOnly: true
    );
  }

  Widget _buildLeadFemale(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Lead Female Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController6,
      readOnly: true
    );
  }

  Widget _buildSuppMale(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Supporting Male Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController7,
      readOnly: true
    );
  }

  Widget _buildSuppFemale(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Supporting Female Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController8,
      readOnly: true
    );
  }

  Widget _buildPlatform(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Platform', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController9,
      readOnly: true
    );
  }

  Widget _buildStatus(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Status', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
        controller: _userController10,
        readOnly: true
    );
  }

  Widget _buildYear(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Year', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController11,
      readOnly: true
    );
  }

  Widget _buildType(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Type', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
        controller: _userController12,
        readOnly: true
    );
  }

  Widget _buildLabel(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'Label', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      controller: _userController13,
      readOnly: true
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Center(
            child: Text('${data.name}'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      _buildName(),
                      _buildDirector(),
                      _buildWriter1(),
                      _buildWriter2(),
                      _buildLeadMale(),
                      _buildLeadFemale(),
                      _buildSuppMale(),
                      _buildSuppFemale(),
                      _buildPlatform(),
                      _buildStatus(),
                      _buildYear(),
                      _buildType(),
                      _buildLabel(),
                      new Container(
                          padding: EdgeInsets.all(20.0),
                          child: new FlatButton(
                              color: Colors.blue,
                              child: Center(child: Text('Okay')),
                              onPressed: (){
                                Navigator.popUntil(context, ModalRoute.withName('/'));
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