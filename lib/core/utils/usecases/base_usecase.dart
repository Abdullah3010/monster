/// [BaseUseCase] is an abstract class that defines the base structure of a use case.
abstract class BaseUseCase<Output, Input> {
  /// [call] is the method that will be called to execute the use case.
  Output call(Input input);
}
