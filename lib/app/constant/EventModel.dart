import 'package:event_bus/event_bus.dart';

class EventModel {
  static EventBus eventBus = EventBus();
}

class CartUpdateEvent {
  CartUpdateEvent();
}