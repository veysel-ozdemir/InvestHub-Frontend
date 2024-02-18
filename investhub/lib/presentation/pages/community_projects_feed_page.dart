import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/data/community_data.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';
import 'package:investhub/route/route_location.dart';

class CommunityProjectsFeedPage extends ConsumerStatefulWidget {
  const CommunityProjectsFeedPage({super.key});

  static CommunityProjectsFeedPage builder(
          BuildContext context, GoRouterState state) =>
      const CommunityProjectsFeedPage();

  @override
  ConsumerState<CommunityProjectsFeedPage> createState() =>
      _CommunityProjectsFeedPageState();
}

class _CommunityProjectsFeedPageState
    extends ConsumerState<CommunityProjectsFeedPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _foundCommunityList = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results;
    if (enteredKeyword.isEmpty) {
      results = communityList;
    } else {
      results = communityList
          .where((community) => community["community_name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundCommunityList = results;
    });
  }

  @override
  void initState() {
    _foundCommunityList = communityList;
    super.initState();
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
            onPressed: () => context.push(RouteLocations.investorProfile),
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
                  "Community Projects",
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
                  onTap: () => context.push(
                    RouteLocations.communityDetails,
                    extra: _foundCommunityList[index],
                  ),
                  child: Card(
                    shape: const BeveledRectangleBorder(),
                    key: ValueKey(_foundCommunityList[index]['id']),
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
                                    _foundCommunityList[index]
                                        ["community_name"],
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
                                    _foundCommunityList[index]
                                        ["community_purpose"],
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
