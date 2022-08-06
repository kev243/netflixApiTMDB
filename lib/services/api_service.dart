import 'api.dart';
import 'package:dio/dio.dart';
import 'package:notnetflix/models/movie.dart';
import 'package:notnetflix/services/api_key.dart';

class APIService{
  final API api = API();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String,dynamic>? params})async{

    // construction de URL
    String _url=api.baseURL+path;
    
    //construction des paramètres
    //paramètres present dans tout nos requetes
    Map<String,dynamic> query ={
      'api_key': api.apikey,
      'language':'fr-FR',

    };
    //si params n'est pas null , on ajoute son contenu à query
    if (params != null){
      query.addAll(params);
    }

    //on fait l'app
    final response = await dio.get(_url, queryParameters: query);
    //verification de la requete
    if (response.statusCode == 200){ 
      return response;
    }else{
      throw response;

    }
  }


  Future<List<Movie>> getPopularMovies({required int pageNumber})async{
    Response response = await getData('/movie/popular',params: {
      'page':pageNumber,
    });

    if (response.statusCode==200){
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<Movie> movies=[];  
      for (Map<String,dynamic>json in results){
        Movie movie =Movie.fromJson(json);
        movies.add(movie);

      }
      return movies;

    }else {
      throw response;
    }
// for (Map<String,dynamic>json in results)
  }
}