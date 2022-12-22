
import 'package:flutter/material.dart';
import 'package:musicabillboard/musica.dart';
import 'package:http/http.dart' as http;

class MusicaTrack extends ChangeNotifier {
List<TracksDatum> topList = [];
List<PlaylistsDatum> playLists  =[];
 MusicaTrack(){
   getTopmusica();
   getPlaylistMusica();
   
 }
 getTopmusica()async {
  var uri = 'https://api.deezer.com/chart/tracks';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  MusicaDeezer.fromJson(response.body);
  topList = decodeData.tracks.data;
  notifyListeners();
 }
 getPlaylistMusica()async {
  var uri = 'https://api.deezer.com/chart/tracks';
  var url = Uri.parse(uri);
  final response = await http.get(url);
  final decodeData =  MusicaDeezer.fromJson(response.body);
  playLists = decodeData.playlists.data;
  notifyListeners();
 }

}

 