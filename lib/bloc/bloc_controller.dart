import 'package:rxdart/rxdart.dart';

class BlocController {
  var _controller = BehaviorSubject.seeded(false);

  Stream<bool> get opened => _controller.stream;

  Sink<bool> get changeOpened => _controller.sink;

  dispose() {
    _controller.close();
  }

  void toggle() {
    _controller.add(!_controller.value);
  }
}
