
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/add_new_events_screen/view/add_new_events_screen_view.dart';
import 'package:hr_app/advance_payment_screen/view/advance_payment_screen_view.dart';
import 'package:hr_app/atomic_widgets/error_screen/error_screen.dart';
import 'package:hr_app/department_detail_screen/view/department_detail_screen_view.dart';
import 'package:hr_app/department_info_edit_screen/view/department_info_edit_screen_view.dart';
import 'package:hr_app/department_screen/view/department_screen_view.dart';
import 'package:hr_app/email_info_edit_screen/view/email_info_edit_screen_view.dart';
import 'package:hr_app/events_screen/view/events_screen_view.dart';
import 'package:hr_app/fullname_info_edit_screen/view/fullname_info_edit_screen_view.dart';
import 'package:hr_app/leave_request_screen/view/leave_request_screen_view.dart';
import 'package:hr_app/login_screen/view/login_screen_view.dart';
import 'package:hr_app/main_screen/view/main_screen_view.dart';
import 'package:hr_app/manager_advance_payment_screen/view/manager_advance_payment_screen_view.dart';
import 'package:hr_app/manager_events_screen/view/manager_events_screen_view.dart';
import 'package:hr_app/manager_notification_screen/view/manager_notification_screen_view.dart';
import 'package:hr_app/notification_screen/view/notification_screen_view.dart';
import 'package:hr_app/password_edit_screen/view/password_edit_screen_view.dart';
import 'package:hr_app/phone_info_edit_screen/view/phone_info_edit_screen_view.dart';
import 'package:hr_app/profile_screen/view/profile_screen_view.dart';
import 'package:hr_app/signup_screen/view/signup_screen_view.dart';
import 'package:hr_app/splash_screen/view/splash_screen_view.dart';
import 'package:hr_app/task_manager_screen/view/task_manager_screen_view.dart';

class AppRoutes {

  static const Transition _transition = Transition.native;
  static const Duration _transitionDuration = Duration(milliseconds: 500);
  static const INIT_PATH = "/splashScreenPath";
  static const LOGIN_SCREEN_PATH = "/loginScreenPath";
  static const SIGNUP_SCREEN_PATH = "/signupScreenPath";
  static const MAIN_SCREEN_PATH = "/mainScreenPath";
  static const PROFILE_SCREEN_PATH = "/profileScreenPath";
  static const EMAIL_INFO_EDIT_SCREEN_PATH = "/emailInfoEditScreenPath";
  static const DEPARTMENT_INFO_EDIT_SCREEN_PATH = "/departmentInfoEditScreenPath";
  static const PHONE_INFO_EDIT_SCREEN_PATH = "/phoneInfoEditScreenPath";
  static const FULLNAME_INFO_EDIT_SCREEN_PATH = "/fullnameInfoEditScreenPath";
  static const EVENTS_SCREEN_PATH = "/EventsScreenPath";
  static const MANAGER_EVENTS_SCREEN_PATH = "/ManagerEventsScreenPath";
  static const ADD_NEW_EVENTS_SCREEN_PATH = "/AddNewEventsScreenPath";
  static const DEPARTMENT_SCREEN_PATH = "/DepartmentScreenPath";
  static const DEPARTMENT_DETAIL_SCREEN_PATH = "/DepartmentDetailScreenPath";
  static const LEAVE_REQUEST_SCREEN_PATH = "/LeaveRequestScreenPath";
  static const ADVANCE_PAYMENT_SCREEN_PATH = "/AdvancePaymentScreenPath";
  static const MANAGER_ADVANCE_PAYMENT_SCREEN_PATH = "/ManagerAdvancePaymentScreenPath";
  static const NOTIFICATON_SCREEN_PATH = "/NotificationScreenPath";
  static const MANAGER_NOTIFICATON_SCREEN_PATH = "/ManagerNotificationScreenPath";
  static const TASK_MANAGER_SCREEN_PATH = "/TaskManagerScreenPath";
  static const PASSWORD_EDIT_SCREEN_PATH = "/passwordEditScreenPath";
















  static const ERROR_SCREEN_PATH = "/errorScreenPath";



  static GetPage getPage(Widget Function() widgetFn, String path,
      {Transition? transition, List<GetPage>? children}) {
    return GetPage(
        name: path,
        transition: transition ?? _transition,
        transitionDuration: _transitionDuration,
        fullscreenDialog: true,
        page: widgetFn,
        children: children ?? []);
  }



  static final get_routes = <GetPage>[
    getPage(() => const SplashScreenView(), INIT_PATH),
    getPage(() => const LoginScreenView(), LOGIN_SCREEN_PATH),
    getPage(() => const SignUpScreenView(), SIGNUP_SCREEN_PATH),
    getPage(() => const MainScreenView(), MAIN_SCREEN_PATH),
    getPage(() => const ProfileScreenView(), PROFILE_SCREEN_PATH),
    getPage(() => const EmailInfoEditScreenView(), EMAIL_INFO_EDIT_SCREEN_PATH),
    getPage(() => const DepartmentInfoEditScreenView(), DEPARTMENT_INFO_EDIT_SCREEN_PATH),
    getPage(() => const PhoneInfoEditScreenView(), PHONE_INFO_EDIT_SCREEN_PATH),
    getPage(() => const FullnameInfoEditScreenView(), FULLNAME_INFO_EDIT_SCREEN_PATH),
    getPage(() => const EventsScreenView(), EVENTS_SCREEN_PATH),
    getPage(() => const ManagerEventsScreenView(), MANAGER_EVENTS_SCREEN_PATH),
    getPage(() => const AddNewEventsScreenView(), ADD_NEW_EVENTS_SCREEN_PATH),
    getPage(() => const DepartmentScreenView(), DEPARTMENT_SCREEN_PATH),
    getPage(() =>  DepartmentDetailScreenView(userDepartment: Get.arguments), DEPARTMENT_DETAIL_SCREEN_PATH),
    getPage(() => const LeaveRequestScreenView(), LEAVE_REQUEST_SCREEN_PATH),
    getPage(() => const AdvancePaymentScreenView(), ADVANCE_PAYMENT_SCREEN_PATH),
    getPage(() => const ManagerAdvancePaymentScreenView(), MANAGER_ADVANCE_PAYMENT_SCREEN_PATH),
    getPage(() => const NotificationScreenView(), NOTIFICATON_SCREEN_PATH),
    getPage(() => const ManagerNotificationScreenView(), MANAGER_NOTIFICATON_SCREEN_PATH),
    getPage(() => const TaskManagerScreenView(), TASK_MANAGER_SCREEN_PATH),
    getPage(() => const PasswordEditScreenView(), PASSWORD_EDIT_SCREEN_PATH),










    







    

    


    unknownRoute
  ];

  static final unknownRoute =
      getPage(() => const ErrorScreen(), ERROR_SCREEN_PATH);
}