import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({Key? key}) : super(key: key);

  List nameList = ["Andi", "Budi", "Charlie", "Doni", "Ervan"];

  //indeks
  //panjang

  @override
  Widget build(BuildContext context) {
    print(nameList[2]);
    print(nameList.length);
    sayHello();
    saySomething("Something");

    int total = penjumlahanAngka(2, 3);
    print(total);

    return Scaffold(
      appBar: AppBar(title: Text("LIST VIEW")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${nameList[index]} is clicked"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    nameList[index],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: nameList.length,
      ),
    );
  }

  void sayHello() {
    print("Halo semua");
  }

  void saySomething(String text) {
    print(text);
  }

  int penjumlahanAngka(int x, int y) {
    int z = x + y;
    return z;
  }
}
