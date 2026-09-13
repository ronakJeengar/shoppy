import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/icons/app_icon.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_typography.dart';

/// Reusable countdown timer for Flash Sales and Limited-Time Promotions.
/// Supports server-time clock-skew compensation and automatic expiry callbacks.
class FlashSaleCountdownTimer extends StatefulWidget {
  final DateTime endTime;
  final DateTime? serverTime;
  final VoidCallback? onExpired;
  final bool isCompact;
  final Color? accentColor;
  final Color? backgroundColor;
  final Color? textColor;

  const FlashSaleCountdownTimer({
    super.key,
    required this.endTime,
    this.serverTime,
    this.onExpired,
    this.isCompact = false,
    this.accentColor,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<FlashSaleCountdownTimer> createState() =>
      _FlashSaleCountdownTimerState();
}

class _FlashSaleCountdownTimerState extends State<FlashSaleCountdownTimer> {
  Timer? _timer;
  late Duration _remaining;
  late Duration _clockOffset;

  @override
  void initState() {
    super.initState();
    _initOffsetAndRemaining();
    _startTimer();
  }

  void _initOffsetAndRemaining() {
    if (widget.serverTime != null) {
      _clockOffset = widget.serverTime!.difference(DateTime.now());
    } else {
      _clockOffset = Duration.zero;
    }
    final adjustedNow = DateTime.now().add(_clockOffset);
    final diff = widget.endTime.difference(adjustedNow);
    _remaining = diff.isNegative ? Duration.zero : diff;
  }

  void _startTimer() {
    _timer?.cancel();
    if (_remaining == Duration.zero) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      final adjustedNow = DateTime.now().add(_clockOffset);
      final diff = widget.endTime.difference(adjustedNow);

      if (diff.isNegative || diff.inSeconds <= 0) {
        timer.cancel();
        setState(() {
          _remaining = Duration.zero;
        });
        widget.onExpired?.call();
      } else {
        setState(() {
          _remaining = diff;
        });
      }
    });
  }

  @override
  void didUpdateWidget(FlashSaleCountdownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.endTime != widget.endTime ||
        oldWidget.serverTime != widget.serverTime) {
      _initOffsetAndRemaining();
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remaining == Duration.zero) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: const BoxDecoration(
          color: AppColors.slate700,
          borderRadius: AppRadius.borderFull,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppIcon(
              AppIcons.clock,
              size: 12,
              color: AppColors.white,
            ),
            const SizedBox(width: 4),
            Text(
              'Sale Ended',
              style: AppTypography.label.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    }

    final hours = _remaining.inHours;
    final minutes = _remaining.inMinutes.remainder(60);
    final seconds = _remaining.inSeconds.remainder(60);

    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');

    if (widget.isCompact) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.slate900.withValues(alpha: 0.85),
          borderRadius: AppRadius.borderFull,
          border: Border.all(
            color: widget.accentColor ?? const Color(0xFFF59E0B),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(
              AppIcons.flash,
              size: 13,
              color: widget.accentColor ?? const Color(0xFFF59E0B),
            ),
            const SizedBox(width: 4),
            Text(
              '$hoursStr:$minutesStr:$secondsStr',
              style: AppTypography.label.copyWith(
                color: widget.textColor ?? AppColors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      );
    }

    // Standard high-emphasis timer with individual digit blocks
    final blockColor = widget.backgroundColor ?? const Color(0xFF1E293B);
    final textStyle = AppTypography.label.copyWith(
      color: widget.textColor ?? AppColors.white,
      fontWeight: FontWeight.w900,
      fontSize: 13,
      letterSpacing: 0.5,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTimeBlock(hoursStr, 'HRS', blockColor, textStyle),
        _buildSeparator(),
        _buildTimeBlock(minutesStr, 'MINS', blockColor, textStyle),
        _buildSeparator(),
        _buildTimeBlock(secondsStr, 'SECS', blockColor, textStyle),
      ],
    );
  }

  Widget _buildTimeBlock(
    String val,
    String label,
    Color bg,
    TextStyle style,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.borderSm,
        border: Border.all(
          color: widget.accentColor ?? const Color(0xFFF59E0B),
          width: 0.8,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(val, style: style),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        ':',
        style: TextStyle(
          color: widget.accentColor ?? const Color(0xFFF59E0B),
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
      ),
    );
  }
}
