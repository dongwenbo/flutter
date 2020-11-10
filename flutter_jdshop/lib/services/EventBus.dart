import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();
class ProductContentEvent {
  String eventFlag;
  ProductContentEvent(this.eventFlag);
}