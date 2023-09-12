import 'package:ilogger/ilogger.dart';

final class SampleLogger extends ILogger {
  @override
  bool get isDebugEnabled => true;

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
  bool isEnabled(LogLevel level) => true;

  @override
  void debug(message, {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message, level: LogLevel.debug, exception: exception, eventProperties: eventProperties);
  }

  @override
  void error(message, {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message, level: LogLevel.error, exception: exception, eventProperties: eventProperties);
  }

  @override
  void fatal(message, {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message, level: LogLevel.fatal, exception: exception, eventProperties: eventProperties);
  }

  @override
  void info(message, {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message, level: LogLevel.info, exception: exception, eventProperties: eventProperties);
  }

  @override
  void trace(message, {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message, level: LogLevel.trace, exception: exception, eventProperties: eventProperties);
  }

  @override
  void warn(message, {Exception? exception, Map<String, dynamic>? eventProperties}) {
    log(message, level: LogLevel.warn, exception: exception, eventProperties: eventProperties);
  }

  @override
  void log(message, {required LogLevel level, Exception? exception, Map<String, dynamic>? eventProperties}) {
    print('${DateTime.now()} [$level] $message |$exception|$eventProperties');
  }
}

void main() {
  final ILogger logger = SampleLogger();

  logger.info('Running example from `main` at the info level');
  logger.error('Showing a sample error', exception: Exception('An error'));
  logger.trace(
    'Showing event properties at the trace level',
    eventProperties: {
      '1+1': 2,
      'dogsOrCats': 'both',
      'isItTrue': true,
      'extraArr': ['a', 'b', 'c'],
      'extraObj': {
        'fieldA': 0,
        'fieldB': 1,
      }
    },
  );
}
