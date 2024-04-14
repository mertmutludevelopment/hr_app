import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/add_new_events_screen/view_model/add_new_events_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class EventDescriptionInput extends StatefulWidget {
  const EventDescriptionInput({super.key});

  @override
  State<EventDescriptionInput> createState() => _EventDescriptionInputState();
}

class _EventDescriptionInputState extends State<EventDescriptionInput> {
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
              controller: addNewEventsScreenViewModel.eventDescriptionTextController,
              decoration: const InputDecoration(
                hintText: "Event Description",
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