/// Start: Base Class
abstract class Observer<T> {
  void update(T data);
}

abstract class Subject {
  void register(Observer observer);
  void unRegister(Observer observer);
  void notify();
}

/// End: Base Class

class DemoObserverPattern<T> implements Subject {
  // Properties
  List<Observer> subcribers = <Observer>[];
  List<String> data = <String>[];

  @override
  void notify() {
    subcribers.forEach((subcriber) {
      subcriber.update(data.last);
    });
  }

  @override
  void register(Observer observer) {
    if (!subcribers.contains(observer)) {
      subcribers.add(observer);
    }
  }

  @override
  void unRegister(Observer observer) {
    if (subcribers.contains(observer)) {
      subcribers.remove(observer);
    }
  }

  // Use method
  void callObserverPattern(video) {
    data.add(video);
    notify();
  }
}

/// Implement Subcriber
class Subcriber<String> implements Observer<String> {
  @override
  void update(String data) {
    print('This is impelement code with data = $data');
  }
}

void main(List<String> arguments) async {
  var demoObserver = DemoObserverPattern();

  // Setup
  var sub = Subcriber<String>();
  demoObserver.register(sub);

  demoObserver.callObserverPattern('Demo use Observer Pattern');
}
