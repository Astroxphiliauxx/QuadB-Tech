import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.show?.name ?? 'Details',
        style: TextStyle(color: Colors.red),),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            SizedBox(
              width: double.infinity,
              height: 250,
              child: movie.show?.image?.medium != null
                  ? Image.network(
                movie.show!.image!.medium!,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                'assets/noimage.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 10),
                  // Language
                  Row(
                    children: [
                      const Icon(Icons.language, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        movie.show?.language ?? 'N/A',
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 8),
                      Text(
                        movie.show?.rating?.average?.toString() ?? 'No Rating',
                        style: const TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movie.show?.summary?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                        'No description',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Additional Details',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Premiered:      ',
                        style: TextStyle(fontSize: 18, color: Colors.white54),
                      ),
                      Text(movie.show?.premiered ?? 'N/A',
                        style: const TextStyle(fontSize: 16, color: Colors.white),)
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        'Genres:            ',
                        style: TextStyle(fontSize: 18, color: Colors.white54),
                      ),
                      Text(movie.show?.genres?.join(', ') ?? 'N/A',
                        style: const TextStyle(fontSize: 16, color: Colors.white),)
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
