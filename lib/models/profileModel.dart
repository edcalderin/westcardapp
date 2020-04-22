class ProfileModel {
  String uuid;
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

  ProfileModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'].toString();
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    business = json['business'];
    phone = json['phone'];
    mobile = json['mobile'];
    address = json['address'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    youtube = json['youtube'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['business'] = this.business;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['youtube'] = this.youtube;
    return data;
  }
}
