import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:youme_test/create_page.dart';
import './create_page.dart';
import './service/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future future;
  @override
  void initState() {
    future = getMessageList();
    super.initState();
  }

  Future refresh() async {
    setState(() {
      future = getMessageList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
        title: Text('消息列表'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: getMessageList(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            var data = jsonDecode(snapshot.data.toString());
            List<Map> list = (data['data']['items'] as List).cast();
            return MyListView(messageDataList: list, future: future,);
          }else {
            return Text('无数据');
          }
        },
      ),
      ),
    );
  }
}


class MyListView extends StatelessWidget {
  EasyRefreshController _easyRefreshController = EasyRefreshController();
  final List messageDataList;
  Future future;
  MyListView({Key key,this.messageDataList,this.future}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return EasyRefresh (
      controller: _easyRefreshController,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: messageDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${messageDataList[index]['content']}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.black);
        },
      ),
      onRefresh: () async {
        //下拉刷新
        await getMessageList();
      },

    );
  }
}