import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db_app/pages/download_page.dart';
import 'package:the_movie_db_app/pages/favorite_page.dart';
import 'package:the_movie_db_app/pages/home_page.dart';
import 'package:the_movie_db_app/pages/reminder_page.dart';

void main() => runApp(TheMovieDbApp());

class TheMovieDbApp extends StatelessWidget {
  const TheMovieDbApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The movie DB APP",
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      home: Inicio(),
      initialRoute: '/',
      routes: {
        //'/': (context) => const ch.Characters(),
        //'/locations': (context) => const Locations(),
        // '/episodes': (context) => const Episodes(),
        // '/characters': (context) => const Characters(),
      },
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    DownloadPage(),
    ReminderPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, color: Colors.grey),
                  activeIcon:
                      Icon(Icons.home, color: Color.fromRGBO(78, 79, 254, 100)),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline, color: Colors.grey),
                  activeIcon: Icon(Icons.favorite,
                      color: Color.fromRGBO(78, 79, 254, 100)),
                  label: "favorites"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.cloud_download_outlined,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.cloud_download,
                      color: Color.fromRGBO(78, 79, 254, 100)),
                  label: "downloads"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined, color: Colors.grey),
                  activeIcon: Icon(Icons.notifications,
                      color: Color.fromRGBO(78, 79, 254, 100)),
                  label: "reminder")
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}
