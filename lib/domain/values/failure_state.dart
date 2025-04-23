abstract class FailureState {
  final String message;

  const FailureState(this.message);
}

class CustomFailure extends FailureState {
  const CustomFailure(super.message);
}
