import 'package:echoar_package/EchoArEntry.dart';
import 'package:flutter/material.dart';
import 'package:echoar_package/echoar_package.dart';
import 'package:flutter_3d_obj/flutter_3d_obj.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'echoAR example app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'echoAR example app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  EchoAR echoAR;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _imageHologramPath = "";
  String _modelHologramPath = "";
  String _gifHologramPath = "";
  String value;

  void _incrementCounter() async {
    if (widget.echoAR == null)
      widget.echoAR = EchoAR(apiKey: "<Your-API-Key>");
    String imageLink= await widget.echoAR
        .getModelLinkFromEntryId("<Stones-Entry-ID>");
    String gifLink= await widget.echoAR
        .getModelLinkFromEntryId("<Gif-Entry-ID>");
    String path = await widget.echoAR.getModelFromEntryId("<Fox-Entry-ID>");

     
    setState(() {
      _imageHologramPath = imageLink;
      _modelHologramPath = path;
      _gifHologramPath= gifLink;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (_imageHologramPath == "" && _modelHologramPath == "" && _gifHologramPath == "") ? Text("Press the button to start") : ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            _imageHologramPath != ""
                ? Image.network(_imageHologramPath)
                : SizedBox(
                    height: 1.0,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
            _modelHologramPath != ""
                ? Center(
                  child: Object3D(
                      size: const Size(30.0, 30.0),
                      path: _modelHologramPath,
                      asset: true,
                      zoom: 5.0,
                    ),
                )
                : SizedBox(
                    height: 1.0,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
            _gifHologramPath != ""
                ? Image.network(_gifHologramPath)
                : SizedBox(
                    height: 1.0,
                  ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.file_download),
      ), 
    );
  }
}