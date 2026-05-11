import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

const _appVersion = '1.0.0';
const _copyrightHolder = 'Gaweł Banasik';
const _copyrightYear = '2026';
const _exerciseImagesUrl =
    'https://github.com/yuhonas/free-exercise-db';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _AppIdentityCard(textTheme: textTheme),
          const SizedBox(height: 12),
          _SectionHeader(text: 'Credits & attributions'),
          const SizedBox(height: 8),
          _AttributionCard(
            icon: Icons.image_outlined,
            title: 'Exercise demonstration images',
            body:
                'Loaded at runtime from the free-exercise-db open-source '
                'dataset (yuhonas/free-exercise-db). Dedicated to the '
                'public domain under The Unlicense.',
            sourceUrl: _exerciseImagesUrl,
          ),
          const SizedBox(height: 8),
          _AttributionCard(
            icon: Icons.music_note_outlined,
            title: 'Metronome sound assets',
            body:
                'The six tick / phase WAV files in assets/sounds/ were '
                'generated procedurally with FFmpeg by the project authors '
                '(short synthesized tones, not third-party recordings) '
                'and dedicated to the public domain.',
          ),
          const SizedBox(height: 8),
          _AttributionCard(
            icon: Icons.style_outlined,
            title: 'Icon libraries',
            body:
                'Material Icons by Google (Apache License 2.0). '
                'Cupertino Icons (MIT).',
          ),
          const SizedBox(height: 8),
          _AttributionCard(
            icon: Icons.code_outlined,
            title: 'Open-source packages',
            body:
                'FitNag is built on Flutter and uses Riverpod, Drift, '
                'go_router, flutter_local_notifications, audioplayers, '
                'fl_chart, table_calendar, confetti, and other '
                'open-source packages from pub.dev. Tap below for the '
                'full per-package license list.',
            trailing: TextButton.icon(
              onPressed: () => showLicensePage(
                context: context,
                applicationName: 'FitNag',
                applicationVersion: _appVersion,
                applicationLegalese:
                    '© $_copyrightYear $_copyrightHolder. All rights reserved.',
              ),
              icon: const Icon(Icons.list_alt, size: 18),
              label: const Text('View licenses'),
            ),
          ),
          const SizedBox(height: 16),
          _SectionHeader(text: 'Legal'),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '© $_copyrightYear $_copyrightHolder. All rights reserved.',
                    style: textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'FitNag is proprietary software. Third-party components '
                    'are used under their respective open-source licenses '
                    '(see "View licenses" above).',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            color: AppTheme.primaryOrange.withAlpha(20),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.health_and_safety,
                          size: 20, color: AppTheme.primaryOrange),
                      const SizedBox(width: 8),
                      Text('Health disclaimer',
                          style: textTheme.titleSmall?.copyWith(
                            color: AppTheme.primaryOrange,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'FitNag is a fitness tracking tool, not medical advice. '
                    'Consult a qualified healthcare professional before '
                    'starting any exercise program, especially if you have '
                    'pre-existing health conditions. Stop exercising if you '
                    'feel pain, dizziness, or discomfort. You use this app '
                    'at your own risk.',
                    style: textTheme.bodySmall?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.privacy_tip_outlined, size: 20),
                      const SizedBox(width: 8),
                      Text('Privacy',
                          style: textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'FitNag stores all your data locally on your device. '
                    'No personal data is collected, transmitted, or shared '
                    'with any server or third party. Exercise images are '
                    'loaded over standard HTTPS from a public GitHub '
                    'repository — these requests do not include any '
                    'identifying information.',
                    style: textTheme.bodySmall?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'FitNag v$_appVersion',
            textAlign: TextAlign.center,
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _AppIdentityCard extends StatelessWidget {
  const _AppIdentityCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF8C55), Color(0xFFFF6B35)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.fitness_center,
                  size: 36, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FitNag',
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text('Version $_appVersion', style: textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text(
                    'Your persistently motivating fitness companion.',
                    style: textTheme.bodySmall
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 8),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              letterSpacing: 1.2,
              color: AppTheme.primaryOrange,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _AttributionCard extends StatelessWidget {
  const _AttributionCard({
    required this.icon,
    required this.title,
    required this.body,
    this.sourceUrl,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String body;
  final String? sourceUrl;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(body, style: textTheme.bodySmall?.copyWith(height: 1.5)),
            if (sourceUrl != null) ...[
              const SizedBox(height: 6),
              SelectableText(
                sourceUrl!,
                style: textTheme.bodySmall?.copyWith(
                  color: AppTheme.primaryOrange,
                  fontFamily: 'monospace',
                ),
              ),
            ],
            if (trailing != null) ...[
              const SizedBox(height: 4),
              Align(alignment: Alignment.centerLeft, child: trailing!),
            ],
          ],
        ),
      ),
    );
  }
}
