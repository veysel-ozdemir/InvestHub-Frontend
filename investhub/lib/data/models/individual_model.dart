// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:investhub/data/models/applicant_model.dart';

class IndividualModel extends Equatable with Applicant {
  final int? id;
  final bool formFilled;
  final String state,
      projectName,
      name,
      surname,
      email,
      phone,
      aboutMe,
      projectPurpose,
      investment;
  final Image? image;

  IndividualModel({
    this.id,
    required this.formFilled,
    required this.state,
    required this.projectName,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.aboutMe,
    required this.projectPurpose,
    required this.investment,
    this.image,
  }) {
    statee = state;
    namee = projectName;
    purposee = projectPurpose;
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "form_filled": formFilled,
        "state": state,
        "project_name": projectName,
        "name": name,
        "surname": surname,
        "email": email,
        "phone": phone,
        "about_me": aboutMe,
        "project_purpose": projectPurpose,
        "investment": investment,
        "image": image,
      };

  factory IndividualModel.fromMap(Map<String, dynamic> map) => IndividualModel(
        id: map['id'] as int?,
        formFilled: map['form_filled'] as bool,
        state: map['state'] as String,
        projectName: map['project_name'] as String,
        name: map['name'] as String,
        surname: map['surname'] as String,
        email: map['email'] as String,
        phone: map['phone'] as String,
        aboutMe: map['about_me'] as String,
        projectPurpose: map['project_purpose'] as String,
        investment: map['investment'] as String,
        image: map['image'] as Image?,
      );

  @override
  List<Object?> get props => [
        id,
        formFilled,
        state,
        projectName,
        name,
        surname,
        email,
        phone,
        aboutMe,
        projectPurpose,
        investment,
        image
      ];

  IndividualModel copyWith({
    int? id,
    bool? formFilled,
    String? state,
    String? projectName,
    String? name,
    String? surname,
    String? email,
    String? phone,
    String? aboutMe,
    String? projectPurpose,
    String? investment,
    Image? image,
  }) {
    return IndividualModel(
      id: id ?? this.id,
      formFilled: formFilled ?? this.formFilled,
      state: state ?? this.state,
      projectName: projectName ?? this.projectName,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      aboutMe: aboutMe ?? this.aboutMe,
      projectPurpose: projectPurpose ?? this.projectPurpose,
      investment: investment ?? this.investment,
      image: image ?? this.image,
    );
  }
}
