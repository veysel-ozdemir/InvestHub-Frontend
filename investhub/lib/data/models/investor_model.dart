import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class InvestorModel extends Equatable {
  final int? id;
  final bool formFilled;
  final String name,
      surname,
      email,
      phone,
      companyName,
      aboutCompany,
      investment;
  final Image? image;

  const InvestorModel({
    this.id,
    required this.formFilled,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.aboutCompany,
    required this.investment,
    this.image,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "form_filled": formFilled,
        "name": name,
        "surname": surname,
        "email": email,
        "phone": phone,
        "company_name": companyName,
        "about_company": aboutCompany,
        "investment": investment,
        "image": image,
      };

  factory InvestorModel.fromMap(Map<String, dynamic> map) => InvestorModel(
        id: map['id'] as int?,
        formFilled: map['form_filled'] as bool,
        name: map['name'] as String,
        surname: map['surname'] as String,
        email: map['email'] as String,
        phone: map['phone'] as String,
        companyName: map['companyName'] as String,
        aboutCompany: map['aboutCompany'] as String,
        investment: map['investment'] as String,
        image: map['image'] as Image?,
      );

  @override
  List<Object?> get props => [
        id,
        formFilled,
        name,
        surname,
        email,
        phone,
        companyName,
        aboutCompany,
        investment,
        image
      ];

  InvestorModel copyWith({
    int? id,
    bool? formFilled,
    String? name,
    String? surname,
    String? email,
    String? phone,
    String? companyName,
    String? aboutCompany,
    String? investment,
    Image? image,
  }) {
    return InvestorModel(
      id: id ?? this.id,
      formFilled: formFilled ?? this.formFilled,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      aboutCompany: aboutCompany ?? this.aboutCompany,
      investment: investment ?? this.investment,
      image: image ?? this.image,
    );
  }
}
