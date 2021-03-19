import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Counter Demo'));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // This is the initial value of the counter
  String _below4 = 'Add to count',
      _above4 = 'You have reached the maximum limit';
      // this is the text to be defifened for the ongoing process
  Color _clr = Colors.red,
      _cor = Colors.green,
      _cr = Colors.blue,
      _co = Colors.grey;
      // These are the colors being used in various places

  TextStyle _buildTextStyle() => TextStyle(
      color: _counter <= 4 ? _cr : _clr,
      fontSize: 72,
      fontWeight: FontWeight.bold);
// This is the custom style for the counter

  void _incrementCounter() =>
      setState(() => _counter >= 0 && _counter < 5 ? _counter++ : null);
// this method increases the counter upto a defined value
  void _decrementCounter() =>
      setState(() => _counter <= 5 && _counter >= 1 ? _counter-- : null);
      // This method stops the counter at zero

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('${_counter <= 4 ? _below4 : _above4}',
                  style: Theme.of(context).textTheme.headline6),
                  // This is the text displayed above the counter
              SizedBox(height: 50),
              Text('${_counter <= 4 ? _counter : 'Stop'}',
                  style: _buildTextStyle()),
                  // // This is the counter text with a custom style
              SizedBox(height: 70),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FloatingActionButton(
                    backgroundColor: _counter == 0 ? _co : _cor,
                    // The colors of the buttons are changed according to the count
                    onPressed: _decrementCounter,
                    // the method to decrease the count is placed here
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove)),
                SizedBox(width: 100),
                FloatingActionButton(
                    backgroundColor: _counter <= 4 ? _cor : _co,
                    onPressed: _incrementCounter,
                    // the method to increase the count is placed here
                    tooltip: 'Increment',
                    // This is a tool tip
                    child: Icon(Icons.add)),
              ]),
            ])));
  }
}
