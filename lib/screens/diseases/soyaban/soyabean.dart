import 'package:flutter/material.dart';

class Soyabean extends StatelessWidget {
  final List soyabean = [
    {
      'image': 'assets/diseaseStudy/soyabean_bactrial_blight.jpg',
      'name': 'Bacterial Blight',
      'diseases':
          'Bacterial Blight, Downy Mildew, Mosaic Virus, Powdery Mildew, Rust, Southern Blight',
    },
    {
      'image': 'assets/diseaseStudy/soyabean_downy_mildew.jpg',
      'name': 'Downy Mildew',
      'diseases':
          'Algal Leaf, Anthracnose, Bird Eye Spot, Brown Blight, Red Leaf Spot',
    },
    {
      'image': 'assets/diseaseStudy/soyabean_mosaic_virus.jpeg',
      'name': 'Mosaic Virus',
      'diseases': 'Red Rot, Red Stripe, Rust',
    },
    {
      'image': 'assets/diseaseStudy/soyabean_rust.jpg',
      'name': 'Rust',
      'diseases': 'Black Measles, Black rot, Isariopsis Leaf Spot',
    },
    {
      'image': 'assets/diseaseStudy/soyabean_southern_blight.jpg',
      'name': 'Southern Blight',
      'diseases': 'Brown Rust, Septoria, Yellow Rust',
    },
  ];
  Soyabean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'Soyabean',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Lexend'),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',
            scale: 10,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: soyabean.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Soyabean()));
                                  break;
                                case 1:
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Soyabean()));
                                  break;
                                case 2:
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Soyabean()));
                                  break;
                                case 3:
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Soyabean()));
                                  break;
                                case 4:
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Soyabean()));
                                  break;
                                case 5:
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Soyabean()));
                                  break;
                                default:
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.redAccent,
                                    content: Text(
                                        'Aww ! Snap Page is not yet ready.'),
                                  ));
                              }
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 4,
                              margin: const EdgeInsets.all(8),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                side: BorderSide.none,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: Image.asset(
                                      soyabean[index]['image'],
                                      fit: BoxFit.cover,
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              soyabean[index]['name'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              soyabean[index]['diseases'],
                                              style:
                                                  const TextStyle(fontSize: 10),
                                              textScaler:
                                                  const TextScaler.linear(0.75),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
