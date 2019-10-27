import 'package:flutter/material.dart';
import 'package:movies/views/authenticate/authenticate.dart';
import 'package:movies/views/home/home.dart';
import 'package:provider/provider.dart';
import 'package:movies/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}