abstract class FailureState {
  final String message;

  const FailureState(this.message);
}

class DataNotFound extends FailureState {
  const DataNotFound() : super('Data not found');
}

class CustomFailure extends FailureState {
  const CustomFailure(super.message);
}
