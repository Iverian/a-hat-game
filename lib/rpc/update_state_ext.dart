import "../generated/proto/state.pb.dart";

extension UpdateStateExt on UpdateState {
  bool isFinal() => whichAction() == UpdateState_Action.closed;
}
