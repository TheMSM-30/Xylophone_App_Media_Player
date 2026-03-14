import 'package:flutter/material.dart';
import 'package:music_player_assignment/UI/Screens/Home/Provider/provider.dart';
import 'package:music_player_assignment/core/constant/appcolor.dart';
import 'package:music_player_assignment/core/utils/duration_formatter.dart';
import 'package:provider/provider.dart';

class PlayerController extends StatelessWidget {


  const PlayerController({super.key});

  @override
  Widget build(BuildContext context) {
    double? dragValue;
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        final currentSong = provider.currentSong;

        if (currentSong == null) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentSong.title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
              Text(
                currentSong.artist,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTickMarkColor: AppColors.accent,
                  inactiveTickMarkColor:
                  AppColors.textSecondary.withValues(alpha: 0.3),
                  thumbColor: AppColors.accent,
                  trackHeight: 4.0,
                  thumbShape:
                  const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                  overlayShape:
                  const RoundSliderOverlayShape(overlayRadius: 14),
                ),
                child: Slider(
                  value: dragValue ??
                      provider.position.inMilliseconds.toDouble().clamp(
                        0.0,
                        provider.duration.inMilliseconds.toDouble() > 0
                            ? provider.duration.inMilliseconds.toDouble()
                            : 1.0,
                      ),

                  min: 0,
                  max: provider.duration.inMilliseconds.toDouble() > 0
                      ? provider.duration.inMilliseconds.toDouble()
                      : 1.0,

                  onChanged: (value) {
                    dragValue = value;
                  },

                  onChangeEnd: (value) {
                    provider.seek(Duration(milliseconds: value.toInt()));
                    dragValue = null;
                  },
                )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DurationFormatter.duration_format(provider.position),
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      DurationFormatter.duration_format(provider.duration),
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => provider.playPrevious(),
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 50,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 24),

                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => provider.playPause(),
                      icon: Icon(
                        provider.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 50,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  const SizedBox(width: 24),

                  IconButton(
                    onPressed: () => provider.playNext(),
                    icon: const Icon(
                      Icons.skip_next,
                      size: 50,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}