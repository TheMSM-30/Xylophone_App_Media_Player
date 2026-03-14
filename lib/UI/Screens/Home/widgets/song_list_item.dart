import 'package:flutter/material.dart';
import 'package:music_player_assignment/Domain/Entities/Song.dart';
import 'package:music_player_assignment/core/constant/appcolor.dart';
import 'package:music_player_assignment/core/utils/duration_formatter.dart';

class SongListItem extends StatelessWidget {
  const SongListItem({
    super.key,
    required this.song,
    required this.index,
    required this.isPlaying,
    required this.isSelected,
    required this.onTap,
  });
  final Song song;
  final int index;
  final bool isPlaying;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withValues(alpha: 0.2)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: isSelected && isPlaying
            ? Icon(Icons.music_note, color: AppColors.accent)
            : Text(
          '${index + 1}',
          style: TextStyle(
            color: isSelected
                ? AppColors.accent
                : AppColors.textSecondary,
            fontWeight: .bold,
          ),
        ),
      ),
      title: Text(
        song.title,
        style: TextStyle(
          color: isSelected ? AppColors.accent : AppColors.textSecondary,
        ),
      ),
      subtitle: Text(
        song.artist,
        style: TextStyle(
          color: isSelected ? AppColors.accent : AppColors.textSecondary,
        ),
      ),
      onTap: onTap,
      trailing: Text(
        DurationFormatter.duration_format(Duration(seconds: song.durationInSeconds)),
        style: TextStyle(color: AppColors.textSecondary),
      ),
    );
  }

}