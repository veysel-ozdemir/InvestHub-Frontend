import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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

  final List<Map<String, dynamic>> _communityList = [
    {
      "id": "1",
      "image": "assets/image1.jpg",
      "community_name": "TechEnthusiasts",
      "community_purpose":
          "Connecting tech enthusiasts and fostering innovation",
      "community_president": "Alex Tech",
      "activities":
          "Engage in tech talks, participate in hackathons, and attend networking events.",
      "investment": "Supporting tech-related events and workshops",
      "email": "techenthusiasts@example.com",
      "phone": "+1 (234) 567-8901",
    },
    {
      "id": "2",
      "image": "assets/image2.jpg",
      "community_name": "ArtisansHub",
      "community_purpose": "Celebrating creativity and craftsmanship",
      "community_president": "Sophie Artisan",
      "activities":
          "Showcasing art exhibitions, hosting workshops, and organizing craft fairs.",
      "investment": "Promoting local artists and artisans",
      "email": "artisanshub@example.com",
      "phone": "+1 (345) 678-9012",
    },
    {
      "id": "3",
      "image": "assets/image3.jpg",
      "community_name": "HealthFirst",
      "community_purpose": "Promoting a healthy lifestyle and well-being",
      "community_president": "Dr. Emily Wellness",
      "activities":
          "Offering fitness classes, conducting health seminars, and organizing wellness retreats.",
      "investment": "Health and wellness programs for the community",
      "email": "healthfirst@example.com",
      "phone": "+1 (456) 789-0123",
    },
    {
      "id": "4",
      "image": "assets/image4.jpg",
      "community_name": "LanguageLearners",
      "community_purpose": "Exploring and mastering diverse languages together",
      "community_president": "Liam Linguist",
      "activities":
          "Participating in language workshops, engaging in language exchange, and attending cultural events.",
      "investment": "Language learning resources and events",
      "email": "languagelearners@example.com",
      "phone": "+1 (567) 890-1234",
    },
    {
      "id": "5",
      "image": "assets/image5.jpg",
      "community_name": "NatureExplorers",
      "community_purpose": "Appreciating and preserving the beauty of nature",
      "community_president": "Nina Naturalist",
      "activities":
          "Embarking on hiking trips, participating in environmental cleanup, and capturing nature through photography.",
      "investment": "Conservation projects and nature-related activities",
      "email": "natureexplorers@example.com",
      "phone": "+1 (678) 901-2345",
    },
    {
      "id": "6",
      "image": "assets/image6.jpg",
      "community_name": "BookwormsClub",
      "community_purpose":
          "Sharing the joy of reading and discussing literature",
      "community_president": "Oliver Reader",
      "activities":
          "Attending book club meetings, engaging in author talks, and participating in literary events.",
      "investment": "Promoting literacy and supporting local libraries",
      "email": "bookwormsclub@example.com",
      "phone": "+1 (789) 012-3456",
    },
    {
      "id": "7",
      "image": "assets/image7.jpg",
      "community_name": "CodeCrafters",
      "community_purpose":
          "Collaborating on coding projects and skill enhancement",
      "community_president": "Charlie Coder",
      "activities":
          "Joining coding bootcamps, contributing to open source projects, and participating in tech challenges.",
      "investment": "Supporting coding education and projects",
      "email": "codecrafters@example.com",
      "phone": "+1 (890) 123-4567",
    },
    {
      "id": "8",
      "image": "assets/image8.jpg",
      "community_name": "FoodieFiesta",
      "community_purpose":
          "Exploring diverse cuisines and culinary experiences",
      "community_president": "Fiona Foodie",
      "activities":
          "Indulging in food tasting events, attending cooking classes, and going on culinary tours.",
      "investment": "Promoting local restaurants and culinary events",
      "email": "foodiefiesta@example.com",
      "phone": "+1 (901) 234-5678",
    },
    {
      "id": "9",
      "image": "assets/image9.jpg",
      "community_name": "AdventureSeekers",
      "community_purpose": "Embarking on thrilling adventures and exploration",
      "community_president": "Andrew Adventurer",
      "activities":
          "Venturing on outdoor expeditions, participating in adventure sports, and sharing travel talks.",
      "investment": "Adventure-related equipment and events",
      "email": "adventureseekers@example.com",
      "phone": "+1 (012) 345-6789",
    },
    {
      "id": "10",
      "image": "assets/image10.jpg",
      "community_name": "MusicMinds",
      "community_purpose":
          "Sharing the love for music and discovering new genres",
      "community_president": "Melissa Musician",
      "activities":
          "Jamming in music sessions, attending concerts, and participating in music appreciation workshops.",
      "investment": "Supporting local musicians and music events",
      "email": "musicminds@example.com",
      "phone": "+1 (123) 456-7890",
    },
  ];
  List<Map<String, dynamic>> _foundCommunityList = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results;
    if (enteredKeyword.isEmpty) {
      results = _communityList;
    } else {
      results = _communityList
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
    _foundCommunityList = _communityList;
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
                  "Community Projects",
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
                itemCount: _foundCommunityList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.push(
                    RouteLocations.communityDetails,
                    extra: _foundCommunityList[index],
                  ),
                  child: Card(
                    shape: const BeveledRectangleBorder(),
                    key: ValueKey(_foundCommunityList[index]['id']),
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
                                    _foundCommunityList[index]
                                        ["community_name"],
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
                                    _foundCommunityList[index]
                                        ["community_purpose"],
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
            ),
          ],
        ),
      ),
    );
  }
}
