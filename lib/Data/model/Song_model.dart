
import '../../Domain/Entities/Song.dart';

class SongModel extends Song {
  const SongModel({
    required super.title,
    required super.artist,
    required super.durationInSeconds,
    required super.url,
  });

  static List<Song> songList() {
    return const [
      SongModel(
        title: "Midnight City Lights",
        artist: "Luna Rivera",
        durationInSeconds: 372,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      ),
      SongModel(
        title: "Golden Horizon",
        artist: "Ethan Blake",
        durationInSeconds: 331,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      ),
      SongModel(
        title: "Echoes of Tomorrow",
        artist: "Nova Aria",
        durationInSeconds: 303,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      ),
      SongModel(
        title: "Dreams in Neon",
        artist: "Atlas Grey",
        durationInSeconds: 368,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
      ),
      SongModel(
        title: "Waves of Silence",
        artist: "Aurora Vale",
        durationInSeconds: 355,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
      ),
      SongModel(
        title: "Skyline Memories",
        artist: "Oliver Hayes",
        durationInSeconds: 360,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
      ),
      SongModel(
        title: "Distant Stars",
        artist: "Mila Hart",
        durationInSeconds: 314,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
      ),
      SongModel(
        title: "Fragments of You",
        artist: "Noah Carter",
        durationInSeconds: 352,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
      ),
      SongModel(
        title: "City After Rain",
        artist: "Elena Brooks",
        durationInSeconds: 333,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
      ),
      SongModel(
        title: "Last Train Home",
        artist: "Daniel Cross",
        durationInSeconds: 370,
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
      ),
    ];
  }
}