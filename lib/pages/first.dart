import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather.dart';
import 'package:flutter_application_1/services/api_manager.dart';

class first extends StatefulWidget {
  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  Future<Welcome> _welcome;

  @override
  void initState() {
    _welcome = API_Manager().getWeather();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather")),
      body: Container(
        child: FutureBuilder<Welcome>(
          future: _welcome,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.cnt,
                itemBuilder: (context, index) {
                  var weather = snapshot.hasData;
                  return Container(
                    height: 100,
                  );
                },
              );
            }
            else
            return Center(child: CircularProgressIndicator());            
          },
        ),
      ),
    );
  }
}
