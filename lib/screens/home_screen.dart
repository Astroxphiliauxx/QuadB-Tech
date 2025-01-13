import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_search_delegate.dart';
import '../services/movie_services.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> moviesList;
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    moviesList = [];
    fetchMovies(page);
  }

  Future<void> fetchMovies(int page) async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Movie> fetchedMovies = await MovieService.fetchMovies(page: page);
      setState(() {
        this.page = page;
        moviesList.addAll(fetchedMovies); // Add the new movies to the list
      });
    } catch (e) {
      print('Error fetching movies: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 30, // Adjust the size
          child: Image.asset('assets/netflix.png'),
        ),


        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.red),
            onPressed: () async {

              final moviesList = await MovieService.fetchMovies(page: 1);

              showSearch(
                context: context,
                delegate: MovieSearchDelegate(moviesList),
              );
            },
          ),

        ],
      ),
      body: GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: moviesList.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == moviesList.length) {
            return Center(child: CircularProgressIndicator());
          }

          final movie = moviesList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(movie: movie),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  // Display the image
                  movie.show?.image?.medium != null
                      ? Image.network(
                    movie.show!.image!.medium!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                      : Image.asset(
                    'assets/noimage.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  // Gradient overlay for text readability
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  // Movie name displayed at the bottom
                  Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    right: 8.0,
                    child: Text(
                      movie.show?.name ?? 'No Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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
