import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List> fetchAlbums() async {
  List data;
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  data = json.decode(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class CreateReport extends StatefulWidget {
  const CreateReport({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  final List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  final String _color = '';
  bool isChecked = false;
  late Future<Album> futureAlbum;
  late Future<List> userData;
  late List titles;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    fetchAlbums().then((value) => {
          setState(() {
            titles = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Análisis de vulnerabilidades web'),
      ),
      body: ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: titles == null ? 0 : titles.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Row(
              children: <Widget>[Text("${titles[index]["title"]}")],
            ));
          }),
    );
  }
}
