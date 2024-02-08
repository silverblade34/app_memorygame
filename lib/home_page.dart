import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _list[index].primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black12,
                          spreadRadius: 0.3,
                          offset: Offset(3, 4)),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _list[index].secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          _list[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              ),
                              Shadow(
                                color: Colors.green,
                                blurRadius: 2,
                                offset: Offset(0.5, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: generatestar(_list[index].noOfstart),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> generatestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primaryColor;
  Color secondaryColor;
  int noOfstart;
  Details(
      {required this.name,
      required this.primaryColor,
      required this.secondaryColor,
      required this.noOfstart});
}

List<Details> _list = [
  Details(
      name: "EASY",
      primaryColor: Colors.green,
      secondaryColor: const Color.fromRGBO(165, 214, 167, 1),
      noOfstart: 1),
  Details(
      name: "MEDIUM",
      primaryColor: Colors.orange,
      secondaryColor: const Color.fromRGBO(255, 204, 128, 1),
      noOfstart: 2),
  Details(
      name: "HARD",
      primaryColor: Colors.red,
      secondaryColor: const Color.fromRGBO(239, 154, 154, 1),
      noOfstart: 3),
];
