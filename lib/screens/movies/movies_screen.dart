import 'dart:convert';

import 'package:example_blocs/screens/movies/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MoviesScreen extends StatefulWidget {
  static const String id = 'movies';

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
        //TODO: Crie uma lista com as informações dos filmes
        child: Container(),
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
