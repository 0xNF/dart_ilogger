/// Provides an interface to execute Functions without surfacing any exceptions raised for that function.
abstract class ISuppress {
  /// Runs the provided action. If the action throws, the exception is logged at `Error` level. The exception is not propagated outside of this method.
  void swallow(Function() action);

  /// Returns a future that completes when a specified function completes. If the function does not run to completion, an exception is logged at `Error` level.
  /// The returned future always runs to completion.
  Future<void> swallowAsync(Function() action);

  /// Runs the provided function and returns its result.
  /// If an exception is thrown, it is logged at `Error` level.
  /// The exception is not propagated outside of this method;
  /// A fallback value is returned instead.
  T? swallowResult<T>(T? Function() action, [T? fallbackValue]);

  /// Runs the provided async function and returns its result. If the task does not run to completion, an exception is logged at `Error` level.
  /// The exception is not propagated outside of this method; a fallback value is returned instead.
  Future<T?> swallowResultAsync<T>(
      Future<T?> Function() action, T? fallbackValue);
}
