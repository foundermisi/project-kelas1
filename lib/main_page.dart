import 'package:flutter/material.dart';
import 'package:flutter_ogos_2022/basic_widgets_page.dart';
import 'package:flutter_ogos_2022/column_page.dart';
import 'package:flutter_ogos_2022/grid_view_page.dart';
import 'package:flutter_ogos_2022/list_view_page.dart';
import 'package:flutter_ogos_2022/row_page.dart';
import 'package:flutter_ogos_2022/statefull_page.dart';
import 'package:flutter_ogos_2022/tugasan_4row.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER COURSE"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ColumnPage();
                    },
                  ),
                );
              },
              child: Text("COLUMN PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return RowPage();
                    },
                  ),
                );
              },
              child: Text("ROW PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BasicWidgetsPage();
                    },
                  ),
                );
              },
              child: Text("BASIC WIDGET PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ListViewPage();
                    },
                  ),
                );
              },
              child: Text("LIST VIEW PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return GridViewPage();
                    },
                  ),
                );
              },
              child: Text("GRID VIEW PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TugasanPage();
                    },
                  ),
                );
              },
              child: Text("TUGASAN PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return StatefulPage();
                    },
                  ),
                );
              },
              child: Text("STATEFUL WIDGET PAGE"),
            ),
          ],
        ),
      ),
    );
  }
}
