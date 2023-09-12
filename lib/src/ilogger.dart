import 'package:ilogger/src/isuppress.dart';
import 'package:ilogger/src/log_level.dart';

abstract class ILogger implements ISuppress {
  bool get isTraceEnabled;
  bool get isDebugEnabled;
  bool get isInfoEnabled;
  bool get isWarnEnabled;
  bool get isErrorEnabled;
  bool get isFatalEnabled;

  /// Checks whether this logger is enabled for a given [LogLevel]
  bool isEnabled(LogLevel level);

  /// Writes a diagnostic message at the given [LogLevel] level
  void log(dynamic message, {required LogLevel level, Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.trace] levels
  void trace(dynamic message, {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.debug] level
  void debug(dynamic message, {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.info] level
  void info(dynamic message, {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.warn] level
  void warn(dynamic message, {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.error] level
  void error(dynamic message, {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.fatal] level
  void fatal(dynamic message, {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Runs action.
  ///
  /// If the action throws, the exception is logged at Error level. Exception is not propagated outside of this method.
  @override
  void swallow(Function action) {}

  /// Runs the provided function and returns its result.
  ///
  /// If exception is thrown, it is logged at Error level.  Exception is not propagated outside of this method.
  ///
  /// Fallback value is returned instead.
  @override
  T? swallowResult<T>(T? Function() action, [T? fallbackValue]) {
    return null;
  }

  /// Runs async action.
  ///
  /// If the action throws, the exception is logged at Error level. Exception is not propagated outside of this method.
  @override
  Future<void> swallowAsync(Function action) async {
    return;
  }

  /// Runs the provided async function and returns its result.
  ///
  /// If exception is thrown, it is logged at Error level.  Exception is not propagated outside of this method.
  ///
  /// Fallback value is returned instead.
  @override
  Future<T?> swallowResultAsync<T>(Future<T?> Function() action, T? fallbackValue) async {
    return null;
  }
}
