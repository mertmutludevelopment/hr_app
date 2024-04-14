import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/add_new_events_screen/view_model/add_new_events_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:hr_app/utils/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class CreateNewEventButton extends StatefulWidget {
  const CreateNewEventButton({super.key});

  @override
  State<CreateNewEventButton> createState() => _CreateNewEventButtonState();
}

class _CreateNewEventButtonState extends State<CreateNewEventButton> {
  final addNewEventsScreenViewModel = locator<AddNewEventsScreenViewModel>();

  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventDayController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();

  @override
  void didChangeDependencies() {
    eventNameController =
        addNewEventsScreenViewModel.getEventNameTextController();
    eventDescriptionController =
        addNewEventsScreenViewModel.getEventDescriptionTextController();
    eventLocationController =
        addNewEventsScreenViewModel.getEventLocationTextController();
    eventDayController =
        addNewEventsScreenViewModel.getEventDayTextController();
    eventTimeController =
        addNewEventsScreenViewModel.getEventTimeTextController();

    super.didChangeDependencies();
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Warning'),
          content: const Text("Please enter all the information correctly"),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 18.h),
          child: ElevatedButton(
              onPressed: () async {
                if (eventNameController.text.isNotEmpty &&
                    eventDescriptionController.text.isNotEmpty &&
                    eventLocationController.text.isNotEmpty &&
                    eventDayController.text.isNotEmpty &&
                    eventTimeController.text.isNotEmpty) {
          
                  await addNewEventsScreenViewModel.createNewEvent(
                      eventNameController.text.toString(),
                      eventLocationController.text.toString(),
                      eventDayController.text.toString(),
                      eventTimeController.text.toString(),
                      eventDescriptionController.text.toString());
          
                  eventNameController.text = "";
                  eventDescriptionController.text = "";
                  eventDayController.text = "";
                  eventTimeController.text = "";
                  eventLocationController.text = "";
          
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Addition successful'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  Get.toNamed(AppRoutes.MANAGER_EVENTS_SCREEN_PATH);
                } else {
                  _showAlert();
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 8.h),
                  backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Create New Event")),
        ),
      ],
    );
  }
}
