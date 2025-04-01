// File: lib/view/widgets/typing_indicator.dart
import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  final bool isTyping = true;
  @override
  Widget build(BuildContext context) {
    return !isTyping
        ? const SizedBox.shrink()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFF5A54D1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const _TypingDots(),
              ],
            ),
          );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots();

  @override
  _TypingDotsState createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      3,
      (index) => AnimationController(
        duration: Duration(milliseconds: 150 + (index * 100)),
        vsync: this,
      ),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0, end: 6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    for (var controller in _controllers) {
      controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4),
              ),
              transform:
                  Matrix4.translationValues(0, -_animations[index].value, 0),
            );
          },
        );
      }),
    );
  }
}
