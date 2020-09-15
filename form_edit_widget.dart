import 'package:flutter/material.dart';
import 'edit_results.dart';

class EditScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }
}

class FormScreenState extends State<EditScreen>{

  String _name;
  bool deleteVal = false;

  TextEditingController _userController1 = new TextEditingController();

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

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text('Edit Existing Entry'),
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
                                    final data = Data(
                                        name: _name
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditResultsScreen(
                                            data: data,
                                          )),
                                    );
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
}

class Data {
  final String name;
  Data({this.name});
}