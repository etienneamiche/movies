import 'package:flutter/material.dart';
import 'package:movies/views/authenticate/authenticate.dart';
import 'package:movies/views/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //return Home or Auth widget
    return Home();
  }
}