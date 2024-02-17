import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';
import 'package:investhub/route/route_location.dart';

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
      "image": "assets/image1.jpg",
      "project_name": "GreenScape Initiative",
      "project_purpose": "Creating sustainable urban green spaces",
      "name": "Alice",
      "surname": "Johnson",
      "about_me": "Passionate environmentalist and urban planner",
      "investment": "To implement green infrastructure and plant native trees",
      "email": "alice.johnson@example.com",
      "phone": "+1 (123) 456-7890",
    },
    {
      "id": "2",
      "image": "assets/image2.jpg",
      "project_name": "TechHub Innovation",
      "project_purpose": "Fostering tech innovation in underserved communities",
      "name": "Bob",
      "surname": "Anderson",
      "about_me": "Tech enthusiast and community advocate",
      "investment": "Supporting technology education and startup incubation",
      "email": "bob.anderson@example.com",
      "phone": "+1 (234) 567-8901",
    },
    {
      "id": "3",
      "image": "assets/image3.jpg",
      "project_name": "HealthyBites Food Network",
      "project_purpose": "Promoting access to nutritious food for all",
      "name": "Charlie",
      "surname": "Smith",
      "about_me": "Nutritionist and community health advocate",
      "investment": "Building community gardens and supporting local farmers",
      "email": "charlie.smith@example.com",
      "phone": "+1 (345) 678-9012",
    },
    {
      "id": "4",
      "image": "assets/image4.jpg",
      "project_name": "TechForGood Foundation",
      "project_purpose": "Harnessing technology to address social challenges",
      "name": "David",
      "surname": "Wong",
      "about_me": "Tech entrepreneur and philanthropist",
      "investment": "Developing tech solutions for social impact",
      "email": "david.wong@example.com",
      "phone": "+1 (456) 789-0123",
    },
    {
      "id": "5",
      "image": "assets/image5.jpg",
      "project_name": "EducationEmpower",
      "project_purpose": "Providing quality education in remote areas",
      "name": "Elena",
      "surname": "Martinez",
      "about_me": "Educator and advocate for equal education",
      "investment": "Building schools and providing educational resources",
      "email": "elena.martinez@example.com",
      "phone": "+1 (567) 890-1234",
    },
    {
      "id": "6",
      "image": "assets/image6.jpg",
      "project_name": "CleanWater Initiative",
      "project_purpose": "Ensuring access to clean water in rural communities",
      "name": "Frank",
      "surname": "Davis",
      "about_me": "Water engineer and humanitarian",
      "investment": "Installing water purification systems and wells",
      "email": "frank.davis@example.com",
      "phone": "+1 (678) 901-2345",
    },
    {
      "id": "7",
      "image": "assets/image7.jpg",
      "project_name": "ArtisticExpressions Studio",
      "project_purpose": "Empowering local artists and promoting creativity",
      "name": "Grace",
      "surname": "Taylor",
      "about_me": "Artist and community cultural ambassador",
      "investment": "Establishing art studios and supporting local artists",
      "email": "grace.taylor@example.com",
      "phone": "+1 (789) 012-3456",
    },
    {
      "id": "8",
      "image": "assets/image8.jpg",
      "project_name": "RenewableEnergy Solutions",
      "project_purpose": "Transitioning to sustainable and renewable energy",
      "name": "Henry",
      "surname": "Brown",
      "about_me": "Renewable energy expert and environmentalist",
      "investment": "Developing solar and wind energy projects",
      "email": "henry.brown@example.com",
      "phone": "+1 (890) 123-4567",
    },
    {
      "id": "9",
      "image": "assets/image9.jpg",
      "project_name": "YouthEmpowerment Network",
      "project_purpose": "Empowering youth through education and mentorship",
      "name": "Ivy",
      "surname": "Jones",
      "about_me": "Youth advocate and mentor",
      "investment": "Providing scholarships and mentorship programs",
      "email": "ivy.jones@example.com",
      "phone": "+1 (901) 234-5678",
    },
    {
      "id": "10",
      "image": "assets/image10.jpg",
      "project_name": "GlobalHealth Access Initiative",
      "project_purpose": "Improving healthcare access in underserved regions",
      "name": "Jack",
      "surname": "Roberts",
      "about_me": "Medical professional and public health advocate",
      "investment": "Establishing clinics and providing medical supplies",
      "email": "jack.roberts@example.com",
      "phone": "+1 (789) 012-3456",
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
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.push(
                    RouteLocations.projectDetails,
                    extra: _foundProjectList[index],
                  ),
                  child: Card(
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
            ),
          ],
        ),
      ),
    );
  }
}
