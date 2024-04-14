import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/events_screen/view_model/events_screen_view_model.dart';
import 'package:hr_app/manager_events_screen/view_model/manager_events_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:sizer/sizer.dart';

class ManagerEventsMenuScreen extends StatefulWidget {
  const ManagerEventsMenuScreen({super.key});

  @override
  State<ManagerEventsMenuScreen> createState() =>
      _ManagerEventsMenuScreenState();
}

class _ManagerEventsMenuScreenState extends State<ManagerEventsMenuScreen> {
  final eventsScreenViewModel = locator<EventsScreenViewModel>();
  final managerEventsScreenViewModel = locator<ManagerEventsScreenViewModel>();

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
        SizedBox(
          height: 2.5.h,
        ),
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
                        child: Dismissible(
                          key: Key(eventsScreenViewModel.eventList[index].id
                              .toString()),
                          onDismissed: (direction) async {
                            bool isDeleted =
                                await managerEventsScreenViewModel.removeEvent(
                                    eventsScreenViewModel.eventList[index].id);

                            if (isDeleted) {
                              setState(() {
                                eventsScreenViewModel.eventList.clear();
                                eventsScreenViewModel.getAllEvents();
                              });
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Deletion is successful'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Deletion is unsuccessful'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.transparent,
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Icon(
                                Icons.delete,
                                size: 5.5.h,
                                color: const Color.fromARGB(1000, 241, 0, 77),
                              ),
                            ),
                          ),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.all(1.5.h),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      child: Text(
                                        eventsScreenViewModel
                                            .eventList[index].eventName,
                                        style: TextStyle(
                                            fontSize: 13.0.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
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
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      child: Text(
                                        "Location : ${eventsScreenViewModel.eventList[index].eventLocation}",
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      child: Text(
                                        "Day :  ${eventsScreenViewModel.eventList[index].eventDay}",
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      child: Text(
                                        "Time :  ${eventsScreenViewModel.eventList[index].eventTime}",
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    );
                  }));
            }
          }),
        ),
      ],
    );
  }
}
