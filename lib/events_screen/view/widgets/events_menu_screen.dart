import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/events_screen/view_model/events_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class EventsMenuScreen extends StatefulWidget {
  const EventsMenuScreen({super.key});

  @override
  State<EventsMenuScreen> createState() => _EventsMenuScreenState();
}

class _EventsMenuScreenState extends State<EventsMenuScreen> {
  final eventsScreenViewModel = locator<EventsScreenViewModel>();
  int? eventsListOldLength;
  @override
  void initState() {
    super.initState();
    if (eventsScreenViewModel.eventList.isEmpty) {
      eventsScreenViewModel.getAllEvents();
      eventsListOldLength = eventsScreenViewModel.eventList.length;
    }
  }

  @override
  void didChangeDependencies() {
    if (eventsListOldLength != eventsScreenViewModel.eventList.length) {
      setState(() {
        eventsScreenViewModel.eventList.clear();
        eventsScreenViewModel.getAllEvents();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        SizedBox(
          height: 75.h,
          child: Observer(builder: (_) {
            if (eventsScreenViewModel.eventList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(1000, 241, 0, 77)),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: eventsScreenViewModel.eventList.length,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      height: 28.h,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.5.h),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.all(1.5.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      eventsScreenViewModel
                                          .eventList[index].eventName,
                                      style: TextStyle(
                                          fontSize: 13.0.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      eventsScreenViewModel
                                          .eventList[index].eventDescription,
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      "Location : ${eventsScreenViewModel.eventList[index].eventLocation}",
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      "Day :  ${eventsScreenViewModel.eventList[index].eventDay}",
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text(
                                      "Time :  ${eventsScreenViewModel.eventList[index].eventTime}",
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  }));
            }
          }),
        )
      ],
    );
  }
}
