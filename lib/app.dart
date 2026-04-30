import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'features/onboarding/providers/onboarding_provider.dart';

class FitNagApp extends ConsumerWidget {
  const FitNagApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingComplete = ref.watch(onboardingCompleteProvider);

    return onboardingComplete.when(
      data: (complete) {
        final router = createRouter(onboardingComplete: complete);
        return MaterialApp.router(
          title: 'FitNag',
          theme: AppTheme.darkTheme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
      loading: () => MaterialApp(
        home: Scaffold(
          backgroundColor: AppTheme.darkCharcoal,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      error: (e, _) => MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
