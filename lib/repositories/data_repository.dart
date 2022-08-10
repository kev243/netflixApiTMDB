import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notnetflix/services/api_service.dart';

import '../models/movie.dart';

class DataRepository with ChangeNotifier {
  final APIService apiService = APIService();
  final List<Movie> _popularMovieList = [];
  int _popularMoviePageIndex = 1;

  final List<Movie> _nowPlaying = [];
  int _nowPlayingPageIndex = 1;

  final List<Movie> _upComingMovies = [];
  int _upComingMoviesPageIndex = 1;

  final List<Movie> _animationMovies = [];
  int _animationMoviesPageIndex = 1;

  final List<Movie> _documentaireMovies = [];
  int _documentaireMoviesPageIndex = 1;

//getters
  List<Movie> get popularMovieList => _popularMovieList;
  List<Movie> get nowPlaying => _nowPlaying;
  List<Movie> get upComingMovies => _upComingMovies;
  List<Movie> get animationMovies => _animationMovies;
  List<Movie> get documentaireMovies => _documentaireMovies;

  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies =
          await apiService.getPopularMovies(pageNumber: _popularMoviePageIndex);
      _popularMovieList.addAll(movies);
      _popularMoviePageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getNowPlaying() async {
    try {
      List<Movie> movies =
          await apiService.getNowPlaying(pageNumber: _nowPlayingPageIndex);
      _nowPlaying.addAll(movies);
      _nowPlayingPageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getUpComingMovies() async {
    try {
      List<Movie> movies = await apiService.getUpComingMovies(
          pageNumber: _upComingMoviesPageIndex);
      _upComingMovies.addAll(movies);
      _upComingMoviesPageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getAnimationMovies() async {
    try {
      List<Movie> movies = await apiService.getUpComingMovies(
          pageNumber: _animationMoviesPageIndex);
      _animationMovies.addAll(movies);
      _animationMoviesPageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getDocumentaireMovies() async {
    try {
      List<Movie> movies = await apiService.getDocumentaireMovies(
          pageNumber: _documentaireMoviesPageIndex);
      _documentaireMovies.addAll(movies);
      _documentaireMoviesPageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<Movie> getMovieDetails({required Movie movie})async{
    try {

      //recuperer les infos du film
      Movie newMovie= await apiService.getMovieDetails(movie: movie);

      //on recuperer les videos 
       newMovie = await apiService.getMovieVideos(movie: newMovie);

       //on recuperer les casting
        newMovie = await apiService.getMovieCast(movie: newMovie);

        //on recupere les images du film
         newMovie = await apiService.getMovieImage(movie: newMovie);




      return newMovie;
    }on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }

    
  }

  Future<void> initData() async {
    // await getPopularMovies();
    // await getNowPlaying();
    // await getUpComingMovies();
    // await getAnimationMovies();
    // await getDocumentaireMovies();

    await Future.wait([
      getPopularMovies(),
      getNowPlaying(),
      getUpComingMovies(),
      getAnimationMovies(),
      getDocumentaireMovies(),
      
    ]);
  }
}
