/// Centralized responsive layout breakpoints for Shoppy.
class AppBreakpoints {
  static const double mobile = 480.0;
  static const double tablet = 768.0;
  static const double desktop = 1024.0;
  static const double wide = 1280.0;

  static bool isMobile(double width) => width < tablet;
  static bool isTablet(double width) => width >= tablet && width < desktop;
  static bool isDesktop(double width) => width >= desktop;
  static bool isWide(double width) => width >= wide;
}
