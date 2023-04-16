import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/add_model.dart';
import '../services/api/add_api.dart';
import '../services/logger/logger.dart';

final addControllerProvider = ChangeNotifierProvider<AddController>(
  (ref) => AddController(ref),
);

class AddController extends ChangeNotifier {
  AddController(this.ref) : super();

  Ref ref;
  String currentFrom = '';
  String currentTo = '';
  String currentPrice = '';
  DateTime? currentDate;

  void updateFrom(String from) {
    currentFrom = from;
    notifyListeners();
  }

  void updateTo(String to) {
    currentTo = to;
    notifyListeners();
  }

  void updatePrice(String price) {
    currentPrice = price;
    notifyListeners();
  }

  void updateDate(DateTime date) {
    currentDate = date;
    notifyListeners();
  }

  void clearAll() {
    currentFrom = '';
    currentTo = '';
    currentPrice = '';
    currentDate = null;
    notifyListeners();
  }

  Future<void> pressOnSubmit() async {
    printDetails();
    final data = create();
    var answer = await AddApi.postAddForm(data);
    if (answer != null && answer != false) {
      BotToast.showCustomNotification(
          duration: const Duration(seconds: 3),
          toastBuilder: (cancelFunc) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Your request has been sent successfully",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          });
    }

    clearAll();
    notifyListeners();
  }

  //create the data form model that this controller is managing
  AddModel create() {
    return AddModel(
      from: currentFrom,
      to: currentTo,
      price: currentPrice,
      date: currentDate ?? DateTime.now(),
    );
  }

  void printDetails() {
    logger.d('from: $currentFrom');
    logger.d('to: $currentTo');
    logger.d('price: $currentPrice');
    logger.d('date: $currentDate');
  }

  // update the state of the data provider
  void add(String from, String to, String price, DateTime date) {
    updateTo(to);
    updateFrom(from);
    updatePrice(price);
    updateDate(date);
  }
}
