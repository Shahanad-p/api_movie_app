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
      name: json['name'] ?? "NO name",
      originalName: json['original_name'] ?? "NO name",
      profilePath: json['profile_path'] ?? "NO image",
      charecter: json['character'] ?? "NO name",
      knowForDepartment: json['known_for_department'] ?? "NO Data",
    );
  }
}
