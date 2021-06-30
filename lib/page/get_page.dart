import 'dart:convert';

import 'package:expansion_panel/models/user_entity.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title!),
        ),
        body: FutureBuilder(
          future: getApi(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ExpansionTileCard(
                    key: Key(index.toString()),
                    leading: CircleAvatar(
                        child: Text('${snapshot.data![index].id}')),
                    title: Text('${snapshot.data![index].title}'),
                    // subtitle: Text('${snapshot.data![index].userId}'),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.deepPurple,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            '${snapshot.data![index].body}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<List<User>> getApi() async {
    final Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final List<User> user =
          jsonData.map<User>((e) => User.fromJson(e)).toList();
      print(user);
      return user;
    } else
      throw Exception('Error');
  }
}
