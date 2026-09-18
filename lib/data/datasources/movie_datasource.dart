import 'package:nextflutter_app/domain/entities/movie_entity.dart';

abstract class MovieDatasource {
  Future<List<MovieEntity>> getPopularMovies();
  Future<MovieEntity> getMovieDetails(int movieId);
}

abstract class AuthDatasource {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
  Future<void> logout();
  Future<bool> checkAuthStatus();
}