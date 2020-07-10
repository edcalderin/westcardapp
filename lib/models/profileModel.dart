class ProfileModel {
  int uuid;
  String email;
  String firstName;
  String lastName;
  String business;
  String phone;
  String mobile;
  String address;
  String facebook;
  String instagram;
  String twitter;
  String youtube;

  ProfileModel(
      {this.uuid,
      this.email,
      this.firstName,
      this.lastName,
      this.business,
      this.phone,
      this.mobile,
      this.address,
      this.facebook,
      this.instagram,
      this.twitter,
      this.youtube});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      uuid: json['uuid'] ?? '',
      email: json['email'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      business: json['business'] ?? '',
      phone: json['phone'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
      facebook: json['facebook'] ?? '',
      instagram: json['instagram'] ?? '',
      twitter: json['twitter'] ?? '',
      youtube: json['youtube'] ?? '',
    );
  }
}
