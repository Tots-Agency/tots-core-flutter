typedef EventCallback = dynamic Function(String);

class TotsGlobalEvent {

  List<EventCallback> callbacks = [];

  void addListener(EventCallback callback){
    callbacks.add(callback);
  }

  void removeListener(EventCallback callback){
    callbacks.remove(callback);
  }

  void emit(String message){
    for (var callback in callbacks) {
      callback(message);
    }
  }

  static final TotsGlobalEvent _instance = TotsGlobalEvent._internal();

  TotsGlobalEvent._internal();

  factory TotsGlobalEvent() {
    return _instance;
  }
}