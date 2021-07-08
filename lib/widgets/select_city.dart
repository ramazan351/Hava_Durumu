import 'package:flutter/material.dart';

class MySelectCityWidget extends StatefulWidget {
  const MySelectCityWidget({Key? key}) : super(key: key);

  @override
  _MySelectCityWidgetState createState() => _MySelectCityWidgetState();
}

class _MySelectCityWidgetState extends State<MySelectCityWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Şehir Seç"),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    labelText: "Şehir",
                    hintText: "Şehir Seçin",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context,_textEditingController.text);
                  },
                  icon: const Icon(Icons.search),
                ))
          ],
        ),
      ),
    );
  }
}
