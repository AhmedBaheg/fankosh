import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../logic/recording_controller.dart';
import 'audio_waveform_visualizer.dart';
import 'recording_status_chip.dart';
import 'stop_recording_button.dart';

/// Main body layout component for active recording screen matching Figma Frame 6.
/// Enforces a strict 5-second maximum recording limit and tracks actual duration.
class RecordingViewBody extends StatefulWidget {
  const RecordingViewBody({
    super.key,
    this.maxDurationSeconds = 5,
    this.onRecordingComplete,
  });

  final int maxDurationSeconds;
  final ValueChanged<int>? onRecordingComplete;

  @override
  State<RecordingViewBody> createState() => _RecordingViewBodyState();
}

class _RecordingViewBodyState extends State<RecordingViewBody> {
  late final AudioRecordingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AudioRecordingController(
      maxDurationSeconds: widget.maxDurationSeconds,
      onRecordingFinished: (model) {
        if (widget.onRecordingComplete != null) {
          widget.onRecordingComplete!(model.durationSeconds);
        } else {
          if (mounted) {
            Navigator.pushReplacementNamed(
              context,
              Routes.recordingResultView,
              arguments: model,
            );
          }
        }
      },
    )..startRecording();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // 1. Shared App Header Bar (Notifications, Logo, Profile)
        const AppHeaderBar(),
        SizedBox(height: 16.h),

        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24.h),

                // 2. Main Headline Title ("قول اللي في بالك.. سامعينك!")
                Text(
                  l10n.recordingTitleLine1,
                  style: AppTextStyles.displayMedium.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  l10n.recordingTitleLine2,
                  style: AppTextStyles.displayMedium.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

                // 3. Dynamic Recording Status White Pill Chip ("00:05 | جاري التسجيل...")
                ListenableBuilder(
                  listenable: _controller,
                  builder: (context, _) => RecordingStatusChip(
                    elapsedSeconds: _controller.elapsedSeconds,
                  ),
                ),
                SizedBox(height: 48.h),

                // 4. Yellow Audio Waveform Visualizer
                const AudioWaveformVisualizer(
                  isRecording: true,
                ),
                SizedBox(height: 54.h),

                // 5. Coral-Red Stop Button & Max Duration Helper
                StopRecordingButton(
                  onStopPressed: () =>
                      _controller.stopRecording(autoStopped: false),
                  maxDurationSeconds: widget.maxDurationSeconds,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
