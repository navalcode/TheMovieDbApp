import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leadingWidth: 80,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                icon: const Icon(Icons.cast),
                color: Color.fromRGBO(78, 79, 254, 100),
                tooltip: 'Open shopping cart',
                onPressed: () {},
              ),
            ),
          ),
        ],
        title: Row(
          children: [
            CircleAvatar(
              minRadius: 25,
              backgroundImage: NetworkImage(
                  'https://i.insider.com/5ba15375e361c01c008b5cf7?width=750&format=jpeg&auto=webp'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "User Name",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Homepage"),
          ],
        ),
      ),
    );
  }
}
