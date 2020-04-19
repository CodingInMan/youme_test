import 'package:dio/dio.dart';

const user_id = 'zhangguiyuan';

Future createMessage(msgData) async {
  try {
    Response response;
    Dio dio = Dio();
    const requestHeaders = {
      'Content-Type': 'application/json',
    };
    dio.options.headers = requestHeaders;
    var formData = {'id':"zhangguiyuan", 'content':msgData};
    response = await dio.post('https://3evjrl4n5d.execute-api.us-west-1.amazonaws.com/dev/message', data: formData);
    print(response);
    if(response.statusCode == 200) {
      return response.data;
    }else {
      throw Exception('服务端接口异常');
    }
  } catch (e) {
    return print('ERROR:=======> ${e}');
  }
}

Future getMessageList() async {
  try {
    print('zhengzaihuoqu shuju ');
    Response response;
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    response = await dio.get('https://3evjrl4n5d.execute-api.us-west-1.amazonaws.com/dev/message?id=${user_id}&limit=20');
    print(response);
    if(response.statusCode == 200) {
      return response.data;
    }else {
      throw Exception('服务端接口异常');
    }
  } catch (e) {
    return print('ERROR:=======> ${e}');
  }
}
