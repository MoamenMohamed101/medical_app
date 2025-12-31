import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_app/presentation/resources/color_manager.dart';
import 'package:medical_app/presentation/resources/font_manager.dart';
import 'package:medical_app/presentation/resources/strings_manager.dart';
import 'package:medical_app/presentation/resources/styles_manager.dart';
import 'package:medical_app/presentation/resources/values_manager.dart';
import 'package:speech_to_text/speech_recognition_error.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

// voice_search_dialog.dart
class VoiceSearchDialog extends StatefulWidget {
  const VoiceSearchDialog({super.key});

  @override
  State<VoiceSearchDialog> createState() => _VoiceSearchDialogState();
}

class _VoiceSearchDialogState extends State<VoiceSearchDialog> {
  late final SpeechRecognitionService _speechService;
  final VoiceSearchState _voiceState = VoiceSearchState();

  @override
  void initState() {
    super.initState();
    _speechService = SpeechRecognitionService(
      onStateChanged: _handleSpeechStateChange,
      onError: _handleSpeechError,
      onResult: _handleSpeechResult,
    );
    _initializeSpeech();
  }

  @override
  void dispose() {
    _speechService.dispose();
    super.dispose();
  }

  Future<void> _initializeSpeech() async {
    final permissionGranted = await _requestMicrophonePermission();
    if (!permissionGranted) return;

    final initialized = await _speechService.initialize();
    if (initialized) {
      _speechService.startListening();
    } else {
      _updateState(text: Strings.speechRecognitionNotAvailable);
    }
  }

  Future<bool> _requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      _updateState(text: Strings.microphonePermissionDenied);
      return false;
    }
    return true;
  }

  void _handleSpeechStateChange(bool isListening) {
    _updateState(isListening: isListening);
  }

  void _handleSpeechError(String errorMessage) {
    _updateState(isListening: false, text: "Error: $errorMessage");
  }

  void _handleSpeechResult(String recognizedText, double confidence) {
    _updateState(text: recognizedText, confidence: confidence);
  }

  void _updateState({bool? isListening, String? text, double? confidence}) {
    if (!mounted) return;

    setState(() {
      if (isListening != null) _voiceState.isListening = isListening;
      if (text != null) _voiceState.text = text;
      if (confidence != null) _voiceState.confidence = confidence;
    });
  }

  void _toggleListening() {
    if (_voiceState.isListening) {
      _stopListeningAndClose();
    } else {
      _speechService.startListening();
    }
  }

  void _stopListeningAndClose() {
    _speechService.stopListening();
    Future.delayed(const Duration(milliseconds: 500), _closeDialogWithResult);
  }

  void _closeDialogWithResult() {
    final result = _voiceState.hasValidResult ? _voiceState.text : null;
    context.pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManager.whiteColor,
      insetPadding: EdgeInsets.all(AppPadding.p20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s24.r),
      ),
      child: VoiceSearchDialogContent(
        voiceState: _voiceState,
        onClose: () => context.pop(),
        onToggleListening: _toggleListening,
      ),
    );
  }
}

// ============================================================================
// VOICE SEARCH STATE
// ============================================================================

class VoiceSearchState {
  bool isListening = false;
  String text = Strings.trySaying;
  double confidence = 1.0;

  bool get hasValidResult {
    return text != Strings.trySaying &&
        text.isNotEmpty &&
        !text.startsWith("Error") &&
        !text.startsWith("Microphone");
  }
}

// ============================================================================
// SPEECH RECOGNITION SERVICE
// ============================================================================

class SpeechRecognitionService {
  final void Function(bool isListening) onStateChanged;
  final void Function(String errorMessage) onError;
  final void Function(String text, double confidence) onResult;

  late final stt.SpeechToText _speech;

  SpeechRecognitionService({
    required this.onStateChanged,
    required this.onError,
    required this.onResult,
  }) {
    _speech = stt.SpeechToText();
  }

  Future<bool> initialize() async {
    return await _speech.initialize(
      onStatus: _handleStatusChange,
      onError: _handleError,
    );
  }

  void startListening() async {
    final available = await _speech.initialize();
    if (!available) return;

    onStateChanged(true);
    _speech.listen(onResult: _handleResult);
  }

  void stopListening() {
    onStateChanged(false);
    _speech.stop();
  }

  void dispose() {
    _speech.stop();
  }

  void _handleStatusChange(String status) {
    if (status == 'notListening') {
      onStateChanged(false);
    }
  }

  void _handleError(stt.SpeechRecognitionError error) {
    onError(error.errorMsg);
  }

  void _handleResult(stt.SpeechRecognitionResult result) {
    final confidence = result.hasConfidenceRating && result.confidence > 0
        ? result.confidence
        : 1.0;

    onResult(result.recognizedWords, confidence);
  }
}

// ============================================================================
// VOICE SEARCH DIALOG CONTENT
// ============================================================================

class VoiceSearchDialogContent extends StatelessWidget {
  final VoiceSearchState voiceState;
  final VoidCallback onClose;
  final VoidCallback onToggleListening;

  const VoiceSearchDialogContent({
    super.key,
    required this.voiceState,
    required this.onClose,
    required this.onToggleListening,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: double.infinity,
      padding: EdgeInsets.all(AppPadding.p20.w),
      child: Column(
        children: [
          _CloseButton(onClose: onClose),
          const Spacer(),
          _RecognizedText(
            text: voiceState.text,
            isListening: voiceState.isListening,
          ),
          Gap(AppSize.s10.h),
          _ConfidenceIndicator(
            confidence: voiceState.confidence,
            isVisible:
                voiceState.isListening && voiceState.text != Strings.trySaying,
          ),
          Gap(AppSize.s40.h),
          _MicrophoneButton(
            isListening: voiceState.isListening,
            onTap: onToggleListening,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

// ============================================================================
// UI COMPONENTS
// ============================================================================

class _CloseButton extends StatelessWidget {
  final VoidCallback onClose;

  const _CloseButton({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundColor: ColorManager.lightGrey.withValues(alpha: 0.3),
        radius: AppSize.s20.r,
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: ColorManager.blackColor,
            size: 20,
          ),
          onPressed: onClose,
        ),
      ),
    );
  }
}

class _RecognizedText extends StatelessWidget {
  final String text;
  final bool isListening;

  const _RecognizedText({required this.text, required this.isListening});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: getMediumTextStyle(
        color: isListening ? ColorManager.primaryColor : ColorManager.textColor,
        fontSize: FontSizeManager.s24.sp,
      ),
    );
  }
}

class _ConfidenceIndicator extends StatelessWidget {
  final double confidence;
  final bool isVisible;

  const _ConfidenceIndicator({
    required this.confidence,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Text(
      "${(confidence * 100).toStringAsFixed(1)}% confidence",
      style: getRegularTextStyle(
        color: ColorManager.greyColor,
        fontSize: FontSizeManager.s12.sp,
      ),
    );
  }
}

class _MicrophoneButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onTap;

  const _MicrophoneButton({required this.isListening, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppPadding.p30.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _outerCircleColor,
        ),
        child: Container(
          padding: EdgeInsets.all(AppPadding.p20.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _innerCircleColor,
          ),
          child: Icon(
            isListening ? Icons.mic : Icons.mic_none,
            color: ColorManager.whiteColor,
            size: AppSize.s40.w,
          ),
        ),
      ),
    );
  }

  Color get _outerCircleColor {
    return isListening
        ? ColorManager.primaryColor.withValues(alpha: 0.2)
        : ColorManager.lightGrey.withValues(alpha: 0.2);
  }

  Color get _innerCircleColor {
    return isListening ? ColorManager.primaryColor : ColorManager.greyColor;
  }
}

/*

Here's a simple summary of how the refactored code works:
The 4 Main Parts
1. VoiceSearchDialog (The Boss)

Creates and manages everything when the dialog opens
Connects all the pieces together
Decides what happens when things change

2. SpeechRecognitionService (The Worker)

Does the actual voice listening work
Talks to your phone's microphone
Tells the boss when it hears something

3. VoiceSearchState (The Memory)

Remembers important information:

Is the microphone on or off?
What words were heard?
How confident is the recognition?



4. VoiceSearchDialogContent (The Display)

Shows everything on screen
Made of small parts: close button, text display, mic button

How They Work Together (Simple Flow)

User opens dialog → Boss creates Worker and Memory
User taps mic button → Boss tells Worker to start listening
Worker hears "Hello" → Worker tells Boss "I heard 'Hello'"
Boss updates Memory → Memory now stores "Hello"
Memory changes → Display shows "Hello" on screen
User taps mic again → Boss tells Worker to stop, then closes dialog

Why This Is Better

Easy to understand: Each part does ONE thing
Easy to fix: Problem with microphone? Only fix the Worker part
Easy to change: Want different colors? Only change the Display part
Easy to test: Test each part separately
Easy to grow: Adding features won't break existing code

Think of it like a restaurant: the Boss (manager) coordinates, the Worker (chef) cooks, 
the Memory (order ticket) tracks what's needed, and the Display (waiter) shows customers their food!

*/
