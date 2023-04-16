import 'dart:collection';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../services/api/add_api.dart';
import '../view/widgets/calendar_widget/calendar_utils.dart';

final calendarControllerProvider = ChangeNotifierProvider<CalendarController>(
  (ref) => CalendarController(ref),
);

class CalendarController extends ChangeNotifier {
  CalendarController(this.ref) : super();

  Ref ref;
  List<dynamic> addFormsList = [];

  /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
  var _kEventSource;
  var kEvents;

  Future<void> getAddForms() async {
    var answer = await AddApi.getAddForm();
    if (answer != null && answer != false) {
      addFormsList = answer;
      updateEvents();
      notifyListeners();
    } else {
      BotToast.showCustomNotification(
          duration: const Duration(seconds: 3),
          toastBuilder: (cancelFunc) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline),
                  const SizedBox(width: 10),
                  const Text('Error getting data from server'),
                ],
              ),
            );
          });
    }
  }

  //update from events from list
  void updateEvents() {
    _kEventSource = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    kEvents = _kEventSource;
    for (var i = 0; i < addFormsList.length; i++) {
      var date = addFormsList[i].date;
      var event = buildEventSrting(i);
      if (_kEventSource[date] == null) {
        _kEventSource[date] = [event];
      } else {
        _kEventSource[date]!.add(event);
      }
    }
    notifyListeners();
  }

  String buildEventSrting(int i) {
    return 'Time: ' +
        addFormsList[i].from +
        ' - ' +
        addFormsList[i].to +
        '\n' +
        'Price: ' +
        addFormsList[i].price +
        (addFormsList[i].price.contains('\$')
            ? ''
            : addFormsList[i].price.contains('₪')
                ? ''
                : '₪');
  }

  void getEventsForDay(DateTime dateTime) {
    if (_kEventSource == null) {
      return;
    }
    var events = _kEventSource[dateTime];
    if (events != null) {
      for (var i = 0; i < events.length; i++) {
        print(events[i]);
      }
    }
  }
}
