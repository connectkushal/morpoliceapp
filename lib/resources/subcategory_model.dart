class SubcategoryModel {
  int id;
  int categoryId;
  String name;

  SubcategoryModel({this.id, this.categoryId, this.name});

  factory SubcategoryModel.fromJson($data) {
    return SubcategoryModel(
      id: $data['id'],
      categoryId: $data['category_id'],
      name: $data['name'],
    );
  }
}
