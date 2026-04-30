import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/exercise_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../data/exercise_image_map.dart';

/// Displays exercise images with animated crossfade between
/// starting and ending positions (0.jpg ↔ 1.jpg).
class ExerciseImage extends StatefulWidget {
  const ExerciseImage({
    super.key,
    required this.exerciseName,
    required this.bodyPartIndex,
    this.size = 120,
    this.animate = true,
  });

  final String exerciseName;
  final int bodyPartIndex;
  final double size;
  final bool animate;

  @override
  State<ExerciseImage> createState() => _ExerciseImageState();
}

class _ExerciseImageState extends State<ExerciseImage> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.animate) _startAnimation();
  }

  @override
  void didUpdateWidget(ExerciseImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && _timer == null) {
      _startAnimation();
    } else if (!widget.animate) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void _startAnimation() {
    final urls = exerciseImageMap[widget.exerciseName];
    if (urls == null || urls.length < 2) return;
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (_) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % urls.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urls = exerciseImageMap[widget.exerciseName];

    if (urls == null || urls.isEmpty) {
      return _BodyPartFallback(
          bodyPartIndex: widget.bodyPartIndex, size: widget.size);
    }

    final url = urls[_currentIndex.clamp(0, urls.length - 1)];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: CachedNetworkImage(
          key: ValueKey(url),
          imageUrl: url,
          width: widget.size,
          height: widget.size,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: AppTheme.darkSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (context, url, error) => _BodyPartFallback(
              bodyPartIndex: widget.bodyPartIndex, size: widget.size),
        ),
      ),
    );
  }
}

/// A larger, non-animated gallery showing all exercise images side by side.
/// Used on the exercise detail screen.
class ExerciseImageGallery extends StatelessWidget {
  const ExerciseImageGallery({
    super.key,
    required this.exerciseName,
    required this.bodyPartIndex,
    this.height = 200,
  });

  final String exerciseName;
  final int bodyPartIndex;
  final double height;

  @override
  Widget build(BuildContext context) {
    final urls = exerciseImageMap[exerciseName];

    if (urls == null || urls.isEmpty) {
      return _BodyPartFallback(bodyPartIndex: bodyPartIndex, size: height);
    }

    return SizedBox(
      height: height,
      child: Row(
        children: [
          for (int i = 0; i < urls.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: urls[i],
                  height: height,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: AppTheme.darkSurface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: AppTheme.darkSurface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.broken_image,
                        color: AppTheme.textSecondary),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BodyPartFallback extends StatelessWidget {
  const _BodyPartFallback({required this.bodyPartIndex, required this.size});
  final int bodyPartIndex;
  final double size;

  @override
  Widget build(BuildContext context) {
    final bodyPart = bodyPartIndex < BodyPart.values.length
        ? BodyPart.values[bodyPartIndex]
        : BodyPart.fullBody;

    final icon = switch (bodyPart) {
      BodyPart.chest => Icons.expand,
      BodyPart.back => Icons.airline_seat_flat,
      BodyPart.shoulders => Icons.accessibility_new,
      BodyPart.biceps ||
      BodyPart.triceps ||
      BodyPart.forearms =>
        Icons.front_hand,
      BodyPart.absCore => Icons.rectangle_outlined,
      BodyPart.glutes ||
      BodyPart.quads ||
      BodyPart.hamstrings ||
      BodyPart.calves =>
        Icons.directions_walk,
      BodyPart.fullBody => Icons.accessibility,
    };

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, size: size * 0.45, color: AppTheme.primaryOrange),
    );
  }
}
