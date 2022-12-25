import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicabillboard/apimusica.dart';
import 'package:musicabillboard/musica.dart';
import 'package:musicabillboard/notas.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final musicatop = Provider.of<MusicaTrack>(context, listen: true);
    final List<TracksDatum> musica = musicatop.topList;
    final List<PlaylistsDatum> playlists = musicatop.playLists;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 185, 246),
      appBar: AppBar(
        title: Text('My Musica Favorita'.toUpperCase()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.white,
              child: Text('Notas'),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notas()));
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...musica.map(
                    (e) {
                      var textStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 17);
                      return Container(
                      width: MediaQuery.of(context).size.width*.9,
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromARGB(255, 0, 0, 0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('https://img.freepik.com/vector-premium/logotipo-radio_9850-251.jpg'))
                              ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            
                              child: Text(e.title,style: textStyle,)),
                          SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                  ),
                                  onPressed: () {
                                    if (isPlaying) {
                                      player.pause();
                                    } else {
                                      player.play(UrlSource('${e.preview}'));
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                radius: 25,
                                child: IconButton(
                                  icon: const Icon(Icons.stop),
                                  onPressed: () {
                                    player.stop();
                                  },
                                ),
                              ),
                            ],
                          ),

                          Slider(
                            min: 0,
                            max: duration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: (value) {
                              final position = Duration(seconds: value.toInt());
                              player.seek(position);
                              player.resume();
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formatTime(position.inSeconds)),
                                Text(formatTime((duration - position).inSeconds)),
                              ],
                            ),
                          ),
                           Container(
                            
                              child: Column(
                                children: [
                                  
                                   Text('TOP: ${e.position}', style: textStyle,),
                                ],
                              )),
                        ],
                        
                      ),
                    );
                    },
                  ),
                  
                ],
              ),
            ),

            Container(
              
              decoration: BoxDecoration(
                color: Color.fromARGB(157, 0, 0, 0).withOpacity(.5),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                    Text('Lo mejor del Momento'.toUpperCase(),style:TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
                  ...playlists.map(
                    (e) {
                      var textStyle2 = TextStyle(color: Colors.white);
                      return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 38, 1, 43),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(e.title, style: textStyle2,),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(e.pictureXl)),
                                  Text('Ver:${e.tracklist}',style: textStyle2,),
                                  Text('Favorito de la Semana:',style: textStyle2,),
                                  e.public ?  Icon(Icons.star_border , color:  Colors.red ,) : Icon(Icons.star_border , color:  Colors.white ,) ,
                                //  Text('Ver:${e.public}'),
                                  Text('Fecha creacion :${e.creationDate.day.toString()}/ ${e.creationDate.month.toString()}/ ${e.creationDate.year.toString()}',style: textStyle2,),
        
                                ],
                              ),
                            ),
                          ),

                        
                        ],
                      ),
                    );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
