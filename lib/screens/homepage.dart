import 'package:doctorplant/screens/marketprices.dart';
import 'package:doctorplant/screens/restricted.dart';
import 'package:doctorplant/screens/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, String>> _persons = [
    {
      'name': 'Madhav Bhayani (Team Leader)',
      'designation': 'Full Stack Developer & DBA',
      'imageUrl': 'assets/profile/madhav.jpg',
    },
    {
      'name': 'Dev Bhuva',
      'designation': 'AI Model Developer',
      'imageUrl': 'assets/profile/dev.jpg',
    },
    {
      'name': 'Mehal Rojasara',
      'designation': 'UI/UX Designer & Tutorials',
      'imageUrl': 'assets/profile/mehal.jpg',
    },
    {
      'name': 'Pushti Bagaria',
      'designation': 'Application Presentator',
      'imageUrl': 'assets/profile/pushti2.jpg',
    },
    {
      'name': 'Alis Gajera',
      'designation': 'Application Presentator',
      'imageUrl': 'assets/profile/alis.jpg',
    },
  ];

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        showDragHandle: true,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      // child: Image.network(
                      //
                      //   scale: 15,
                      // ),
                      child: Image.asset(
                        'assets/logo.png',
                        scale: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Center(
                      child: Text(
                        'Doctor Plant\nAn Innovative Application',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(
                        'Introducing Doctor Plant, the AI-powered application revolutionizing plant care. Swiftly diagnose and cure plant diseases with cutting-edge AI algorithms. Receive tailored cultivation tips, smart techniques, and real-time weather information. Join a vibrant community of plant pathologists for shared expertise. Access a comprehensive database on pests and diseases. Doctor Plant is your intelligent, user-friendly companion for cultivating thriving green spaces. Download now and embark on a journey.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        'Problem V/S Solution',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(
                        'Problem : To identify and diagnose diseases in plants and crops, aiming to provide an efficient and accurate solution for disease management in agriculture.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(
                        'Solution : "We propose the development of a native application with AI-based image recognition for plant and crop disease diagnosis." This app provides instant disease identification, treatment recommendations, and prevention tips. If the AI can\'t diagnose, users can submit images to a community of experts for assistance.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Future _developteam(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  scale: 15,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const Center(
                child: Text(
                  'Doctor Plant\nApplication Development Team',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: ListView.builder(
                      itemCount: _persons.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          style: ListTileStyle.drawer,
                          leading: SizedBox(
                            width: 80,
                            height: 130,
                            child: CircleAvatar(
                                backgroundImage:
                                    // NetworkImage(_persons[index]['imageUrl']!),
                                    AssetImage(_persons[index]['imageUrl']!)),
                          ),
                          title: Text(
                            _persons[index]['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(_persons[index]['designation']!),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/logo.png',
          scale: 20,
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        forceMaterialTransparency: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Card(
                    elevation: 0,

                    // color: Color(0xffA2D9A6),
                    color: const Color(0xffB2E7B6),
                    // color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/logo.png',
                              scale: 8,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Text(
                                        'Welcome To \nDoctor Plant !',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 120,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xff68F072),
                                    ),
                                    onPressed: () {
                                      _displayBottomSheet(context);
                                    },
                                    child: const FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        'About App',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Heal Your Crop With Doctor Plant',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/scan.png',
                                      scale: 6,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10.0, left: 5),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Text(
                                          'Scan Your Crop',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/medicine2.png',
                                      scale: 6,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10.0, left: 5),
                                      child: Text(
                                        'Process with AI',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/diagnosis2.png',
                                      scale: 6,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10.0, left: 5),
                                      child: Text(
                                        'Get Diagnosis',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xff68F072),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const RestrictedScreen()),
                                    ),
                                  );
                                },
                                child: const FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'Scan Your Image',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Our Services & Offerings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            child: Card(
                              elevation: 5,
                              color: const Color(0xffF3F360),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WeatherScreen()));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RestrictedScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/rain.png',
                                        scale: 10,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Get Weather',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: ((context) =>
                                //             const Marketprices())));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RestrictedScreen()));
                              },
                              child: Card(
                                elevation: 5,
                                color: const Color(0xff7FEFEA),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/brand.png',
                                        scale: 10,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Daily Market Prices',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => DiseaseInfo(),
                                //   ),
                                // );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RestrictedScreen()));
                              },
                              child: Card(
                                elevation: 5,
                                color: const Color(0xffFC98F3),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/file-case.png',
                                        scale: 10,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Diseases Study',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            child: Card(
                              elevation: 5,
                              color: const Color(0xffEF7F7F),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RestrictedScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/presentation.png',
                                        scale: 10,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Tutorials',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
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
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Our Assets & Our Team',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 9,
                  child: Card(
                      elevation: 5,
                      color: const Color.fromARGB(255, 130, 255, 138),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/allocation.png',
                                scale: 5,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'View Our Team Assets',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 9,
                  child: GestureDetector(
                    onTap: () {
                      _developteam(context);
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color.fromARGB(255, 130, 255, 138),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/developer.png',
                              scale: 5,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                'Application Development Team',
                                textScaler: TextScaler.linear(0.9),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
