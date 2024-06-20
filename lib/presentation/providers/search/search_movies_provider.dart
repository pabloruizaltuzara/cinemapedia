import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {

      final movierepository = ref.read(movieRepositoryProvider);
      return SearchedMoviesNotifier(
        ref: ref, 
        searchMovies: movierepository.searchMovies
      );
    });

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({required this.searchMovies, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
