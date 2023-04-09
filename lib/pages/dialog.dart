import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void _androidDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want logout?'),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirm')
              ),
            ],
          );
        });
  }

  void _iosDialog(){
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Log out'),
          content: Text('Are you sure you want logout?'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dialog'),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            if(Platform.isAndroid){
              _androidDialog();
            }else if(Platform.isIOS){
              _iosDialog();
            }
          },
          child: Text('Button', style: TextStyle(color: Colors.red, fontSize: 18,),),
        ),
      ),
    );
  }
}
