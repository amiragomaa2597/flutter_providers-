import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: MaterialApp(
        home: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<Model>(
          builder: (context, model, child) => Text("${model.name}"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the button below to disable it:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Provider.of<Model>(context, listen: false).changeName();
              },
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String _name = "Mahmoud";

  String get name => _name;

  void changeName() {
    _name = "Amira";
    notifyListeners();
  }
}