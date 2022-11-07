import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Map> data = [
    {
      'image':
          "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      'title': '99 FOUNDER CAFE',
      'description': '110 Produk / 1988 Jualan',
      'label': 'VIRAL',
      'icon': Icons.thumb_up
    },
    {
      'image':
          "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      'title': '22 FOUNDER CAFE',
      'description': '110 Produk / 1988 Jualan',
      'label': 'VIRAL',
      'icon': Icons.abc
    },
    {
      'image':
          "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      'title': '22 FOUNDER CAFE',
      'description': '110 Produk / 1988 Jualan',
      'label': 'VIRAL',
      'icon': Icons.access_time
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Misi'),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Top 10 Vendors',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            )),
                      ],
                    ),
                  ),
                  ...generateList(snapshot.data ?? [])
                ],
              );
            }
            return const Text('No data');
          },
        ));
  }

  List<Widget> generateList(List<dynamic> data) {
    List<Widget> listOfWidget = [];

    for (var i = 0; i < data.length; i++) {
      listOfWidget.add(Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        data[i]['featured_image_urls']['post-thumbnail']),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 7,
                  right: 80,
                ),
                child: Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[i]['title']['rendered'] ?? '',
                        style: TextStyle(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      // Text(data[i]['description']),
                      // Text(data[i]['label']),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.thumb_up)
            ],
          ),
        ),
      ));
    }

    return listOfWidget;
  }

  String printTitle({required String one, required String two}) {
    return one + two;
  }

  Future<List<dynamic>> fetchData() async {
    final http.Response response = await http
        .get(Uri.parse("https://thevocket.com/wp-json/wp/v2/posts"), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      // success
      List<dynamic> body = jsonDecode(response.body);
      return body;
    }
    return [];
  }
}
