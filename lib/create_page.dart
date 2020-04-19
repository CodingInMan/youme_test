import 'package:flutter/material.dart';
import './service/service_method.dart';

class CreatePage extends StatelessWidget {
  TextEditingController _textFiled = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('创建一条新消息'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _textFiled,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: '请输入你要上传的消息内容',
                ),
              ),
              RaisedButton(
                child: Text('创建'),
                onPressed: (){
                  createMessage(_textFiled.text);
                },
              )
            ],
          )


        )
      );
  }
}