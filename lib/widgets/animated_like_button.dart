import 'package:flutter/material.dart';

class AnimatedLikeButton extends StatefulWidget {
  const AnimatedLikeButton({super.key});

  @override
  State<AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
}


class _AnimatedLikeButtonState extends State<AnimatedLikeButton> {
  bool _isLiked = false;
  int _likeCount = 128;
  double _scale = 1.0;

  void _togglelike() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount += _isLiked ? 1 : -1;
      _scale = _isLiked ? 1.35 : 1.0;
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      if (!mounted) return;
      setState(() {
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 150),
          child: IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : Colors.white,
              size: 28,
            ),
            onPressed: _togglelike,
          ),
         ),
         const SizedBox(width: 8),
         Text(
          '$_likeCount',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
         ),
      ],
    );
  }
}