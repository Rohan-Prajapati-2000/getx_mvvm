class UserModelNodeJs {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? jobTitle;

  UserModelNodeJs(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.jobTitle});

  UserModelNodeJs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    jobTitle = json['job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['job_title'] = this.jobTitle;
    return data;
  }
}
