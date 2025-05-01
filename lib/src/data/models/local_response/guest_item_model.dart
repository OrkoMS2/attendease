class GuestItemModel {
  final String name;
  final String email;
  final String phone;
  final String? avatarUrl; // Null if using initials

  GuestItemModel({
    required this.name,
    required this.email,
    required this.phone,
    this.avatarUrl,
  });
}
