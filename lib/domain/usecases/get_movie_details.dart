import 'package:nextflutter_app/domain/entities/movie_entity.dart';
import 'package:nextflutter_app/data/repositories/movie_repository.dart';

class GetMovieDetails {
  final MovieRepository repository;
  final int movieId;
  GetMovieDetails(this.repository, this.movieId);
  Future<MovieEntity> call() async => repository.getMovieDetails(movieId);
}