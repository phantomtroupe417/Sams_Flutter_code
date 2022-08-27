import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class streetlight extends StatefulWidget {
  const streetlight({Key? key}) : super(key: key);

  @override
  State<streetlight> createState() => _streetlightState();
}

class _streetlightState extends State<streetlight> {
  @override
  void initState() {
    super.initState();
    getMessages();
  }

  String message = "null";
  Map<dynamic, dynamic> _data = {"": ""};
  dynamic _value;
  var firebase = {};
  getMessages() async {
    FirebaseDatabase.instance
        .ref()
        .child("street_light/light01/LOCATION")
        .onValue
        .listen((event) {
      final data = Map<dynamic, dynamic>.from(event.snapshot.value as Map);
      data.forEach((key, value) {
        setState(() {
          _data = data;
          firebase = Map<String, dynamic>.from(data);
        });
      });
    });
  }

  Widget func() {
    var mykey = [];
    firebase.keys.forEach((key) {
      mykey.add(key);
    });
    List<Widget> mylist = [];
    for (int i = 0; i < firebase.length; i++) {
      mylist.add(
        Row(
          children: [
            Text(
              mykey[i],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              firebase[mykey[i]].toString(),
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      );
    }
    // ignore: unnecessary_new
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: mylist,
    );
  }

  final items = [
    'Select Device to Track',
    'light01',
    'light02',
    'light03',
    'light04',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('STREET LIGHTS'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: STL(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Container(
                      child: DropdownButton<dynamic>(
                          value: value,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                                () => this.value = value,
                              )),
                    ),
                  ),
                )
              ],
            ),
            value == "light01"
                ? Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        func(),
                      ],
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "NO DATA IS GIVEN FOR THE SPECIFIED FIELD",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
          ],
        ));
  }
}

class STL extends StatelessWidget {
  const STL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Storage().downloadURL('asset.jpeg'),
        builder: (BuildContext context, AsyncSnapshot<String> Snapshot) {
          if (Snapshot.connectionState == ConnectionState.done &&
              Snapshot.hasData) {
            return Center(
              child: Container(
                width: 300,
                height: 250,
                child: Image.network(
                  Snapshot.data!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
          if (Snapshot.connectionState == ConnectionState.waiting ||
              !Snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Container();
        });
  }
}

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('PLN/$imageName').getDownloadURL();

    return downloadURL;
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
