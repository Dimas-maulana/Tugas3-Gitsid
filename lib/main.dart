import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            appBar: AppBar(
            centerTitle: true,
            elevation: 1,
            backgroundColor: Colors.indigo.shade500,
            leading: Container(
              margin: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('dimas.png'),
                backgroundColor: Colors.white,
              ),
            ),
            title: Container(
              child:  
                Image.asset('assets/twitter_logo.png'
                ),
                width: 40,
              ),
            actions: <Widget> [
              Icon(Icons.notifications
              ),
            ],
          ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            ),
          child : Wrap(
          children: <Widget> [
              Image.asset('assets/dimas.png',
            width: 60,
            height: 40,
            ),
            Text ('Dimas Maulana', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            ),
          ),
          Text('@bukandendimas', style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          Text('Liburan duls bareng', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          Text('@anyageraldine', style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          Image.asset('assets/anya.png',
          
          width: 800,
          height: 400,
            ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.indigo.shade500,
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Massages"),
            icon: Icon(Icons.mail),
          ),
        ],
      ),
      ),
    );
  }
}