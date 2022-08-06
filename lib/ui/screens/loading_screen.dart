import 'package:flutter/material.dart';
import 'package:notnetflix/repositories/data_repository.dart';
import 'package:notnetflix/ui/screens/home_screen.dart';
import 'package:notnetflix/utils/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
  
class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    initData();
  }

 void initData()  async{
  //appel API
  final dataProvider = Provider.of<DataRepository>(context, listen:false);
  //initialise liste movies
  await dataProvider.initData();
  //ensuite on vas sur homeScreen
  // pushReplacement:sans retour en arriere avec 
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return HomeScreen();
  }));
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/netflix_logo_1.png',
          ),
          SpinKitFadingCircle(
            color: kPrimaryColor,
            size: 20,
            
            ),

           
        ],
      ),
    );

  }
}