import 'package:flutter/material.dart';
import 'package:notnetflix/models/movie.dart';
import 'package:notnetflix/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import 'movie_card.dart';

class MovieCategory extends StatelessWidget {
  final String label;
  final List<Movie> movieList;
  final double imageHeight;
  final double imageWidth;
  final Function callback;

  //constructeur
  const MovieCategory({
    Key? key,
    required this.label,
    required this.movieList,
    required this.imageHeight,
    required this.imageWidth,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 15),
        SizedBox(
          height: imageHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification){
              //position actuelle
              final currentPosition =notification.metrics.pixels;
              //position max
              final maxPosition = notification.metrics.maxScrollExtent;
              if (currentPosition>=maxPosition/2 ){
               callback(); 
                
              }
              return true;
            },
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    width: imageWidth,
                    color: aColor,
                    child: Center(
                        child: movieList.isEmpty
                            ? Center(
                                child: Text(index.toString()),
                              )
                            : MovieCard(movie: movieList[index])),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
