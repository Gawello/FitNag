import 'package:flutter/material.dart';

import '../../../core/constants/league_constants.dart';

class LeagueBadgeWidget extends StatelessWidget {
  const LeagueBadgeWidget({
    super.key,
    required this.tier,
    this.size = 80,
    this.showName = true,
  });
  final int tier;
  final double size;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    final leagueTier = LeagueConstants.getTier(tier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                leagueTier.color.withAlpha(200),
                leagueTier.color,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: leagueTier.color.withAlpha(80),
                blurRadius: size * 0.2,
                spreadRadius: size * 0.05,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${leagueTier.tier}',
              style: TextStyle(
                fontSize: size * 0.35,
                fontWeight: FontWeight.bold,
                color: _textColorFor(leagueTier.color),
              ),
            ),
          ),
        ),
        if (showName) ...[
          const SizedBox(height: 8),
          Text(
            leagueTier.name,
            style: TextStyle(
              fontSize: size * 0.18,
              fontWeight: FontWeight.bold,
              color: leagueTier.color,
            ),
          ),
        ],
      ],
    );
  }

  Color _textColorFor(Color bg) {
    final brightness = ThemeData.estimateBrightnessForColor(bg);
    return brightness == Brightness.dark ? Colors.white : Colors.black87;
  }
}
