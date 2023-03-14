class DropdownValueModel {
  final String? id;
  final String? schoolId;
  final String? schoolName;
  final String? baseUrl;

  DropdownValueModel({
    this.id,
    this.schoolId,
    this.schoolName,
    this.baseUrl,
  });

  factory DropdownValueModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return DropdownValueModel();
    return DropdownValueModel(
      id: json["id"],
      schoolId: json["school_id"],
      schoolName: json["school_name"],
      baseUrl:json["base_url"],
    );
  }

  static List<DropdownValueModel> fromJsonList(List list) {
    if (list == null) return [];
    return list.map((item) => DropdownValueModel.fromJson(item)).toList();
  }

  String userAsString() {
    // return '#${this.id} ${this.name}';
    return '${schoolName}';
  }

  bool isEqual(DropdownValueModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => schoolName!;
}
