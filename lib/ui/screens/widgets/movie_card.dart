import 'package:flutter/material.dart';
import 'package:notnetflix/models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;

  const MovieCard({Key? key,
  required this.movie
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl:movie.posterURL(),
    fit:BoxFit.cover,
    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error),),
    );
  }
}