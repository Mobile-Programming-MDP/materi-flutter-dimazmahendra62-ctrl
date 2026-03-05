import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pilem/models/movie.dart';
import 'package:pilem/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @overrride
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiServices = ApiServices();

  List<Movie> _allMovies = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];

  Future<void> loasMovies() async{
    final List<Map<String, dynamic>> allMoviesData = await_apiService.
    getAllMovies();

    setState(() {
      _allMovies = allMoviesData.map((e) => Movie.fromJson(e)).toList();
      _trendingMovies = _trendingMoviesData.map(e)) => Movie.fromJson(e)).toList();
      _popularMovies = _popularMoviesData.map((e) => Movie.fromJson(e)).toList();
    });
  }


  @Override
  void initState() {
    super.initState();
    _loadMovies();
  }

  @Override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              _buildMovieList("All Movies", _allMovies),
              _buildMovieList("Trending Movies", _trendingMovies),
              _buildMovieList("Popular Movies", _popularMovies),
          ],
        ),
      ),
    );
  }

  Widget buildMovieList(String title, List<Movie> movies){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding(
            padding: EdgeInsets.all(
            child: Text(
              title,
              style: TextStyle(frontSize: 20, fontWeight: FontWeight.
              bold),
            ),        
          ),
          SizeBox{
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                final Movie movie = movies[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    
                  ),
                    
                  ),
                )
              }
            )
          }
        ],
    );
  }
}