import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nextflutter_app/presentation/providers/movie_provider.dart';
import 'package:nextflutter_app/presentation/providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = context.watch<MovieProvider>();
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          authProvider.isAuthenticated
              ? IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () => authProvider.logout(),
                )
              : IconButton(
                  icon: const Icon(Icons.login),
                  onPressed: () {},
                ),
        ],
      ),
      body: _buildBody(movieProvider, authProvider),
    );
  }

  Widget _buildBody(MovieProvider movieProvider, AuthProvider authProvider) {
    if (!authProvider.isAuthenticated) {
      return const Center(child: Text('Connectez-vous d\'abord'));
    }

    if (movieProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (movieProvider.error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(movieProvider.error),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => movieProvider.refresh(),
              child: const Text('Réessayer'),
            ),
          ],
        ),
      );
    }

    if (movieProvider.popularMovies.isEmpty) {
      return const Center(child: Text('Aucun film disponible'));
    }

    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: movieProvider.popularMovies.length,
      itemBuilder: (context, index) {
        final movie = movieProvider.popularMovies[index];
        return Card(
          child: Column(
            children: [
              Image.network(
                movie.posterPath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.title),
              ),
            ],
          ),
        );
      },
    );
  }
}