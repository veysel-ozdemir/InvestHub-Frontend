import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';

class IndividualProjectsFeedPage extends ConsumerStatefulWidget {
  const IndividualProjectsFeedPage({super.key});

  static IndividualProjectsFeedPage builder(
          BuildContext context, GoRouterState state) =>
      const IndividualProjectsFeedPage();

  @override
  ConsumerState<IndividualProjectsFeedPage> createState() =>
      _CommunityProjectsFeedPageState();
}

class _CommunityProjectsFeedPageState
    extends ConsumerState<IndividualProjectsFeedPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _projectList = [
    {
      "id": "1",
      "image": "the image asset 1",
      "project_name": "TechConnect",
      "project_purpose": "Bringing tech enthusiasts together for innovation"
    },
    {
      "id": "2",
      "image": "the image asset 2",
      "project_name": "CreativeCrafters",
      "project_purpose": "Fostering creativity and craftsmanship"
    },
    {
      "id": "3",
      "image": "the image asset 3",
      "project_name": "WellnessWave",
      "project_purpose": "Promoting a healthy lifestyle and well-being"
    },
    {
      "id": "4",
      "image": "the image asset 4",
      "project_name": "LinguisticExplorers",
      "project_purpose": "Exploring and mastering diverse languages together"
    },
    {
      "id": "5",
      "image": "the image asset 5",
      "project_name": "NaturePreservers",
      "project_purpose": "Appreciating and preserving the beauty of nature"
    },
    {
      "id": "6",
      "image": "the image asset 6",
      "project_name": "BookWonders",
      "project_purpose": "Sharing the joy of reading and discussing literature"
    },
    {
      "id": "7",
      "image": "the image asset 7",
      "project_name": "CodeCollaborators",
      "project_purpose":
          "Collaborating on coding projects and skill enhancement"
    },
    {
      "id": "8",
      "image": "the image asset 8",
      "project_name": "CulinaryExplorers",
      "project_purpose": "Exploring diverse cuisines and culinary experiences"
    },
    {
      "id": "9",
      "image": "the image asset 9",
      "project_name": "AdventureQuest",
      "project_purpose": "Embarking on thrilling adventures and exploration"
    },
    {
      "id": "10",
      "image": "the image asset 10",
      "project_name": "MelodyDiscoverers",
      "project_purpose": "Sharing the love for music and discovering new genres"
    },
  ];
  List<Map<String, dynamic>> _foundProjectList = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results;
    if (enteredKeyword.isEmpty) {
      results = _projectList;
    } else {
      results = _projectList
          .where((community) => community["project_name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundProjectList = results;
    });
  }

  @override
  void initState() {
    _foundProjectList = _projectList;
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          onChanged: (value) => _runFilter(value),
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        actions: [
          IconButton.outlined(
            onPressed: () => AppAlert.showAnimatedDialog(
              context: context,
              message: "Coming soon...",
              backgroundColor: Colors.grey,
              textColor: Colors.black,
            ),
            icon: const Icon(
              Icons.mail,
              color: Colors.white,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.black,
              ),
            ),
          ),
          IconButton.outlined(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.black,
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
                  "Individual Projects",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _foundProjectList.length,
                itemBuilder: (context, index) => Card(
                  shape: const BeveledRectangleBorder(),
                  key: ValueKey(_foundProjectList[index]['id']),
                  color: Colors.grey[350],
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
                            color: Colors.grey,
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
                                  _foundProjectList[index]["project_name"],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  _foundProjectList[index]["project_purpose"],
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
