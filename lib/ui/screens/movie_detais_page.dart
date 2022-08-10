import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notnetflix/models/movie.dart';
import 'package:notnetflix/repositories/data_repository.dart';
import 'package:notnetflix/ui/screens/widgets/action_button.dart';
import 'package:notnetflix/ui/screens/widgets/casting_card.dart';
import 'package:notnetflix/ui/screens/widgets/galerie_card.dart';
import 'package:notnetflix/ui/screens/widgets/movie_info.dart';
import 'package:notnetflix/ui/screens/widgets/my_video_player.dart';
import 'package:notnetflix/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? newMovie;
  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  void getMovieData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    //recuperer le detail d'un film

    Movie _movie = await dataProvider.getMovieDetails(movie: widget.movie);
    setState(() {
      newMovie = _movie;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
        ),
        body: newMovie == null
            ? Center(
                child: SpinKitFadingCircle(color: kBackgroundColor, size: 20),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,

                      child: newMovie!.videos!.isEmpty
                          ? Center(
                              child: Text(
                                'Pas de vidéo disponible',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : MyVideoPlayer(movieId: newMovie!.videos!.first),
                      // color: Colors.red,
                    ),
                    MovieInfo(movie: newMovie!),
                    const SizedBox(height: 20),
                    ActionButton(
                      label: 'Lecture',
                      icon: Icons.play_arrow,
                      bgColor: Colors.white,
                      color: kBackgroundColor,
                    ),
                    SizedBox(height: 10),
                    ActionButton(
                      label: 'Télécharger la vidéo',
                      icon: Icons.download,
                      bgColor: Colors.grey.withOpacity(0.3),
                      color: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Text(
                      newMovie!.description,
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Casting',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newMovie!.casting!.length,
                          itemBuilder: (context, int index) {
                            return newMovie!.casting![index].imageURL == null
                                ? const Center()
                                : CastingCard(
                                    person: newMovie!.casting![index]);
                          }),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Galerie',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: newMovie!.images!.length,
                            itemBuilder: (context, int index) {
                              return GalerieCard(
                                posterPath: newMovie!.images![index],
                              );
                            })),
                            SizedBox(height: 10),
                  ],
                 
                ),
               
              ));
  }
}
