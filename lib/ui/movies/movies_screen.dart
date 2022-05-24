import 'dart:convert';

import 'package:example_blocs/ui/movies/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MoviesScreen extends StatefulWidget {
  static const String id = '/movies';

  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  var moviesList = <Movie>[];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: moviesList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              height: 160,
              child: Row(
                children: [
                  Image.network(
                    moviesList[index].image,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            moviesList[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Rating: ${moviesList[index].rating}'),
                          Text(
                            moviesList[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void fetchMovies() async {
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');

      final response = await Client().get(uri).timeout(
            const Duration(seconds: 10),
          );

      final responseJson = jsonDecode(response.body);

      moviesList = responseJson['results']
          .map<Movie>((e) => Movie(
                image: e['poster_path'],
                name: e['original_title'],
                description: e['overview'],
                rating: e['vote_average'].toString(),
              ))
          .toList();

      setState(() {});
    } catch (error) {
      // TODO: deal with error
    }
  }
}
