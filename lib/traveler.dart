import 'package:ceyloneguide/maps.dart';
import 'package:ceyloneguide/placetovisit.dart';
import 'package:flutter/material.dart';
//import 'package:try1/placetovisit.dart';
//import 'package:try1/maps.dart';

void main() {
  runApp(TravelerPage());
}

class TravelerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      home: MenuBarAnimation(),
    );
  }
}

class MenuBarAnimation extends StatefulWidget {
  @override
  _MenuBarAnimationState createState() => _MenuBarAnimationState();
}

class _MenuBarAnimationState extends State<MenuBarAnimation> {
  bool isMenuOpen = false;
  DateTime? _startDate;
  DateTime? _endDate;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 214, 207),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: toggleMenu,
        ),
        title: Text(
          "TRAVELER",
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 193, 207, 212)
                  .withOpacity(0.1), // Increased transparency of the image
              image: DecorationImage(
                  image: AssetImage('assets/water.png'), fit: BoxFit.cover),
              // Add other decorations as needed
            ),
          ),
          isMenuOpen
              ? Container(
                  width: 150, // specify your desired width here
                  height: 350,
                  color: Colors.transparent,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      ListTile(
                        title: Text('Location',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlaceToVisitPage()),
                          );
                        },
                      ),
                      ListTile(
                        title:
                            Text('Maps', style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                      ),
                      ListTile(
                        title:
                            Text('Taxi', style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Accommodation',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Guide',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Equipment',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Budget',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                      ),
                      // Add other menu items as needed
                    ],
                  ),
                )
              : SizedBox.shrink(),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _selectStartDate(context),
                  child: Text(_startDate != null
                      ? 'Start Date: ${_startDate!.toString()}'
                      : 'Select Start Date'),
                ),
                ElevatedButton(
                  onPressed: () => _selectEndDate(context),
                  child: Text(_endDate != null
                      ? 'End Date: ${_endDate!.toString()}'
                      : 'Select End Date'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
