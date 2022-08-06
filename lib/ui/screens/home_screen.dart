import 'package:flutter/material.dart';
import 'package:notnetflix/repositories/data_repository.dart';
import 'package:notnetflix/services/api_service.dart';
import 'package:notnetflix/ui/screens/widgets/movie_card.dart';
import 'package:notnetflix/ui/screens/widgets/movie_category.dart';
import 'package:notnetflix/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notnetflix/models/movie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //getMovies();
  }

  //void getMovies()  async{
  //final dataProvider= Provider.of<DataRepository>(context,listen: false);
  //await dataProvider.getPopularMovies();
  //}

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        //elevation: 0,
        //backgroundColor: Colors.transparent,
        backgroundColor: kBackgroundColor,
        leading: Image.asset(
          'assets/images/Netflix.png',
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Container(
            height: 500,
            color: aColor,
            child: dataProvider.popularMovieList.isEmpty
                ? const Center()
                : MovieCard(movie: dataProvider.popularMovieList.first),
          ),
          MovieCategory(
            label: 'Tendancs actuelles',
            movieList: dataProvider.popularMovieList,
            imageHeight: 160,
            imageWidth: 110,
            callback: dataProvider.getPopularMovies
          ),

            MovieCategory(
            label: 'Actuellement au cinéma',
            movieList: dataProvider.popularMovieList,
            imageHeight: 320,
            imageWidth: 220,
            callback: dataProvider.getPopularMovies
          ),

        //   
        ],
      ),
    );
  }
}
