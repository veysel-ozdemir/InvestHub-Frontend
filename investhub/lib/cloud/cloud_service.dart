import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudService {
  CollectionReference investors =
      FirebaseFirestore.instance.collection('investors');

  CollectionReference studentCommunity =
      FirebaseFirestore.instance.collection('student-communities');

  CollectionReference individuals =
      FirebaseFirestore.instance.collection('individuals');

  Future<String?> createInvestor({
    required String email,
    String? name,
    String? surname,
    String? phone,
    String? companyName,
    String? aboutCompany,
    String? investment,
  }) async {
    try {
      investors.add({
        "id": null,
        "form_filled": false,
        "name": name ?? "",
        "surname": surname ?? "",
        "email": email,
        "image": null,
        "phone": phone ?? "",
        "company_name": companyName ?? "",
        "about_company": aboutCompany ?? "",
        "investment": investment ?? "",
      });
      return 'Success';
    } catch (e) {
      return 'Failed';
    }
  }

  Future<String?> createIndividual({
    required String email,
    String? name,
    String? surname,
    String? phone,
    String? projectName,
    String? projectPurpose,
    String? aboutMe,
    String? investment,
  }) async {
    try {
      individuals.add({
        "email": email,
        "id": null,
        "form_filled": false,
        "state": "individual",
        "name": name ?? "",
        "surname": surname ?? "",
        "image": null,
        "phone": phone ?? "",
        "project_name": projectName ?? "",
        "project_purpose": projectPurpose ?? "",
        "about_me": aboutMe ?? "",
        "investment": investment ?? "",
      });
      return 'Success';
    } catch (e) {
      return 'Failed';
    }
  }

  Future<String?> createStudentCommunity({
    required String email,
    String? communityPresident,
    String? phone,
    String? communityName,
    String? communityPurpose,
    String? activities,
    String? investment,
  }) async {
    try {
      studentCommunity.add({
        "email": email,
        "id": null,
        "form_filled": false,
        "state": "community",
        "community_president": communityPresident ?? "",
        "image": null,
        "phone": phone ?? "",
        "community_name": communityName ?? "",
        "community_purpose": communityPurpose ?? "",
        "activities": activities ?? "",
        "investment": investment ?? "",
      });
      return 'Success';
    } catch (e) {
      return 'Failed';
    }
  }

  Future<String?> editInvestor({
    required BuildContext context,
    required bool formFilled,
    required String email,
    required String phone,
    required String companyName,
    required String aboutCompany,
    required String investment,
  }) async {
    QuerySnapshot querySnapshot;
    DocumentSnapshot document;
    try {
      querySnapshot = await investors.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        document = querySnapshot.docs.first;
        investors.doc(document.id).update({
          "form_filled": formFilled,
          "email": email,
          "phone": phone,
          "company_name": companyName,
          "about_company": aboutCompany,
          "investment": investment,
        });
        return 'Success';
      } else {
        return 'Something went wrong. Perhaps entered email did not match.';
      }
    } catch (e) {
      return 'Something went wrong. Perhaps entered email did not match.';
    }
  }

  Future<String?> editIndividual({
    required BuildContext context,
    required bool formFilled,
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String projectName,
    required String projectPurpose,
    required String aboutMe,
    required String investment,
  }) async {
    QuerySnapshot querySnapshot;
    DocumentSnapshot document;
    try {
      querySnapshot = await individuals.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        document = querySnapshot.docs.first;
        individuals.doc(document.id).update({
          "form_filled": formFilled,
          "name": name,
          "surname": surname,
          "email": email,
          "phone": phone,
          "project_name": projectName,
          "project_purpose": projectPurpose,
          "about_me": aboutMe,
          "investment": investment,
        });
        return 'Success';
      } else {
        return 'Something went wrong. Perhaps entered email did not match.';
      }
    } catch (e) {
      return 'Something went wrong. Perhaps entered email did not match.';
    }
  }

  Future<String?> editStudentCommunity({
    required BuildContext context,
    required bool formFilled,
    required String communityPresident,
    required String email,
    required String phone,
    required String communityName,
    required String communityPurpose,
    required String activities,
    required String investment,
  }) async {
    QuerySnapshot querySnapshot;
    DocumentSnapshot document;
    try {
      querySnapshot =
          await studentCommunity.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        document = querySnapshot.docs.first;
        studentCommunity.doc(document.id).update({
          "form_filled": formFilled,
          "community_president": communityPresident,
          "email": email,
          "phone": phone,
          "community_name": communityName,
          "community_purpose": communityPurpose,
          "activities": activities,
          "investment": investment,
        });
        return 'Success';
      } else {
        return 'Something went wrong. Perhaps entered email did not match.';
      }
    } catch (e) {
      return 'Something went wrong. Perhaps entered email did not match.';
    }
  }
}
