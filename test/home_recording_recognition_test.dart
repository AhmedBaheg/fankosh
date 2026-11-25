import 'dart:io';

import 'package:fankosh/core/routing/app_router.dart';
import 'package:fankosh/core/routing/routes.dart';
import 'package:fankosh/core/utils/assets.dart';
import 'package:fankosh/core/utils/audio_helper.dart';
import 'package:fankosh/features/recognition/logic/recognition_controller.dart';
import 'package:fankosh/features/recognition/presentation/widgets/compact_audio_preview_card.dart';
import 'package:fankosh/features/recognition/presentation/widgets/recognition_processing_view_body.dart';
import 'package:fankosh/features/recording/data/models/recorded_audio_model.dart';
import 'package:fankosh/features/recording/logic/recording_controller.dart';
import 'package:fankosh/features/recording/presentation/widgets/recording_view_body.dart';
import 'package:fankosh/features/recording/presentation/widgets/stop_recording_button.dart';
import 'package:fankosh/features/recording_result/presentation/widgets/audio_player_card.dart';
import 'package:fankosh/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _createTestWidget(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, _) => MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: const Locale('ar'),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  group('1. Asset Verification Tests', () {
    test('All AppAssets constants point to real, existing files', () {
      final assets = [
        AppAssets.splashBackground,
        AppAssets.appLogo,
        AppAssets.homeBg,
        AppAssets.micImage,
        AppAssets.onboard1,
        AppAssets.onboard2,
        AppAssets.trialsFinished,
        AppAssets.microphone,
        AppAssets.playIcon,
        AppAssets.pauseIcon,
        AppAssets.deleteIcon,
        AppAssets.uploadAudioIcon,
        AppAssets.recordingIcon,
        AppAssets.sparklesIcon,
        AppAssets.stopRecordingIcon,
        AppAssets.recordAgainIcon,
        AppAssets.timerIcon,
        AppAssets.arrowBackIcon,
        AppAssets.icBundles,
        AppAssets.chevronDownIcon,
        AppAssets.eyeIcon,
        AppAssets.eyeOffIcon,
        AppAssets.globeIcon,
        AppAssets.icHome,
        AppAssets.icLeft,
        AppAssets.lockIcon,
        AppAssets.loginIcon,
        AppAssets.notificationIcon,
        AppAssets.userCircleIcon,
        AppAssets.starIcon,
        AppAssets.icTrails,
        AppAssets.userIcon,
        AppAssets.icUserNavBar,
        AppAssets.icMicPermission,
        AppAssets.icAllow,
        AppAssets.micSymbolIcon,
        AppAssets.documentUploadIcon,
        AppAssets.searchMagnifierIcon,
        AppAssets.shareBadgeIcon,
        AppAssets.shareNodesIcon,
        AppAssets.benefitLaughIcon,
        AppAssets.benefitLightningIcon,
        AppAssets.benefitClapperIcon,
      ];

      for (final asset in assets) {
        expect(File(asset).existsSync(), isTrue, reason: 'Asset missing: $asset');
      }
    });
  });

  group('2. AudioHelper & Controllers Unit Tests', () {
    test('AudioHelper formats duration correctly', () {
      expect(AudioHelper.formatDuration(0), equals('00:00'));
      expect(AudioHelper.formatDuration(3), equals('00:03'));
      expect(AudioHelper.formatDuration(5), equals('00:05'));
      expect(AudioHelper.formatDuration(22), equals('00:22'));
      expect(AudioHelper.formatDuration(65), equals('01:05'));
    });

    test('AudioHelper calculates active bars accurately', () {
      expect(AudioHelper.calculateActiveBars(currentPosition: 0, totalDuration: 5, totalBars: 20), equals(0));
      expect(AudioHelper.calculateActiveBars(currentPosition: 2, totalDuration: 4, totalBars: 20), equals(10));
      expect(AudioHelper.calculateActiveBars(currentPosition: 5, totalDuration: 5, totalBars: 20), equals(20));
    });

    test('AudioPlaybackController plays, advances, pauses, and stops', () {
      final controller = AudioPlaybackController(totalDurationSeconds: 5);
      expect(controller.isPlaying, isFalse);
      expect(controller.currentPosition, equals(0));

      controller.play();
      expect(controller.isPlaying, isTrue);

      controller.pause();
      expect(controller.isPlaying, isFalse);

      controller.stop(reset: true);
      expect(controller.currentPosition, equals(0));
      controller.dispose();
    });

    test('AudioRecordingController enforces 5-second maximum', () async {
      final controller = AudioRecordingController(maxDurationSeconds: 5);
      await controller.startRecording();
      expect(controller.isRecording, isTrue);

      final model = await controller.stopRecording(autoStopped: true);
      expect(model?.durationSeconds, equals(5));
      expect(controller.isRecording, isFalse);
      controller.dispose();
    });

    test('RecognitionController processes request and updates status', () async {
      final controller = RecognitionController(userRecordingDuration: 4);
      expect(controller.status, equals(RecognitionStatus.processing));

      await controller.processRequest();
      expect(controller.status, equals(RecognitionStatus.success));
      expect(controller.result?.userRecordingDuration, equals(4));
      expect(controller.result?.responseAudioDuration, equals(22));
      controller.dispose();
    });
  });

  group('3. Recording Duration & Maximum Limit Widget Tests', () {
    testWidgets('Recording tracks duration and stops manually at 3 seconds', (tester) async {
      int? recordedDuration;

      await tester.pumpWidget(_createTestWidget(
        RecordingViewBody(
          maxDurationSeconds: 5,
          onRecordingComplete: (duration) {
            recordedDuration = duration;
          },
        ),
      ));

      // Advance by 3 seconds
      await tester.pump(const Duration(seconds: 3));

      // Tap stop button inside StopRecordingButton
      final stopButton = find.descendant(
        of: find.byType(StopRecordingButton),
        matching: find.byType(GestureDetector),
      );
      await tester.tap(stopButton);
      await tester.pump();

      expect(recordedDuration, equals(3));
    });

    testWidgets('Recording tracks duration and stops manually at 4 seconds', (tester) async {
      int? recordedDuration;

      await tester.pumpWidget(_createTestWidget(
        RecordingViewBody(
          maxDurationSeconds: 5,
          onRecordingComplete: (duration) {
            recordedDuration = duration;
          },
        ),
      ));

      // Advance by 4 seconds
      await tester.pump(const Duration(seconds: 4));

      // Tap stop button inside StopRecordingButton
      final stopButton = find.descendant(
        of: find.byType(StopRecordingButton),
        matching: find.byType(GestureDetector),
      );
      await tester.tap(stopButton);
      await tester.pump();

      expect(recordedDuration, equals(4));
    });

    testWidgets('Recording automatically stops at exactly 5 seconds (maximum limit)', (tester) async {
      int? recordedDuration;

      await tester.pumpWidget(_createTestWidget(
        RecordingViewBody(
          maxDurationSeconds: 5,
          onRecordingComplete: (duration) {
            recordedDuration = duration;
          },
        ),
      ));

      // Advance by 5 seconds (reaches max limit)
      await tester.pump(const Duration(seconds: 5));

      expect(recordedDuration, equals(5));
    });
  });

  group('4. Audio Preview & Playback Tests', () {
    testWidgets('AudioPlayerCard displays actual recorded duration 00:01', (tester) async {
      await tester.pumpWidget(_createTestWidget(
        const AudioPlayerCard(
          totalDurationSeconds: 1,
          initialPositionSeconds: 0,
        ),
      ));

      expect(find.text('00:01'), findsOneWidget);
      expect(find.text('00:00'), findsOneWidget);
      expect(find.text('00:05'), findsNothing);
    });

    testWidgets('AudioPlayerCard displays actual recorded duration 00:02', (tester) async {
      await tester.pumpWidget(_createTestWidget(
        const AudioPlayerCard(
          totalDurationSeconds: 2,
          initialPositionSeconds: 0,
        ),
      ));

      expect(find.text('00:02'), findsOneWidget);
      expect(find.text('00:00'), findsOneWidget);
      expect(find.text('00:05'), findsNothing);
    });

    testWidgets('AudioPlayerCard displays actual recorded duration 00:03', (tester) async {
      await tester.pumpWidget(_createTestWidget(
        const AudioPlayerCard(
          totalDurationSeconds: 3,
          initialPositionSeconds: 0,
        ),
      ));

      expect(find.text('00:03'), findsOneWidget);
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets('AudioPlayerCard displays actual recorded duration 00:05', (tester) async {
      await tester.pumpWidget(_createTestWidget(
        const AudioPlayerCard(
          totalDurationSeconds: 5,
          initialPositionSeconds: 0,
        ),
      ));

      expect(find.text('00:05'), findsOneWidget);
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets('AudioPlayerCard play/pause toggles and resets when finished', (tester) async {
      bool? playingState;

      await tester.pumpWidget(_createTestWidget(
        AudioPlayerCard(
          totalDurationSeconds: 2,
          initialPositionSeconds: 0,
          onPlayStateChanged: (isPlaying) {
            playingState = isPlaying;
          },
        ),
      ));

      // Tap play
      final playButton = find.byType(GestureDetector).first;
      await tester.tap(playButton);
      await tester.pump();

      expect(playingState, isTrue);

      // Advance 1 second
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('00:01'), findsOneWidget);

      // Advance another second to complete
      await tester.pump(const Duration(seconds: 1));
      // Upon completion, position resets to 00:00 and playback stops
      expect(playingState, isFalse);
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets('CompactAudioPreviewCard displays actual duration and toggles play/pause', (tester) async {
      bool? playToggled;

      await tester.pumpWidget(_createTestWidget(
        CompactAudioPreviewCard(
          durationSeconds: 3,
          onPlayToggle: (isPlaying) {
            playToggled = isPlaying;
          },
        ),
      ));

      expect(find.text('00:03'), findsOneWidget);

      final playButton = find.descendant(
        of: find.byType(CompactAudioPreviewCard),
        matching: find.byType(GestureDetector),
      );
      await tester.tap(playButton);
      await tester.pump();

      expect(playToggled, isTrue);
    });
  });

  group('5. Recognition Lifecycle & Navigation Tests', () {
    testWidgets('Recognition screen remains open while processing without auto-popping', (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(_createTestWidget(
        const RecognitionProcessingViewBody(
          recordedDurationSeconds: 4,
        ),
      ));

      // Initial state is processing
      expect(find.text('00:04'), findsOneWidget);
      expect(find.byType(CompactAudioPreviewCard), findsOneWidget);

      // Advance by 1 second - still in processing, does NOT pop or exit
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(RecognitionProcessingViewBody), findsOneWidget);

      // Complete async simulation (2500ms total)
      await tester.pump(const Duration(milliseconds: 1600));

      // Successfully updates in place with recognized response
      expect(find.byType(RecognitionProcessingViewBody), findsOneWidget);
    });

    testWidgets('RecordingResultView receives RecordedAudioModel via AppRouter and displays dynamic duration', (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, _) => MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          locale: const Locale('ar'),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: Routes.recordingResultView,
          onGenerateInitialRoutes: (initialRoute) {
            return [
              AppRouter.generateRoute(RouteSettings(
                name: Routes.recordingResultView,
                arguments: RecordedAudioModel(
                  id: 'rec_dynamic_test',
                  durationSeconds: 2,
                  recordedAt: DateTime.now(),
                ),
              ))!,
            ];
          },
        ),
      ));

      await tester.pumpAndSettle();
      expect(find.text('00:02'), findsOneWidget);
      expect(find.text('00:05'), findsNothing);
    });
  });
}
