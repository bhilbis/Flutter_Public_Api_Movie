import 'package:flutter/material.dart';
import 'package:flutter_api_movie/pages/movie_detail.dart';
import 'package:flutter_api_movie/service/http_service.dart';
import 'package:flutter_api_movie/models/movie.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  late HttpService service;

  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  Future<void> initialize() async {
    final List<Movie> fetchedMovies = await service.getPopularMovies();

    setState(() {
      movies = fetchedMovies ?? [];
      moviesCount = movies.length;
    });
  }

  Future<void> fetchPopularMovies() async {
    final List<Movie> value = await service.getPopularMovies();
    setState(() {
      movies = value;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          return Card(
              color: Colors.deepPurple[50],
              elevation: 2.0,
              child: ListTile(
                leading: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movies[position].posterPath}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(movies[position].title),
                subtitle: Text(
                  'Rating = ${movies[position].voteAverage}',
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ));
        },
      ),
    );
  }
}
