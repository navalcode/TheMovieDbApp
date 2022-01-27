import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_movie_db_app/models/popular_movie_response.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PopularMovie>> _popularMovies;

  @override
  void initState() {
    _popularMovies = fetchPopularMovies();
    super.initState();
  }

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
            FutureBuilder<List<PopularMovie>>(
                future: _popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return personasList(snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }

  Future<List<PopularMovie>> fetchPopularMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular/?api_key=7044289044260b73f9b97528366d775b'));
    if (response.statusCode == 200) {
      return PopularMovieResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Widget personasList(List<PopularMovie> popularMovies) => SizedBox(
        height: 400,
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularMovies.length,
            itemBuilder: (context, index) {
              return tarjetaPopularMovies(popularMovies.elementAt(index).title,
                  popularMovies.elementAt(index).posterPath.toString());
            },
          ),
        ),
      );

  Widget tarjetaPopularMovies(String nombre, String posterPath) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                nombre,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    shadows: <Shadow>[
                      Shadow(blurRadius: 50, color: Colors.black),
                    ]),
              )),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://image.tmdb.org/t/p/original" + posterPath,
                scale: 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      );
}
