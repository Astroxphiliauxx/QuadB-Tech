import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/detail_screen.dart';

class MovieSearchDelegate extends SearchDelegate<Movie?> {
  final List<Movie> allMovies;

  MovieSearchDelegate(this.allMovies);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = allMovies.where((movie) {
      return movie.show?.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();

    return results.isEmpty
        ? const Center(child: Text('No results found!', style: TextStyle(color: Colors.red)))
        : Padding(
           padding: const EdgeInsets.all(8.0),
           child: GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
             itemCount: results.length,
             itemBuilder: (context, index) {
                  final movie = results[index];
                  return GestureDetector(
                      onTap: () {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => MovieDetailsScreen(movie: movie),
                             ),
                         );
                        },
                     child: Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                             Expanded(
                               child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),),
                                  child: movie.show?.image?.medium != null
                                      ? Image.network(movie.show!.image!.medium!, fit: BoxFit.cover,)
                                      : Image.asset('assets/noimage.png', fit: BoxFit.cover,),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                     Text(movie.show?.name ?? '',
                                        style: const TextStyle(
                                           color: Colors.red,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 16,
                                         ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                   Text(
                                     movie.show?.language ?? '',
                                     style: const TextStyle(color: Colors.white70, fontSize: 14),
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                   ),

                                ],
                               ),
                             ),
                            ],
                          ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = allMovies.where((movie) {
      return movie.show?.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final movie = suggestions[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie),),);
            },
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: movie.show?.image?.medium != null
                          ? Image.network(movie.show!.image!.medium!, fit: BoxFit.cover)
                          : Image.asset('assets/noimage.png', fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.show?.name ?? '',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie.show?.language ?? '',
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
