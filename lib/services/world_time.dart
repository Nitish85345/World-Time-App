import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; // location for UI
  String flag; // asset address of the flag
  String time; // will calclate the time and assing it here
  String url ; // url endpoint for the location
  bool isDay; // to set if it is day or night

  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async{

    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      int hours = int.parse(offset.substring(1,3));
      int minutes = int.parse(offset.substring(4,));

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours : hours, minutes: minutes));

      isDay = (now.hour>6 && now.hour<20) ? true : false;
      // set the time property  
      // here we are converting the time in string and readable format
      time = DateFormat.jm().format(now);

    } catch (e) {
      print('this is error: $e');
      time = 'Could not get Time';
    }

    

  }

  // whenever in future we want to create instance of the class this will done in this way
  //WorldTime instance = WorldTime(location: 'Berlin', flag:'germany.png', url: 'Europe/Berlin');

}