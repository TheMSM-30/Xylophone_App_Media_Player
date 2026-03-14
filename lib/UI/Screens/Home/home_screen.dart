import 'package:flutter/material.dart';
import 'package:music_player_assignment/UI/Screens/Home/Provider/provider.dart';
import 'package:music_player_assignment/UI/Screens/Home/widgets/playController.dart';
import 'package:music_player_assignment/UI/Screens/Home/widgets/song_list_item.dart';
import 'package:music_player_assignment/core/constant/appcolor.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "Xylophone Music Player",
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.surface,
      ),
      body: Column(
        children: [
          PlayerController(),
          Expanded(
            child: Consumer<MediaProvider>(
              builder: (context, provider, child) {
                final playlist = provider.playlist;
                return ListView.builder(
                  itemCount: playlist.length,
                  itemBuilder: (context, index) {
                    final song = playlist[index];

                    final isSelected = index == provider.currentIndex;

                    return SongListItem(
                      song: song,
                      index: index,
                      isPlaying: provider.isPlaying,
                      isSelected: isSelected,
                      onTap: () {
                        provider.playSongAtIndex(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}