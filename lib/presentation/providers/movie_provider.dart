import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nextflutter_app/domain/entities/movie_entity.dart';
import 'package:nextflutter_app/data/datasources/movie_datasource.dart';

class MovieProvider extends ChangeNotifier {
  final MovieDatasource _datasource;
  List<MovieEntity> _popularMovies = [];
  bool _isLoading = false;
  String _error = '';

  MovieProvider(this._datasource) {
    _loadPopular();
  }

  List<MovieEntity> get popularMovies => _popularMovies;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> _loadPopular() async {
    _isLoading = true;
    notifyListeners();
    try {
      _popularMovies = await _datasource.getPopularMovies();
      _error = '';
    } catch (e) {
      _error = 'Impossible de charger les films';
      _popularMovies = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await _loadPopular();
  }
}