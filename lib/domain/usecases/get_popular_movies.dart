import 'package:nextflutter_app/domain/entities/movie_entity.dart';
import 'package:nextflutter_app/data/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;
  GetPopularMovies(this.repository);
  Future<List<MovieEntity>> call() async => repository.getPopularMovies();
}