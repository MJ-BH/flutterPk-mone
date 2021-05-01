import 'package:flutter/material.dart';
import 'package:flutter_pokemone_restful/model/component.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'model/pokemone.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomePageView(
      title: "Flutter Pokémone ",
    );
  }
}

class MyHomePageView extends StatefulWidget {
  MyHomePageView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageViewState createState() => _MyHomePageViewState();
}

class _MyHomePageViewState extends State<MyHomePageView> {
  var comp = Component();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            TextField(),
            Expanded(
              child: FutureBuilder(
                future: getdata(),
                builder: (_, data) {
                  if (data.hasData) {
                    List<Pokemon> pokomemos = data.data;
                    print(pokomemos.length);
                    return comp.loadlist(pokomemos);
                  } else {
                    return LinearProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

getdata() async {
  var url = Uri.parse(
      'https://gist.githubusercontent.com/scitbiz/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json');
  var response = await http.get(url);
  print(response.statusCode);
  print(response.body);
  List<Pokemon> pokemons = pokemonFromJson(response.body);
  return pokemons;
}
