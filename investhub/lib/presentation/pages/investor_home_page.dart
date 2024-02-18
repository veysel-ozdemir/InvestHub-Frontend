import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/data/community_data.dart';
import 'package:investhub/data/individual_project_data.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';
import 'package:investhub/route/route_location.dart';

class InvestorHomePage extends ConsumerStatefulWidget {
  const InvestorHomePage({super.key});

  static InvestorHomePage builder(BuildContext context, GoRouterState state) =>
      const InvestorHomePage();

  @override
  ConsumerState<InvestorHomePage> createState() => _InvestorHomePageState();
}

class _InvestorHomePageState extends ConsumerState<InvestorHomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _foundCommunityList = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> communityResults;
    List<Map<String, dynamic>> projectResults;
    List<Map<String, dynamic>> mergedResults = [];

    if (enteredKeyword.isEmpty) {
      communityResults = communityList;
      projectResults = projectList;
    } else {
      communityResults = communityList
          .where((community) => community["community_name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      projectResults = projectList
          .where((project) => project["project_name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    for (int i = 0;
        i < max(communityResults.length, projectResults.length);
        i++) {
      if (i < communityResults.length) {
        mergedResults.add(communityResults[i]);
      }

      if (i < projectResults.length) {
        mergedResults.add(projectResults[i]);
      }
    }

    setState(() {
      _foundCommunityList = mergedResults;
    });
  }

  @override
  void initState() {
    super.initState();
    List<Map<String, dynamic>> communityResults = communityList;
    List<Map<String, dynamic>> projectResults = projectList;
    List<Map<String, dynamic>> mergedResults = [];

    for (int i = 0;
        i < max(communityResults.length, projectResults.length);
        i++) {
      if (i < communityResults.length) {
        mergedResults.add(communityResults[i]);
      }

      if (i < projectResults.length) {
        mergedResults.add(projectResults[i]);
      }
    }

    _foundCommunityList = mergedResults;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        title: TextField(
          controller: _searchController,
          onChanged: (value) => _runFilter(value),
          cursorColor: ColorPalette.black,
          decoration: const InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(
              Icons.search,
              color: ColorPalette.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.black),
            ),
          ),
        ),
        actions: [
          IconButton.outlined(
            onPressed: () => AppAlert.showAnimatedDialog(
              context: context,
              message: "Coming soon...",
              backgroundColor: ColorPalette.grey,
              textColor: ColorPalette.black,
            ),
            icon: const Icon(
              Icons.mail,
              color: ColorPalette.white,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                ColorPalette.black,
              ),
            ),
          ),
          IconButton.outlined(
            onPressed: () => context.push(
              RouteLocations.investorProfile,
              extra: false,
            ),
            icon: const Icon(
              Icons.person,
              color: ColorPalette.white,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                ColorPalette.black,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Community/Individual Projects",
                  style: TextStyle(
                    color: ColorPalette.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _foundCommunityList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () =>
                      _foundCommunityList[index]['state'] == 'community'
                          ? context.push(
                              RouteLocations.communityDetails,
                              extra: _foundCommunityList[index],
                            )
                          : context.push(
                              RouteLocations.projectDetails,
                              extra: _foundCommunityList[index],
                            ),
                  child: Card(
                    shape: const BeveledRectangleBorder(),
                    key: ValueKey(index),
                    color: ColorPalette.lightGrey,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorPalette.grey,
                            ),
                            child: const Icon(
                              Icons.image,
                              size: 60,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    _foundCommunityList[index]['state'] ==
                                            'community'
                                        ? _foundCommunityList[index]
                                            ["community_name"]
                                        : _foundCommunityList[index]
                                            ["project_name"],
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: ColorPalette.black,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Gap(8),
                                  Text(
                                    _foundCommunityList[index]['state'] ==
                                            'community'
                                        ? _foundCommunityList[index]
                                            ["community_purpose"]
                                        : _foundCommunityList[index]
                                            ["project_purpose"],
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: ColorPalette.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
