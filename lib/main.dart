import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'home_widget.dart';
import 'form_new_widget.dart';
import 'form_edit_widget.dart';
import 'stats.dart';
import 'edit_results.dart';
import 'edit_page.dart';
import 'form_query_widget.dart';
import 'query_results.dart';
import 'details_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to VMDb',
      initialRoute: '/',
      routes: {
        '/new': (context) => FormScreen(),
        '/stats': (context) => StatScreen(),
        '/edit': (context) => EditScreen(),
        '/query': (context) => QueryScreen(),
        '/': (context) => Home(),
      }
    );
  }
}