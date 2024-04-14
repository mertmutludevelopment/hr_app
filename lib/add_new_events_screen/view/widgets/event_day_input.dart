import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/add_new_events_screen/view_model/add_new_events_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class EventDayInput extends StatefulWidget {
  const EventDayInput({super.key});

  @override
  State<EventDayInput> createState() => _EventDayInputState();
}

class _EventDayInputState extends State<EventDayInput> {
  final addNewEventsScreenViewModel = locator<AddNewEventsScreenViewModel>();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.5.h,
        ),
        Observer(
          builder: (_) {
            return TextField(
              controller: addNewEventsScreenViewModel.eventDayTextController,
              decoration: const InputDecoration(
                hintText: "Event Day : xx.xx.xxxx",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
      ],
    );
  }
}