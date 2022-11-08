class OnBoardingFinishModel {
  String? header;
  String? title;
  List<dynamic>? reasons;
  List<dynamic>? tools;
  String? tagline;
  int? learnerCount;

  OnBoardingFinishModel(
      {required this.header,
      required this.title,
      required this.reasons,
      required this.tools,
      required this.tagline,
      required this.learnerCount});
}
