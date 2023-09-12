Contains simple interfaces for constructing Loggers, modled roughly on NLog.

The purpose of this package is _not_ to be a solution for your logging needs. It is meant only to supply common interfaces to code against. You should be able to pass around `ILogger`s from one project to another project, if they follow this interface.

# ILogger
An `ILogger` interface looks like this. It contains a number of default implementations:

```dart
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
```

You should be thinking of always implementing `log`. The other methods are implementable at your covenience.


# Usage

Although this package is not intended for use as an actual logging solution, it does incude two _extremely_ simple logger implementations to get you up and running:

* BasicConsoleLogger
* BasicNullLogger

The `BasicConsoleLogger` contains simple implementations of most methods, and will simply print an unsophisticated message to the console via `print`:

```dart
void printLog() {
    final simpleLogger = BasicConsoleLogger(name: 'mySimpleLogger');
    simpleLogger.info('A simple message'); // [2023-09-12T16:47:32+5:00] INFO A Simple message ||
}
```

The `BasicNullLogger` will drop all messages and not print anything
```dart
void printLog() {
    final simpleLogger = BasicConsoleLogger(name: 'myNullLogger');
    simpleLogger.info('A simple message'); // nothing will be printed at all, this is a NOP

}
```

Instead of using these loggers, you are encouraged to built your own more sophisticated logger with these interface contracts. For a somehwat more advanced example, see the [DLog Basic](https://github.com/0xnf/dlog_basic) repository, which contains a working, if extremely simplified, version of NLog for Dart.