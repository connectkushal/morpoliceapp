import 'subcategory_model.dart';

class CategoryModel {
  int id;
  String name;
  List<SubcategoryModel> subcategories;

  CategoryModel({this.id, this.name, this.subcategories});

  factory CategoryModel.fromJson(Map<String, dynamic> $data) {
    final sc = $data['subcategories'] as List;
    List<SubcategoryModel> subcategoryList =
        sc.map<SubcategoryModel>((i) => SubcategoryModel.fromJson(i)).toList();

    return CategoryModel(
      id: $data['id'],
      name: $data['name'],
      subcategories: subcategoryList,
    );
  }
}
