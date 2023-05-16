import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String uid;
  final String email;
  final String name;
  final String bio;
  final String profilePic;
  final String bannerPic;
  final bool isTwitterBlue;
  final List<String> followers;
  final List<String> following;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.bio,
    required this.profilePic,
    required this.bannerPic,
    required this.isTwitterBlue,
    required this.followers,
    required this.following,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          email == other.email &&
          name == other.name &&
          bio == other.bio &&
          profilePic == other.profilePic &&
          bannerPic == other.bannerPic &&
          isTwitterBlue == other.isTwitterBlue &&
          followers == other.followers &&
          following == other.following);

  @override
  int get hashCode =>
      uid.hashCode ^
      email.hashCode ^
      name.hashCode ^
      bio.hashCode ^
      profilePic.hashCode ^
      bannerPic.hashCode ^
      isTwitterBlue.hashCode ^
      followers.hashCode ^
      following.hashCode;

  @override
  String toString() {
    return 'UserModel{ uid: $uid, email: $email, name: $name, bio: $bio, profilePic: $profilePic, bannerPic: $bannerPic, isTwitterBlue: $isTwitterBlue, followers: $followers, following: $following,}';
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? bio,
    String? profilePic,
    String? bannerPic,
    bool? isTwitterBlue,
    List<String>? followers,
    List<String>? following,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      profilePic: profilePic ?? this.profilePic,
      bannerPic: bannerPic ?? this.bannerPic,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'name': this.name,
      'bio': this.bio,
      'profilePic': this.profilePic,
      'bannerPic': this.bannerPic,
      'isTwitterBlue': this.isTwitterBlue,
      'followers': this.followers,
      'following': this.following,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['\$id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      bio: map['bio'] as String,
      profilePic: map['profilePic'] as String,
      bannerPic: map['bannerPic'] as String,
      isTwitterBlue: map['isTwitterBlue'] as bool,
      followers: map['followers'] as List<String>,
      following: map['following'] as List<String>,
    );
  }

//</editor-fold>
}
