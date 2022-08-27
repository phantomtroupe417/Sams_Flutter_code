import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sams_app/controllers/data_controller.dart';
import 'package:sams_app/views/Streetlight.dart';
import 'package:sams_app/views/Tracking.dart';
import 'package:sams_app/views/drawer_screen.dart';
import 'package:sams_app/views/plantation.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController controller = Get.put(DataController());
//functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ASSETS'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Material(
                    borderRadius: BorderRadius.circular(28),
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Tracking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image:
                                AssetImage("assets/images/tracking_button.png"),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'LOGISTICS',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Material(
                    borderRadius: BorderRadius.circular(28),
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => streetlight()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage("assets/images/streetlight.jpg"),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'STREET LIGHT ',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Material(
                    borderRadius: BorderRadius.circular(28),
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Plantation()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage("assets/images/plantation.jpg"),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'PLANTATION',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Material(
                    borderRadius: BorderRadius.circular(28),
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Invalid Choice'),
                            content:
                                Text('There is no data for asset named Water Treatment'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Close')),
                            ],
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage("assets/images/water.jpg"),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 3),
                          Text(
                            'WATER TREATMENT',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
