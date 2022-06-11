import 'package:example_blocs/domain/entities/movie_entity.dart';

class MovieModel {
  MovieModel({
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
  });

  String title;
  String description;
  String image;
  String rating;

  factory MovieModel.fromJson(Map json) => MovieModel(
        image: json['poster_path'],
        title: json['title'],
        description: json['overview'],
        rating: json['vote_average'].toString(),
      );

  MovieEntity toEntity() => MovieEntity(
        name: title,
        description: description,
        image: image,
        rating: rating,
      );
}
