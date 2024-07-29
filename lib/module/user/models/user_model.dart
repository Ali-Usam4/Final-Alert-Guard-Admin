class UserModel {
  String name;
  String email;
  String phone;
  String profileImage;
  bool isEditMode;

  UserModel({
    required this.name,
    required this.profileImage,
    required this.email,
    required this.phone,
    required this.isEditMode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        profileImage: json["profileImage"],
        email: json["email"],
        phone: json["phone"],
        isEditMode: json["editMode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profileImage": profileImage,
        "email": email,
        "phone": phone,
        "editMode": isEditMode,
      };

  static UserModel empty = UserModel(
    name: '',
    email: '',
    phone: '',
    profileImage: '',
    isEditMode: false,
  );
}
