// To parse this JSON data, do
//
//     final musicaDeezer = musicaDeezerFromMap(jsonString);

import 'dart:convert';

class MusicaDeezer {
    MusicaDeezer({
       required this.tracks,
        // this.albums,
      //  this.artists,
        required this.playlists,
        // this.podcasts,
    });

    Tracks tracks;
    // Albums albums;
    //  Artists artists;
    Playlists playlists;
    // Podcasts podcasts;

    factory MusicaDeezer.fromJson(String str) => MusicaDeezer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MusicaDeezer.fromMap(Map<String, dynamic> json) => MusicaDeezer(
        tracks: Tracks.fromMap(json["tracks"]),
        // albums: Albums.fromMap(json["albums"]),
        //  artists: Artists.fromMap(json["artists"]),
         playlists: Playlists.fromMap(json["playlists"]),
        // podcasts: Podcasts.fromMap(json["podcasts"]),
    );

    Map<String, dynamic> toMap() => {
        "tracks": tracks.toMap(),
        // "albums": albums.toMap(),
        //  "artists": artists.toMap(),
         "playlists": playlists.toMap(),
        // "podcasts": podcasts.toMap(),
    };
}


class Playlists {
    Playlists({
       required  this.data,
      required  this.total,
    });

    List<PlaylistsDatum> data;
    int total;

    factory Playlists.fromJson(String str) => Playlists.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Playlists.fromMap(Map<String, dynamic> json) => Playlists(
        data: List<PlaylistsDatum>.from(json["data"].map((x) => PlaylistsDatum.fromMap(x))),
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
    };
}

class PlaylistsDatum {
    PlaylistsDatum({
      required  this.id,
      required  this.title,
      required  this.public,
      required  this.nbTracks,
      required  this.link,
      required  this.picture,
      required  this.pictureSmall,
      required  this.pictureMedium,
      required  this.pictureBig,
      required  this.pictureXl,
      required  this.checksum,
      required  this.tracklist,
      required  this.creationDate,
      required  this.md5Image,
    });

    int id;
    String title;
    bool public;
    int nbTracks;
    String link;
    String picture;
    String pictureSmall;
    String pictureMedium;
    String pictureBig;
    String pictureXl;
    String checksum;
    String tracklist;
    DateTime creationDate;
    String md5Image;


    factory PlaylistsDatum.fromJson(String str) => PlaylistsDatum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlaylistsDatum.fromMap(Map<String, dynamic> json) => PlaylistsDatum(
        id: json["id"],
        title: json["title"],
        public: json["public"],
        nbTracks: json["nb_tracks"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        checksum: json["checksum"],
        tracklist: json["tracklist"],
        creationDate: DateTime.parse(json["creation_date"]),
        md5Image: json["md5_image"],

    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "public": public,
        "nb_tracks": nbTracks,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "checksum": checksum,
        "tracklist": tracklist,
        "creation_date": creationDate.toIso8601String(),
        "md5_image": md5Image,
    };
}

class Tracks {
    Tracks({
      required  this.data,
      required   this.total,
    });

    List<TracksDatum> data;
    int total;

    factory Tracks.fromJson(String str) => Tracks.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
        data: List<TracksDatum>.from(json["data"].map((x) => TracksDatum.fromMap(x))),
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
    };
}

class TracksDatum {
    TracksDatum({
      required  this.id,
      required  this.title,
      required  this.titleShort,
      required  this.titleVersion,
      required  this.link,
      required  this.duration,
      required  this.rank,
      required  this.explicitLyrics,
      required  this.explicitContentLyrics,
      required  this.explicitContentCover,
      required  this.preview,
       required this.md5Image,
       required this.position,

       required this.type,
    });

    int id;
    String title;
    String titleShort;
    String titleVersion;
    String link;
    int duration;
    int rank;
    bool explicitLyrics;
    int explicitContentLyrics;
    int explicitContentCover;
    String preview;
    String md5Image;
    int position;
   
    String type;

    factory TracksDatum.fromJson(String str) => TracksDatum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TracksDatum.fromMap(Map<String, dynamic> json) => TracksDatum(
        id: json["id"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"] == null ? null : json["title_version"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        position: json["position"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion == null ? null : titleVersion,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "position": position,
        "type": type,
    };
}
