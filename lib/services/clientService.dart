import 'package:UNNA/models/clientModel.dart';
import 'package:UNNA/screens/Login.dart';
import 'package:UNNA/screens/feed_screen.dart';
import 'package:UNNA/util/util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ClientService {
  Dio dio = new Dio();

  Future<ClientModel> auth(ClientModel client, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await dio.post(
      '${apiUrl}/auth',
      data: client.toJson(),
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
    if (response.statusCode == 200) {
      prefs.setString('client', response.data['data'].toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FeedScreen()));
    } else if (response.statusCode == 400) {
      showAlertDialog(context, 'Oops...', 'Usuário não encontrado!');
    } else if (response.statusCode == 401) {
      showAlertDialog(context, 'Oops...', 'Senha inválida!');
    } else {
      showAlertDialog(
          context, 'Oops...', 'Não foi possível fazer a requisição!');
      Exception('Algo deu errado!');
    }
  }

  Future<ClientModel> createClient(
      ClientModel client, BuildContext context) async {
    Response response =
        await dio.post('${apiUrl}/client', data: client.toJson());
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tudo certo!'),
            content: Text('Usuário criado com sucesso!'),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ],
          );
        },
      );
    } else {
      showAlertDialog(
          context, 'Oops...', 'Não foi possível fazer a requisição!');
      Exception('Algo deu errado!');
    }
  }
}

showAlertDialog(BuildContext context, String title, String description) {
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
