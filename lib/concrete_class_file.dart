import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/file.dart';

final class AudioFile extends File {
  const AudioFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.music_note);
}

final class ImageFile extends File {
  const ImageFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.image);
}

final class TextFile extends File {
  const TextFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.description);
}

final class VideoFile extends File {
  const VideoFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.movie);
}
