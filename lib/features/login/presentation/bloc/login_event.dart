abstract class LoginEvent {}

class GetUser extends LoginEvent {}

class UpdateVisibility extends LoginEvent {
  final bool isVisible;

  UpdateVisibility({this.isVisible = false});
}
class ResetData extends LoginEvent {}
