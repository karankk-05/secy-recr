import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  String phone;
  String profile;
  String password;
  String address;
  String gender;
  String batch;
  String? imageUrl;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.profile,
    required this.password,
    required this.address,
    required this.gender,
    required this.batch,
    this.imageUrl
  });
}




class UserProvider extends ChangeNotifier {
  User _user = User(
    name: '',
    email: '',
    phone: '',
    profile: '',
    password: '',
    address: '',
    gender: '',
    batch:''
    
  );

  User get user => _user;

  void updateUser({
    String? name,
    String? email,
    String? phone,
    String? profile,
    String? password,
    String? address,
    String? gender,
    String? batch,
    String? imageUrl,
    
  }) {
    if (name != null) _user.name = name;
    if (email != null) _user.email = email;
    if (phone != null) _user.phone = phone;
    if (profile != null) _user.profile = profile;
    if (password != null) _user.password = password;
    if (address != null) _user.address = address;
    if (gender != null) _user.gender = gender;
    if (batch != null) _user.batch = batch;
    if (imageUrl != null) _user.imageUrl = imageUrl;

    notifyListeners();
  }
}
