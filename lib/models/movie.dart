// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:notnetflix/services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;
  final List <String>? genres;
  final String? releaseDate;
  final double? vote;
  Movie({
    required this.id,
    required this.name,
    required this.description,
     this.posterPath,
     this.genres,
     this. releaseDate,
     this.vote
  });
  

  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? posterPath,
    List<String>?genres,
    String? releaseDate,
     double? vote,
    
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
      genres:  genres?? this.genres,
      releaseDate:  releaseDate?? this.releaseDate,
      vote: vote?? this.vote,
    );
  }

  

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ,
      name: map['title'],
      description:map['overview'] ,
      posterPath: map['poster_path'] ,
    );
  }

  String posterURL() {
    API api =API();
    return api.baseImageURL + posterPath!;
  }
//fonction pour afficher les elements en separant par les virgules
  String reformatGenres(){
    String categories= '';
    for (int i=0; i<genres!.length; i++){
      if (i== genres!.length-1){
        categories = categories+genres![i];
      }else{
        categories = categories+'${genres![i]},';
      }
    }
    return categories;
  }
 


 

  

  


}
