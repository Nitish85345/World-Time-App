import 'package:flutter/material.dart';
import 'package:World_Time_App/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading....';

  void setupWorldTime() async {
    // it will create an instance of world time class and will get the time
    WorldTime instance = WorldTime(location: 'India', flag:'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    setState(() {
      time = instance.time;
    }); 

    Navigator.pushReplacementNamed(context,'/home', arguments: {
      // this is map (key-value pair)
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDay': instance.isDay,
    });
     
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.grey[500],
          size: 50.0,
        ),
      ),
    );
  }
}