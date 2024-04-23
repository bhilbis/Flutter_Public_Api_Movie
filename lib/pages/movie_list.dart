import 'package:flutter/material.dart';
import 'package:flutter_api_movie/pages/movie_detail.dart';
import 'package:flutter_api_movie/service/http_service.dart';
import 'package:flutter_api_movie/models/movie.dart';

class MovieList extends StatefulWidget {
  final String category;
  const MovieList({Key? key, required this.category}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position]),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movies[position].posterPath}',
                        width: 150,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movies[position].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              SizedBox(width: 4),
                              Text(
                                '${movies[position].voteAverage.toStringAsFixed(1)}/10',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Overview: ${movies[position].overview}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
