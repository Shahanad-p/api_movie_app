class CastModel {
  String? name;
  String? originalName;
  String? profilePath;
  String? charecter;
  String? knowForDepartment;

  CastModel({
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.charecter,
    required this.knowForDepartment,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'] ?? "No name",
      originalName: json['original_name'] ?? "No name",
      profilePath: json['profile_path'] ?? "assets/2117499.jpg",
      charecter: json['character'] ?? "No name",
      knowForDepartment: json['known_for_department'] ?? "No Data",
    );
  }
}
