// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/cloud/cloud_service.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/data/models/investor_model.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';
import 'package:investhub/provider/investor_email_provider.dart';
import 'package:investhub/route/route_location.dart';
import 'package:investhub/utils/extensions.dart';

class InvestorProfilePage extends ConsumerStatefulWidget {
  final bool firstEntry;
  const InvestorProfilePage({
    super.key,
    required this.firstEntry,
  });

  static InvestorProfilePage builder(
          BuildContext context, GoRouterState state) =>
      InvestorProfilePage(
        firstEntry: state.extra as bool,
      );

  @override
  ConsumerState<InvestorProfilePage> createState() =>
      _InvestorProfilePageState();
}

class _InvestorProfilePageState extends ConsumerState<InvestorProfilePage> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController investmentController = TextEditingController();

  Future<void> _fetchData(String investorEmail) async {
    QuerySnapshot querySnapshot;
    DocumentSnapshot document;
    try {
      querySnapshot = await CloudService()
          .investors
          .where('email', isEqualTo: investorEmail)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        document = querySnapshot.docs.first;

        InvestorModel investorModel =
            InvestorModel.fromMap(document.data() as Map<String, dynamic>);

        setState(() {
          companyNameController.text = investorModel.companyName;
          emailController.text = investorModel.email;
          phoneController.text = investorModel.phone;
          aboutController.text = investorModel.aboutCompany;
          investmentController.text = investorModel.investment;
        });
        print('Success');
      } else {
        print('Something went wrong. Perhaps entered email did not match.');
      }
    } catch (e) {
      print('Something went wrong.\n$e');
    }
  }

  @override
  void initState() {
    super.initState();
    if (!widget.firstEntry) {
      final investorEmail = ref.read(investorEmailProvider);
      _fetchData(investorEmail);
    }
  }

  @override
  void dispose() {
    super.dispose();
    companyNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    aboutController.dispose();
    investmentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return Scaffold(
      backgroundColor: ColorPalette.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        leading: Visibility(
          visible: !widget.firstEntry,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: ColorPalette.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: deviceSize.height * 0.2,
                  width: deviceSize.width * 0.4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPalette.black,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 130,
                    color: ColorPalette.white,
                  ),
                ),
                const Gap(15),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 2,
                          controller: companyNameController,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ColorPalette.grey,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(15),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorPalette.black,
                              ),
                              child: const Icon(
                                Icons.edit_document,
                                color: ColorPalette.white,
                                size: 18,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: SizedBox(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'Change Your Name',
                                    style: TextStyle(
                                      color: ColorPalette.black,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Gap(15),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.black,
                        ),
                        child: const Icon(
                          Icons.edit_document,
                          color: ColorPalette.white,
                          size: 18,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Change Your Profile Photo',
                              style: TextStyle(
                                color: ColorPalette.black,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.black,
                        ),
                        child: const Icon(
                          Icons.edit_document,
                          color: ColorPalette.white,
                          size: 18,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Change Your Password',
                              style: TextStyle(
                                color: ColorPalette.black,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(30),
            TextFormField(
              controller: emailController,
              style: const TextStyle(
                color: ColorPalette.black,
                fontSize: 16,
              ),
              maxLines: 1,
              cursorColor: ColorPalette.black,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                labelText: "EMAIL:",
                labelStyle: TextStyle(
                  color: ColorPalette.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: phoneController,
              style: const TextStyle(
                color: ColorPalette.black,
                fontSize: 16,
              ),
              maxLines: 1,
              cursorColor: ColorPalette.black,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                labelText: "PHONE NUMBER:",
                labelStyle: TextStyle(
                  color: ColorPalette.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: aboutController,
              style: const TextStyle(
                color: ColorPalette.black,
                fontSize: 16,
              ),
              maxLines: 2,
              cursorColor: ColorPalette.black,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                labelText: "ABOUT THE COMPANY:",
                labelStyle: TextStyle(
                  color: ColorPalette.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: investmentController,
              style: const TextStyle(
                color: ColorPalette.black,
                fontSize: 16,
              ),
              maxLines: 2,
              cursorColor: ColorPalette.black,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                labelText: "THE INVESTMENT WE ARE LOOKING FOR:",
                labelStyle: TextStyle(
                  color: ColorPalette.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () async {
                  if (companyNameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      aboutController.text.isEmpty ||
                      investmentController.text.isEmpty) {
                    AppAlert.showAnimatedDialog(
                      context: context,
                      message: "Please fill all the blanks.",
                      backgroundColor: ColorPalette.grey,
                      textColor: ColorPalette.black,
                    );
                  } else {
                    final message = await CloudService().editInvestor(
                      context: context,
                      formFilled: true,
                      email: emailController.text,
                      companyName: companyNameController.text,
                      aboutCompany: aboutController.text,
                      investment: investmentController.text,
                      phone: phoneController.text,
                    );
                    if (message!.contains('Success')) {
                      if (widget.firstEntry) {
                        ref
                            .read(investorEmailProvider.notifier)
                            .updateEmail(emailController.text);
                      }
                      context.go(RouteLocations.investorHome);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            message,
                            style: const TextStyle(
                              color: ColorPalette.white,
                            ),
                          ),
                          backgroundColor: ColorPalette.black,
                        ),
                      );
                    }
                  }
                },
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll(
                    BorderSide(
                      style: BorderStyle.solid,
                      color: ColorPalette.black,
                    ),
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                  ),
                ),
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                    color: ColorPalette.black,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
