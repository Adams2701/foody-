

class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  UserModel(
      {required this.id,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstname: json['first_name'] ?? 'First Name',
        lastname: json['last_name'] ?? 'Last Name',
        avatar: json['avatar'] ??
            'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740');
  }
}





















// class UserModel {
//   int? page;
//   int? perPage;
//   int? total;
//   int? totalPages;
//   List<Data>? data;
//   Support? support;
//
//   UserModel(
//       {this.page,
//         this.perPage,
//         this.total,
//         this.totalPages,
//         this.data,
//         this.support});
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     perPage = json['per_page'];
//     total = json['total'];
//     totalPages = json['total_pages'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     support =
//     json['support'] != null ? new Support.fromJson(json['support']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['page'] = this.page;
//     data['per_page'] = this.perPage;
//     data['total'] = this.total;
//     data['total_pages'] = this.totalPages;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.support != null) {
//       data['support'] = this.support!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? avatar;
//
//   Data({this.id, this.email, this.firstName, this.lastName, this.avatar});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     avatar = json['avatar'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['email'] = this.email;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['avatar'] = this.avatar;
//     return data;
//   }
// }
//
// class Support {
//   String? url;
//   String? text;
//
//   Support({this.url, this.text});
//
//   Support.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     text = json['text'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['text'] = this.text;
//     return data;
//   }
// }


