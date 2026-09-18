import 'package:nextflutter_app/data/datasources/movie_datasource.dart';
import 'package:nextflutter_app/domain/entities/movie_entity.dart';

class MovieRepository implements MovieDatasource {
  final MovieDatasource _datasource;

  MovieRepository(this._datasource);

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    return await _datasource.getPopularMovies();
  }

  @override
  Future<MovieEntity> getMovieDetails(int movieId) async {
    return await _datasource.getMovieDetails(movieId);
  }
}