import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  static const platform =  const MethodChannel('com.Rahim.myFlutterApp/surveyMonkey');
  static String sessionSurveyMonkeyHash = '8SH38b7iQIOmRBpN9Le4dA';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Teste do SDK'),
            ),
            body: Center(
                child: RaisedButton(
              onPressed: () {_loadSurveyMonkey();},
              child: Text('Abrir SDK'),
            ))));
  }

Future _loadSurveyMonkey() async {
    try {
      await platform
          .invokeMethod('surveyMonkey', sessionSurveyMonkeyHash)
          .then((result) {
            print(result);
      });
    } on PlatformException catch (e) {
      print('catch');
      print(e);
    }
  }
}
