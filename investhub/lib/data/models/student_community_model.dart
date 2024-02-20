import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StudentCommunityModel extends Equatable {
  final int? id;
  final bool formFilled;
  final String state,
      communityName,
      communityPresident,
      email,
      phone,
      activities,
      communityPurpose,
      investment;
  final Image? image;

  const StudentCommunityModel({
    this.id,
    required this.formFilled,
    required this.state,
    required this.communityName,
    required this.communityPresident,
    required this.email,
    required this.phone,
    required this.activities,
    required this.communityPurpose,
    required this.investment,
    this.image,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "form_filled": formFilled,
        "state": state,
        "community_name": communityName,
        "community_president": communityPresident,
        "email": email,
        "phone": phone,
        "activities": activities,
        "community_purpose": communityPurpose,
        "investment": investment,
        "image": image,
      };

  factory StudentCommunityModel.fromMap(Map<String, dynamic> map) =>
      StudentCommunityModel(
        id: map['id'] as int?,
        formFilled: map['form_filled'] as bool,
        state: map['state'] as String,
        communityName: map['community_name'] as String,
        communityPresident: map['community_president'] as String,
        email: map['email'] as String,
        phone: map['phone'] as String,
        activities: map['activities'] as String,
        communityPurpose: map['community_purpose'] as String,
        investment: map['investment'] as String,
        image: map['image'] as Image?,
      );

  @override
  List<Object?> get props => [
        id,
        formFilled,
        state,
        communityName,
        communityPresident,
        email,
        phone,
        activities,
        communityPurpose,
        investment,
        image
      ];

  StudentCommunityModel copyWith({
    int? id,
    bool? formFilled,
    String? state,
    String? communityName,
    String? communityPresident,
    String? email,
    String? phone,
    String? activities,
    String? communityPurpose,
    String? investment,
    Image? image,
  }) {
    return StudentCommunityModel(
      id: id ?? this.id,
      formFilled: formFilled ?? this.formFilled,
      state: state ?? this.state,
      communityName: communityName ?? this.communityName,
      communityPresident: communityPresident ?? this.communityPresident,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      activities: activities ?? this.activities,
      communityPurpose: communityPurpose ?? this.communityPurpose,
      investment: investment ?? this.investment,
      image: image ?? this.image,
    );
  }
}
