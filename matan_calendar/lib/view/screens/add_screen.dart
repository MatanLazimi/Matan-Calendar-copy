import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matan_calendar/view/style/strings.dart';
import 'package:matan_calendar/view/widgets/add_form/date_widget.dart';
import 'package:matan_calendar/view/widgets/add_form/time_widget.dart';

import '../../controller/add_controller.dart';
import '../widgets/button_widget.dart';

class AddScreen extends ConsumerStatefulWidget {
  const AddScreen({super.key});

  @override
  ConsumerState<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends ConsumerState<AddScreen> {
  @override
  // ignore: override_on_non_overriding_member
  final _formKey = GlobalKey<FormState>();
  final space = const SizedBox(height: 20);

  Widget build(BuildContext context) {
    // watch the provider to rebuild when the state changes
    ref.watch(addControllerProvider);
    AddController controller = ref.read(addControllerProvider.notifier);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            space,
            Text(
              Strings.START_TIME,
              style: Theme.of(context).textTheme.headline6,
            ),
            TimeInputField(
              textAlign: TextAlign.center,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value == controller.currentTo) {
                  return Strings.CORRECT_TIME;
                } else {
                  controller.currentFrom = value;
                }
                return null;
              },
              onChanged: (value) => controller.currentFrom = value,
            ),
            space,
            Text(
              Strings.END_TIME,
              style: Theme.of(context).textTheme.headline6,
            ),
            TimeInputField(
              textAlign: TextAlign.center,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Strings.CORRECT_TIME;
                } else {
                  controller.currentTo = value;
                }
                return null;
              },
              onChanged: (value) => controller.currentTo = value,
            ),
            space,
            Text(
              Strings.PRICE,
              style: Theme.of(context).textTheme.headline6,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Strings.SOME_TEXT;
                } else {
                  controller.currentPrice = value;
                }
                return null;
              },
            ),
            space,
            DatePickerUI(
                date: controller.currentDate ?? DateTime.now(),
                onTapDate: onTapDate),
            space,
            BtnWidget(
              formKey: _formKey,
            )
          ],
        ),
      ),
    );
  }

  onTapDate() {
    // close the keyboard when the modal is opened
    FocusManager.instance.primaryFocus?.unfocus();
    openDateModal(callBack: (newDate) {
      AddController controller = ref.read(addControllerProvider.notifier);
      controller.currentDate = newDate;
      setState(() {});
    });
  }

  void openDateModal({required Function(DateTime) callBack}) {
    // wait for the keyboard to close
    Future.delayed(const Duration(milliseconds: 200), () {
      AddController controller = ref.read(addControllerProvider.notifier);

      // open the modal
      BotToast.showAttachedWidget(
          allowClick: false,
          backgroundColor: Colors.black,
          target: const Offset(0, 0),
          attachedBuilder: (c) {
            return DatePickerWidget(
              popCallback: BotToast.cleanAll,
              initalDate: controller.currentDate ?? DateTime.now(),
              selectCallback: callBack,
            );
          });
    });
  }
}

class DatePickerUI extends StatelessWidget {
  final DateTime date;
  final Function()? onTapDate;

  const DatePickerUI({Key? key, required this.date, required this.onTapDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.DATE,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 20),
        Container(
          height: 80,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: onTapDate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.PRESS_DATE,
                  softWrap: false,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  date.day.toString() +
                      Strings.SLESH +
                      date.month.toString() +
                      Strings.SLESH +
                      date.year.toString(),
                  softWrap: false,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
