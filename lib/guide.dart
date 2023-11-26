import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GuideSupplierPage(),
  ));
}

class GuideSupplierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 214, 207),
        title: const Text(
          "Guide page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 84, 247, 250),
                Color.fromARGB(255, 170, 248, 225),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [0.4, 0.7],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(labelText: 'NAME'),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(labelText: 'LOCATION'),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(labelText: 'AVAILABILITY'),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(labelText: 'TELEPHONE'),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(labelText: 'EXPERIENCE'),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(labelText: 'CHARGES PER DAY'),
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(labelText: 'IMAGE(personal)'),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Customer Name')),
                    DataColumn(label: Text('Received')),
                    DataColumn(label: Text('Accept')),
                    DataColumn(label: Text('Cancel')),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(TextField()),
                        DataCell(OnOffButton()),
                        DataCell(OnOffButton()),
                        DataCell(OnOffButton()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnOffButton extends StatefulWidget {
  @override
  _OnOffButtonState createState() => _OnOffButtonState();
}

class _OnOffButtonState extends State<OnOffButton> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
    );
  }
}
