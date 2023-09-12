import 'package:ilogger/src/isuppress.dart';
import 'package:ilogger/src/log_level.dart';

abstract class ILogger implements ISuppress {
  /// Name of this logger
  String get name;

  /// Whether log events at the [LogLevel.trace] level will be logged
  bool get isTraceEnabled;

  /// Whether log events at the [LogLevel.debug] level will be logged
  bool get isDebugEnabled;

  /// Whether log events at the [LogLevel.info] level will be logged
  bool get isInfoEnabled;

  /// Whether log events at the [LogLevel.warn] level will be logged
  bool get isWarnEnabled;

  /// Whether log events at the [LogLevel.error] level will be logged
  bool get isErrorEnabled;

  /// Whether log events at the [LogLevel.fatal] level will be logged
  bool get isFatalEnabled;

  /// Checks whether this logger is enabled for a given [LogLevel
  bool isEnabled(LogLevel level);

  /// Writes a diagnostic message at the given [LogLevel] level
  void log(dynamic message,
      {required LogLevel level,
      Exception? exception,
      Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.trace] levels
  void trace(dynamic message,
      {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.debug] level
  void debug(dynamic message,
      {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.info] level
  void info(dynamic message,
      {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.warn] level
  void warn(dynamic message,
      {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.error] level
  void error(dynamic message,
      {Exception? exception, Map<String, dynamic>? eventProperties});

  /// Writes a diagnostic message at the [LogLevel.fatal] level
  void fatal(dynamic message,
      {Exception? exception, Map<String, dynamic>? eventProperties});

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
  Future<T?> swallowResultAsync<T>(
      Future<T?> Function() action, T? fallbackValue) async {
    return null;
  }
}

final class BasicConsoleLogger extends ILogger {
  BasicConsoleLogger({String? name}) : _name = name ?? 'BasicLogger';

  @override
  String get name => _name;
  final String _name;

  @override
  void debug(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message,
        level: LogLevel.debug,
        exception: exception,
        eventProperties: eventProperties);
  }

  @override
  void error(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message,
        level: LogLevel.error,
        exception: exception,
        eventProperties: eventProperties);
  }

  @override
  void fatal(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message,
        level: LogLevel.fatal,
        exception: exception,
        eventProperties: eventProperties);
  }

  @override
  void info(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message,
        level: LogLevel.info,
        exception: exception,
        eventProperties: eventProperties);
  }

  @override
  bool get isDebugEnabled => true;

  @override
  bool isEnabled(LogLevel level) => true;

  @override
  bool get isErrorEnabled => true;

  @override
  bool get isFatalEnabled => true;
  @override
  bool get isInfoEnabled => true;
  @override
  bool get isTraceEnabled => true;
  @override
  bool get isWarnEnabled => true;

  @override
  void log(message,
      {required LogLevel level,
      Exception? exception,
      Map<String, dynamic>? eventProperties}) {
    print('${DateTime.now()} [$level] $message |$exception|$eventProperties');
  }

  @override
  void trace(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message,
        level: LogLevel.trace,
        exception: exception,
        eventProperties: eventProperties);
  }

  @override
  void warn(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message,
        level: LogLevel.warn,
        exception: exception,
        eventProperties: eventProperties);
  }
}

final class BasicNullLogger extends ILogger {
  BasicNullLogger({String? name}) : _name = name ?? 'BasicNullLogger';

  @override
  String get name => _name;
  final String _name;

  @override
  void debug(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {}

  @override
  void error(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {}

  @override
  void fatal(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {}

  @override
  void info(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {}

  @override
  bool get isDebugEnabled => true;

  @override
  bool isEnabled(LogLevel level) => true;

  @override
  bool get isErrorEnabled => true;

  @override
  bool get isFatalEnabled => true;
  @override
  bool get isInfoEnabled => true;
  @override
  bool get isTraceEnabled => true;
  @override
  bool get isWarnEnabled => true;

  @override
  void log(message,
      {required LogLevel level,
      Exception? exception,
      Map<String, dynamic>? eventProperties}) {}

  @override
  void trace(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {}

  @override
  void warn(message,
      {Exception? exception, Map<String, dynamic>? eventProperties}) {}
}
