import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addControllerProvider = ChangeNotifierProvider<AddController>(
  (ref) => AddController(ref),
);

class AddController extends ChangeNotifier {
  AddController(this.ref) : super();

  Ref ref;
  String currentFrom = '';
  String currentTo = '';
  String currentPrice = '';
  String currentDate = '';

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

  void updateDate(String date) {
    currentDate = date;
    notifyListeners();
  }

  void clearAll() {
    currentFrom = '';
    currentTo = '';
    currentPrice = '';
    currentDate = '';
    notifyListeners();
  }

  Future PressOnSubmit() async {
    //AddModel data = create();

    printDetails();

    //var answer = await AddApi.postAddForm(data);
    //if (answer != null && answer != false) {
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
    //}

    clearAll();
    notifyListeners();
  }

  void printDetails() {}

  // create the data form model that this controller is managing
  // AddModel create() {
  //   final data = AddModel(
  //     currentFrom: currentFrom,
  //     currentTo: currentTo,
  //     currentPrice: currentPrice,
  //     currentDate: currentDate,
  //   );
  //   // update the state of the data provider
  //   //ref.read(addCurrentDataProvider.notifier).state = data;
  //   return data;
  // }
}
