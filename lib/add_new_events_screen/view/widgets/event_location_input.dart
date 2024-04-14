import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/add_new_events_screen/view_model/add_new_events_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class EventLocationInput extends StatefulWidget {
  const EventLocationInput({super.key});

  @override
  State<EventLocationInput> createState() => _EventLocationInputState();
}

class _EventLocationInputState extends State<EventLocationInput> {
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
              controller: addNewEventsScreenViewModel.eventLocationTextController,
              decoration: const InputDecoration(
                hintText: "Event Location",
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