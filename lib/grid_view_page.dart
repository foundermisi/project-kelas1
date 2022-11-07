import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GRID VIEW PAGE"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        children: List.generate(
          100,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${index} is clicked"),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
