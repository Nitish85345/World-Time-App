import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    // this is the position where we will recieve the passed data to this widget
    data = data.isEmpty? ModalRoute.of(context).settings.arguments : data;
    // this will reupdate the once will come back so need to add tertianary condition to it
    print(data);

    // set Background
    String bgImage = data['isDay'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDay'] ? Colors.blue[300] : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,  
                  ),
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDay' : result['isDay'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  label: Text(
                    'Choose Location',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  )
                ),
                SizedBox(height:10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  ),
                SizedBox(height:20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
