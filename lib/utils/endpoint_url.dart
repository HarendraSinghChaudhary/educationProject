// ignore_for_file: constant_identifier_names, unused_element, non_constant_identifier_names, prefer_const_declarations

class RestDatasource {
  static String BASE_URL = "https://theambitiousapp.co/v1/api/";

  static final REFRESH_USER_URL = BASE_URL + "users/current";
  static final CREATEUSER = BASE_URL + "users/oauth_signin";
  static final REGISTER_URL = BASE_URL + "users/signup_email";
  static final OTP_URL = BASE_URL + "verifyOtp";
  static final login_URL = BASE_URL + "login_email_pass";
  static final FINISH_ONBOARDING_URL = BASE_URL + "onboarding/finish_onboarding";
  static final forgotPass_URL = BASE_URL + "forgotpassword";
  static final reset_password_url = BASE_URL + "reset_password";
  static final resendOtp_url = BASE_URL + "resendOtp";
  static final EDITPROFILE_URL = BASE_URL + "editprofile";
  static final USERDELETE_URL = BASE_URL + "Deleteuser?userid=";


  // Remodeling Required 
  static final GETCOURSEMODULE = BASE_URL + "get_module?courseId=";
  static final LIBRARY_URL = BASE_URL + "courses/library";
  static final GETHOTCOURSE_URL = BASE_URL + "getHotcourse";
  static final GETHOTSUBCET_URL = BASE_URL + "all_coursesby_cat";
  static final STUDYMETERIAL_URL =
      BASE_URL + "getNewCourseData?moduleId="; //Empty
  static final MODULESTATUSCHANGEAPI = BASE_URL + "ModuleStatus";
  static final COURSEVIEWCOUNT_URL = BASE_URL + "Courseviews";
  static final ADDFCMTOKEN_URL = BASE_URL + "isAllow";
  static final RSVP_URL = BASE_URL + "reservePowerHour";
  //static final GETPOWERHOUR_URL = BASE_URL + "getPowerHours"; //Not Working
  static final GETPOWERHOUR_URL =
      "https://theambitiousapp.co/v1/api/getPowerHours";

  //not using
  static final ALLCOURSES = BASE_URL + "allcoursesbyCat";
  static final GETCATEGORY = BASE_URL + "getCategory";
  static final GETSUBCATEGORY = BASE_URL + "getcourse?categoryId=";
  static final LEARNINGPATH_URL = BASE_URL + "allcoursesbysubCat";
  static final SLACK_URL = BASE_URL + "getSlackData";
  static final USERCHECK_URL = BASE_URL + "usercheckEmail";
  static final APPLEDELETE_URL = "https://appleid.apple.com/auth/revoke";
}

const authToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmI1NzhjNzNlMWY2ODNhZTcwM2JhNGMiLCJlbWFpbCI6ImNoYWl0YW55YUBnbWFpbC5jb20iLCJpYXQiOjE2NTYwNjAzMzN9.xQy5ZCyQrXu_y54fXIV5VOo5fsNvt__R8L6wWrTshWI";

//url for webview and launcher
//which will be constant

const String suggessionUrl = "https://www.theambitiousapp.com/give-feedback";
const String slackUrl =
    "https://join.slack.com/t/theambitiousclub/shared_invite/zt-1eumzf3ck-_EQFrn6fXkGIi7DZImaRkA";
