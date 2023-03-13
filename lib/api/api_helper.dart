const String uatServerBaseUrl = 'https://dev-bee.com/devbee-school/';
const String liveServerBaseUrl = 'http://43.206.124.140/live/';
const String localServerBaseUrl='http://192.168.0.103/smart-school/';

const String versionName = '1.1.0'; //TODO: NEED TO CHANGE BEFORE BUILD

class ApiBaseUrl {
  static String baseUrl = //TODO: NEED TO CHANGE BEFORE BUILD
  // uatServerBaseUrl; //UAT
  //liveServerBaseUrl; //LIVE
  localServerBaseUrl;

}

class BuildVersion {
  static String versionNameSuffix =
  ApiBaseUrl.baseUrl == liveServerBaseUrl ? 'L' : 'U';
  static String buildName = 'V $versionName $versionNameSuffix';
}

class ApiEndPoint {
  static String loginEndPoint = 'api/Driver/Auth/login';
  static String profileEndPoint = 'api/Teacher/Teacher_controller/get_profile';
  static String assignmentEndPoint =
      'api/Teacher/teacher_controller/get_all_assignments';
  static String createAssignmentEndPoint =
      'api/Teacher/Teacher_controller/create_assignment';
  static String assignedClassesEndPoint =
      'api/Teacher/teacher_controller/assigned_classes';
  static String assignedSubjectsEndPoint =
      'api/Teacher/teacher_controller/get_assigned_subjects';
  static String syllabusEndPoint =
      'api/Teacher/Teacher_controller/get_syllabus';
  static String lessonsEndPoint = 'api/Teacher/Teacher_controller/get_lessons';
  static String topicsEndPoint = 'api/Teacher/Teacher_controller/get_topics';
  static String topicsStatusUpdateEndPoint =
      'api/Teacher/Teacher_controller/update_topic_status';
  static String notificationEndPoint =
      'api/Teacher/teacher_controller/get_all_push_notifications';
  // static String getComplaintTypeEndPoint = "api/complaints/getComplaintTypes";
  static String getComplaintTypeEndPoint =
      "api/Teacher/Teacher_controller/get_staff_complaint_type";
  static String complaintsEndPoint =
      'api/Teacher/teacher_controller/getComplaintsByTeacher?teacher_id=';
  static String getComplaintByIdEndPoint =
      "api/Teacher/teacher_controller/getComplaintById?id=";
  static String getStatusChangeLogByComplaintIdEndPoint =
      "api/Teacher/teacher_controller/getComplaintLogById?id=";
  static String createComplaintEndPoint =
      'api/Teacher/teacher_controller/create_complaint';
  static String homeWorkStatusEndPoint =
      'api/webservice/getHomeworkStatusNames';
  static String applyLeaveEndPoint =
      'api/Teacher/Teacher_controller/apply_leave';
  static String leaveEndPoint =
      'api/Teacher/teacher_controller/get_leave_history';
  static String staffLeaveEndPoint =
      'api/Teacher/Teacher_controller/get_staff_leaves';
  static String leaveTypeEndPoint =
      'api/Teacher/teacher_controller/get_leave_type';
  static String studentAttendanceListEndPoint =
      'api/Teacher/teacher_controller/get_student_attendance';
  static String studentListForClassEndPoint =
      'api/Teacher/Teacher_controller/get_all_students';
  static String createTodayAttendanceEndPoint =
      'api/Teacher/Teacher_controller/create_attendance';
  static String getSubjectGroupEndPoint =
      'api/Teacher/teacher_controller/get_subject_groups';
  static String getSubjectsEndPoint =
      'api/Teacher/teacher_controller/get_subject_groups_subject';
  static String getEvaluateAssignmentListEndPoint =
      'api/Teacher/teacher_controller/get_evaluation_status';
  static String getAttendanceChartEndPoint =
      'api/Teacher/teacher_controller/stu_atten_barchart';
  static String forgotPasswordEndPoint = 'api/Teacher/Auth/forgot_password';
  static String rolesEndPoint =
      'api/Teacher/Teacher_controller/get_staff_roles';
  static String selectedRolesEndPoint =
      'api/Teacher/Teacher_controller/get_notification_roles';
  static String createAnnouncementEndPoint =
      'api/Teacher/Teacher_controller/create_notice_board';
  static String getAnnouncementEndPoint =
      'api/Teacher/Teacher_controller/get_created_noticeboard_noti';
  static String deleteAnnouncementEndPoint =
      'api/Teacher/Teacher_controller/delete_notice_board';
  static String getAllAnnouncementEndPoint =
      'api/Teacher/Teacher_controller/get_noticeboard_notification';
  static String getClassesEndPoint =
      'api/Teacher/Teacher_controller/get_classes';
  static String getSectionsEndPoint =
      'api/Teacher/Teacher_controller/get_sections';
  static String getBirthdayEndPoint =
      'api/Teacher/Teacher_controller/todays_birthday';
  static String directoryEndpoint =
      'api/Teacher/Teacher_controller/directory_search';
  static String directoryDetailsEndPoint =
      'api/Teacher/Teacher_controller/get_directory_detail';
  static String getSelectedClassesEndPoint =
      'api/Teacher/Teacher_controller/get_selected_classes';
  static String getSelectedBirthdayEndPoint =
      'api/Teacher/Teacher_controller/get_birthday_peoples';
  static String getIndividualPeopleEndPoint =
      'api/Teacher/Teacher_controller/get_individual_peoples';
  static String getCustomGroupsEndPoint =
      'api/Teacher/Teacher_controller/get_custom_groups';
  static String getSelectedIndividualEndPoint =
      'api/Teacher/Teacher_controller/get_selected_indi_groups';
  static String getTimeLineEndPoint =
      'api/Teacher/Teacher_controller/get_timeline';
  static String getTodayStoreis =
      'api/Teacher/Teacher_controller/get_today_stories';
  static String leaveDetailsEndPoint =
      'api/Teacher/Teacher_controller/get_leave_by_id';
  static String evaluateAssignmentStatusUpdateEndPoint =
      'api/Teacher/Teacher_controller/evaluate_assignment';
  static String statusUpdateComplaintEndPoint =
      'api/Teacher/Teacher_controller/add_complaint_reply';
  static String statusUpdateLeaveEndPoint =
      'api/Teacher/Teacher_controller/update_leave_status';
  static String getPendingComplaintsEndPoint =
      'api/Teacher/Teacher_controller/get_pending_complaint';
  static String resetPasswordEndPoint = 'api/Teacher/Auth/reset_password';
}


// fvm flutter pub run flutter_launcher_icons:main