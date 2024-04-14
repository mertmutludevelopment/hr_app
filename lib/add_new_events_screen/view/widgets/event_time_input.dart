import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/add_new_events_screen/view_model/add_new_events_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class EventTimeInput extends StatefulWidget {
  const EventTimeInput({super.key});

  @override
  State<EventTimeInput> createState() => _EventTimeInputState();
}

class _EventTimeInputState extends State<EventTimeInput> {
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
              controller: addNewEventsScreenViewModel.eventTimeTextController,
              decoration: const InputDecoration(
                hintText: "Event Time : xx.xx",
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