import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controller/add_controller.dart';
import '../widgets/add_form/date_widget.dart';
import '../widgets/add_form/time_widget.dart';

class AddScreen extends ConsumerStatefulWidget {
  const AddScreen({super.key});

  @override
  ConsumerState<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends ConsumerState<AddScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  final space = const SizedBox(height: 20);
  String from = '';
  String to = '';
  String price = '';
  DateTime date = DateTime.now();

  Widget build(BuildContext context) {
    // watch the provider to rebuild when the state changes
    ref.watch(addControllerProvider);
    // read the provider to access the state
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
              'Insert a start time',
              style: Theme.of(context).textTheme.headline6,
            ),
            TimeInputField(
              textAlign: TextAlign.center,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  from = value;
                }
                return null;
              },
            ),
            space,
            Text(
              'Insert a end time',
              style: Theme.of(context).textTheme.headline6,
            ),
            TimeInputField(
              textAlign: TextAlign.center,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  to = value;
                }
                return null;
              },
            ),
            space,
            Text(
              'Insert a price',
              style: Theme.of(context).textTheme.headline6,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else {
                  price = value;
                }
                return null;
              },
            ),
            space,
            Text(
              'Insert date',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  // close the keyboard when the modal is opened
                  FocusManager.instance.primaryFocus?.unfocus();
                  openDateModal();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Press to select date',
                      softWrap: false,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      date!.day.toString() +
                          '/' +
                          date!.month.toString() +
                          '/' +
                          date!.year.toString(),
                      softWrap: false,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
            space,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                key: GlobalKey(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.add(from, to, price, date);
                    controller.pressOnSubmit();
                    setState(() {
                      from = '';
                      to = '';
                      price = '';
                      date = DateTime.now();
                    });
                    // the extra is used to select the correct tab navigation bar
                    context.replace('/', extra: 0);
                  }
                },
                child: const Text('Send'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openDateModal() {
    // wait for the keyboard to close
    Future.delayed(const Duration(milliseconds: 200), () {
      // open the modal
      BotToast.showAttachedWidget(
          allowClick: false,
          backgroundColor: Colors.black,
          target: const Offset(0, 0),
          attachedBuilder: (c) {
            return DatePickerWidget(
              popCallback: BotToast.cleanAll,
              initalDate: date,
              selectCallback: (newDate) {
                date = newDate;
                setState(() {});
              },
            );
          });
    });
  }
}
