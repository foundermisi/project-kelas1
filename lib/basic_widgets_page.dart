import 'package:flutter/material.dart';

class BasicWidgetsPage extends StatelessWidget {
  BasicWidgetsPage({Key? key}) : super(key: key);

  double sizeBoxHeight = 30;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BASIC WIDGETS PAGE"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "CONTOH TEXT",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: sizeBoxHeight),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Teks Label",
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: firstController,
                ),
              ),
              SizedBox(height: sizeBoxHeight),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Teks Label",
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  controller: secondController,
                ),
              ),
              SizedBox(
                height: sizeBoxHeight,
              ),
              ElevatedButton(
                onPressed: () {
                  if (firstController.text.isEmpty ||
                      secondController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Kedua kolom wajib diisi",
                        ),
                        duration: Duration(
                          seconds: 2,
                        ),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Textfield 1: ${firstController.text}. Textfield 2: ${secondController.text}",
                      ),
                      duration: const Duration(
                        seconds: 5,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "SHOW INPUT",
                ),
              ),
              SizedBox(
                height: sizeBoxHeight,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "SHOW INPUT",
                ),
              ),
              SizedBox(
                height: sizeBoxHeight,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "SHOW INPUT",
                ),
              ),
              SizedBox(
                height: sizeBoxHeight,
              ),
              const Icon(
                Icons.facebook,
                size: 60,
                color: Colors.blue,
              ),
              Row(
                children: const [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "Text 1",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Text 2",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
              SizedBox(
                height: 160,
                width: 200,
                child: Image.asset(
                  "assets/images/erth.jpg",
                ),
              ),
              SizedBox(
                height: 160,
                width: 200,
                child: Image.network(
                  "https://factsofindonesia.com/wp-content/uploads/2018/11/best-food-in-west-jakarta.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
