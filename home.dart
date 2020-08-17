
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:audioplayers/audioplayers.dart';


AudioPlayer newPlayer = new AudioPlayer();
AudioCache audio = new AudioCache(fixedPlayer: newPlayer);
bool play = false;
bool stop = true;
playAudio() {
  if (play == false || stop == true) {
    audio.play('1.wav'); 
    play = true;
    stop = false;
  }
}

pauseAudio() {
  if (play == true) {
    newPlayer.pause();
    play = false;
  }
}

stopAudio() {
  if (play == true && stop == false) {
    newPlayer.stop();
    play = false;
    stop = true;
  }
}

myapp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.black);
  FlutterStatusbarcolor.setNavigationBarColor(Colors.brown.shade900);

  var body = Scaffold(
    appBar: AppBar(
      title: Center(child: Text('music app')),
      leading: Icon(Icons.music_note),
      backgroundColor: Colors.black,
      actions: <Widget>[
        Icon(Icons.view_list),
      ],
    ),
    backgroundColor: Colors.brown.shade400,
    body: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
     
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
          
           width: 300,
           height: 300,
           margin: EdgeInsets.all(20),
            child: Image.asset("images/changes.jpg"),
          ),
        ),
        Container(
          
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              
                FlatButton(
                  onPressed: playAudio,
                  child: Icon(Icons.play_arrow),
                //  padding: EdgeInsets.symmetric(horizontal: 100),
                ),
                
                FlatButton(
                 // padding: EdgeInsets.symmetric(horizontal: -60),
                  onPressed: pauseAudio,
                  child: Icon(Icons.pause),
                ),
                FlatButton(
                  onPressed: stopAudio,
                  child: Icon(Icons.stop),
                ),
                
              ],
            ),
          ),
          Container(
                  
                 
          ),
      
      ],
        
    ),
  );
var design = MaterialApp(
    home: body,
    debugShowCheckedModeBanner: false,
  );
  return design;
}

