import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matan_calendar/controller/add_controller.dart';

class BtnWidget extends ConsumerStatefulWidget {
  GlobalKey<FormState> formKey;
  String from;
  String to;
  String price;
  DateTime date = DateTime.now();
  BtnWidget(
      {super.key,
      required this.formKey,
      required this.from,
      required this.to,
      required this.price,
      required this.date});

  @override
  ConsumerState<BtnWidget> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<BtnWidget> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // watch the provider to rebuild when the state changes
    ref.watch(addControllerProvider);
    // read the provider to access the state
    AddController controller = ref.read(addControllerProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        key: GlobalKey(),
        onPressed: () {
          if (widget.formKey.currentState!.validate()) {
            controller.add(widget.from, widget.to, widget.price, widget.date);
            controller.pressOnSubmit();
            setState(() {
              widget.from = '';
              widget.to = '';
              widget.price = '';
              widget.date = DateTime.now();
            });
            // the extra is used to select the correct tab navigation bar
            //context.replace('/', extra: 0);
          }
        },
        child: const Text('Send'),
      ),
    );
  }
}