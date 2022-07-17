import 'package:flutter/material.dart';
import 'edit_results.dart';
import 'package:firebase_database/firebase_database.dart';

class EditingScreen extends StatefulWidget{

  final Result data;
  EditingScreen({this.data});

  @override
  FormScreenState createState() => FormScreenState(data);
}

class FormScreenState extends State<EditingScreen>{

  final Result data;
  FormScreenState(this.data);

  final dataBase = FirebaseDatabase.instance.reference();

  void writeData(){
    dataBase.child(data.id).set({
      'id': data.id,
      'Name': _name,
      'Director': _director,
      'Writer1': _writer1,
      'Writer2': _writer2,
      'LeadMale': _LeadMale,
      'LeadFemale': _LeadFemale,
      'SuppMale': _SuppMale,
      'SuppFemale': _SuppFemale,
      'Platform': _platform,
      'Status': _status,
      'Year': _year,
      'Type': _type,
      'Label': _label,
    });
    success(context);
  }

  TextEditingController _userController1;
  TextEditingController _userController2;
  TextEditingController _userController3;
  TextEditingController _userController4;
  TextEditingController _userController5;
  TextEditingController _userController6;
  TextEditingController _userController7;
  TextEditingController _userController8;
  TextEditingController _userController9;
  TextEditingController _userController11;
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
    _userController11 = TextEditingController(text: "${data.year}");
    _userController13 = TextEditingController(text: "${data.label}");

  }

  String _name;
  String _director;
  String _writer1;
  String _writer2;
  String _LeadMale;
  String _LeadFemale;
  String _SuppMale;
  String _SuppFemale;
  String _platform;
  String _status;
  String _year;
  String _type;
  String _label;
  var _statusOpt = ['0', '1', '2'];
  var _currentStatusSelected = '0';
  var _typeOpt = ['Movie', 'Animated Movie', 'Short Animated Movie', 'Short Movie', 'Documentary', 'Short Documentary', 'Series', 'Limited Series', 'Theatre', 'Other'];
  var _currentTypeSelected = 'Movie';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      controller: _userController1,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Name', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      validator: (String value){
        if(value.isEmpty){
          return 'Name is required';
        }
        return null;
      },
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
      validator: (String value){
        if(value.isEmpty){
          return 'Director is required';
        }
        return null;
      },
      onSaved: (String value){
        _director = value;
      },
    );
  }

  Widget _buildWriter1(){
    return TextFormField(
      controller: _userController3,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Writer 1', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      validator: (String value){
        if(value.isEmpty){
          return 'Writer 1 is required';
        }
        return null;
      },
      onSaved: (String value){
        _writer1 = value;
      },
    );
  }

  Widget _buildWriter2(){
    return TextFormField(
      controller: _userController4,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Writer 2', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _writer2 = value;
      },
    );
  }

  Widget _buildLeadMale(){
    return TextFormField(
      controller: _userController5,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Lead Male Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _LeadMale = value;
      },
    );
  }

  Widget _buildLeadFemale(){
    return TextFormField(
      controller: _userController6,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Lead Female Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _LeadFemale = value;
      },
    );
  }

  Widget _buildSuppMale(){
    return TextFormField(
      controller: _userController7,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Supporting Male Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _SuppMale = value;
      },
    );
  }

  Widget _buildSuppFemale(){
    return TextFormField(
      controller: _userController8,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Supporting Female Actor', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      onSaved: (String value){
        _SuppFemale = value;
      },
    );
  }

  Widget _buildPlatform(){
    return TextFormField(
      controller: _userController9,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Platform', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      validator: (String value){
        if(value.isEmpty){
          return 'Platform is required';
        }
        return null;
      },
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
      value: data.status,
      onSaved: (String value){
        _status = value;
      },
      decoration: InputDecoration(labelText: 'Status', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
    );
  }

  Widget _buildYear(){
    return TextFormField(
      controller: _userController11,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: 'Year', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
      validator: (String value){
        if(value.isEmpty){
          return 'Year is required';
        }
        return null;
      },
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
      value: data.type,
      onSaved: (String value){
        _type = value;
      },
      decoration: InputDecoration(labelText: 'Type', contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)),
    );
  }

  Widget _buildLabel(){
    return TextFormField(
      controller: _userController13,
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
                                  child: Center(child: Text('Submit')),
                                  onPressed: (){
                                    if(!_formKey.currentState.validate()){
                                      return;
                                    }
                                    _formKey.currentState.save();
                                    writeData();
                                    _userController1.clear();
                                    _userController2.clear();
                                    _userController3.clear();
                                    _userController4.clear();
                                    _userController5.clear();
                                    _userController6.clear();
                                    _userController7.clear();
                                    _userController8.clear();
                                    _userController9.clear();
                                    _userController11.clear();
                                    _userController13.clear();
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
    title: Text("Data was successfully edited"),
    actions: [okButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context){
        return successDialog;
      }
  );
}
