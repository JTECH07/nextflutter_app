import 'package:dio/dio.dart';
import 'package:nextflutter_app/data/models/movie_model.dart';
import 'package:nextflutter_app/domain/entities/movie_entity.dart';
import 'package:nextflutter_app/data/datasources/movie_datasource.dart';

class MovieRemoteDatasource implements MovieDatasource {
  final Dio dio;

  MovieRemoteDatasource(this.dio);

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final response = await dio.get('/movie/popular');
    final list = response.data['results'] as List;
    return list.map((json) => MovieEntity.fromMap(MovieModel.fromJson(json).toMap())).toList();
  }

  @override
  Future<MovieEntity> getMovieDetails(int movieId) async {
    final response = await dio.get('/movie/$movieId');
    return MovieEntity.fromMap(MovieModel.fromJson(response.data as Map<String, dynamic>).toMap());
  }
}