


// ignore_for_file: constant_identifier_names, unused_element, non_constant_identifier_names, prefer_const_declarations




class RestDatasource {
  

  static final BASE_URL = "http://34.199.211.207:8700/api/";

  static final CREATEUSER = BASE_URL + "createuser";
  static final GETCATEGORY = BASE_URL + "getCategory";
  static final GETSUBCATEGORY = BASE_URL + "getcourse?categoryId=";
  static final ALLCOURSES = BASE_URL + "allcoursesbyCat";
  static final LEARNINGPATH_URL = BASE_URL + "allcoursesbysubCat";
  static final GETHOTCOURSE_URL = BASE_URL + "getHotcourse";
  static final STUDYMETERIAL_URL = BASE_URL + "GetNewCourseModule?courseId=";
  
}