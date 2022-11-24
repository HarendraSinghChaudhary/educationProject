import 'package:Ambitious/models/learnig_path_model.dart';

class GetCourseLibraryModel {
  List<Categories>? categories;
  List<Library>? library;

  GetCourseLibraryModel({this.categories, this.library});

  GetCourseLibraryModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['library'] != null) {
      library = <Library>[];
      json['library'].forEach((v) {
        library!.add(new Library.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.library != null) {
      data['library'] = this.library!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? categoryName;
  String? categoryId;

  Categories({this.categoryName, this.categoryId});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['categoryId'] = this.categoryId;
    return data;
  }
}

class Library {
  String? header;
  String? subtext;
  List<Courses>? courses;

  Library({this.header, this.subtext, this.courses});

  Library.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    subtext = json['subtext'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['subtext'] = this.subtext;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  List<LearningPathModel>? learningPath;
  String? sId;
  String? title;
  String? description;
  String? image;
  CategoryId? categoryId;

  Courses(
      {this.learningPath,
      this.sId,
      this.title,
      this.description,
      this.image,
      this.categoryId});

  Courses.fromJson(Map<String, dynamic> json) {
    if (json['learningPath'] != null) {
      learningPath = <LearningPathModel>[];
      json['learningPath'].forEach((v) {
        learningPath!.add(new LearningPathModel());
      });
    }
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    categoryId = json['categoryId'] != null
        ? new CategoryId.fromJson(json['categoryId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.learningPath != null) {
      data['learningPath'] = this.learningPath!.map((v) => LearningPathModel()).toList();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId!.toJson();
    }
    return data;
  }
}

class CategoryId {
  String? sId;
  String? category;

  CategoryId({this.sId, this.category});

  CategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    return data;
  }
}