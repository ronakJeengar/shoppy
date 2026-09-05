import 'package:flutter/material.dart';

/// Elevation & shadow tokens for smooth modern cards and floating chrome.
class AppShadows {
  // Soft card shadow
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0A0F172A),
      blurRadius: 8,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x050F172A),
      blurRadius: 1,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  // Elevated / Hover shadow
  static const List<BoxShadow> elevated = [
    BoxShadow(
      color: Color(0x120F172A),
      blurRadius: 16,
      offset: Offset(0, 6),
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color(0x080F172A),
      blurRadius: 6,
      offset: Offset(0, 2),
      spreadRadius: -1,
    ),
  ];

  // Sticky bottom bar top-edge shadow
  static const List<BoxShadow> bottomBar = [
    BoxShadow(
      color: Color(0x0A0F172A),
      blurRadius: 16,
      offset: Offset(0, -4),
      spreadRadius: 0,
    ),
  ];

  // Floating pill / action button
  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color(0x204F46E5),
      blurRadius: 18,
      offset: Offset(0, 8),
      spreadRadius: -2,
    ),
  ];
}
