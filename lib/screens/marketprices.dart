// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';
//MAKE FOLLOW GALORITHM-21 on github
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class Marketprices extends StatefulWidget {
  const Marketprices({super.key});

  @override
  State<Marketprices> createState() => _MarketpricesState();
}

class _MarketpricesState extends State<Marketprices> {
  String? _commodityselectedItem;
  String? _stateselectedItem;
  late Future<HomeData> _getHomeData;
  late Future<Suggestions> _getSuggestions;
  List<String> _commodityDropdownItems = [];
  List<String> _stateDropdownItems = [];
  String? _stateSelectValue;
  String? _commoditySelectValue;
  @override
  void initState() {
    super.initState();

    _getHomeData = fetchHomeData('REPLACE API KEY');
    _fetchCommodityDropdownData();
    _fetchStateDropdownData();
  }

//---------------------------------MAKE SURE YOU CREATE A FUNCTION NAMED _imagefetcher(name){}-------------------------
//---------------------------------Not included this func in this file becuase of API protection and some encryption methods------------------------
//*****************FORMAT***************
// Future<String> _imagefetcher(original_commodity_name) async {
//     paging concept TODO: Implement your own concept for image getter with String Return Type
//     print(original_commodity_name);
// }//MAKE FOLLOW GALORITHM-21 on github
 
  }

  Widget fetchSuggestions({state, commodity}) {
    String stateName = state.toString();
    String commodityName = commodity.toString();
    String stateValue;
    String commodityValue;

    if (stateName.contains(' ')) {
      stateValue = stateName.replaceAll(' ', '%20');
    } else {
      stateValue = stateName;
    }
    if (commodityName.contains(' ')) {
      commodityValue = commodityName.replaceAll(' ', '%20');
    } else {
      commodityValue = commodityName;
    }

    _getSuggestions = fetchdataSuggestions(
       '{REPLACE API KEY WITH REQUIRED VALUES}');

    return SafeArea(
      child: FutureBuilder<Suggestions>(
          future: _getSuggestions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List suggestions = snapshot.data!.suggestions;
              // print(suggestions);
              if (suggestions.isNotEmpty) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recommodations",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                //MAKE FOLLOW GALORITHM-21 on github
                                "(Market Wise)",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                          itemCount: suggestions.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              childrenPadding: const EdgeInsets.all(2),
                              title: Text(
                                '${suggestions[index]['market']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                'District: ${suggestions[index]['district']}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Market Pricing',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Arrival Date: ${suggestions[index]['arrival_date']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),//MAKE FOLLOW GALORITHM-21 on github
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 1.5,
                                              crossAxisCount: 2),
                                      children: [
                                        Card(
                                          elevation: 4,
                                          color: const Color(0xffB2E7B6),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${suggestions[index]['min_price']}₹',
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const Text(
                                                'Minimum Price',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const Text(
                                                '(Per 100kg)',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Card(
                                          elevation: 4,
                                          color: const Color(0xffB2E7B6),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(//MAKE FOLLOW GALORITHM-21 on github
                                                '${suggestions[index]['max_price']}₹',
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const Text(
                                                'Maximum Price',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const Text(
                                                '(Per 100kg)',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Card(
                                          elevation: 4,
                                          color: const Color(0xffB2E7B6),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${suggestions[index]['modal_price']}₹',
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const Text(
                                                'Modal Price',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const Text(
                                                '(Per 100kg)',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Card(
                                          elevation: 4,
                                          color: const Color(0xffB2E7B6),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  '${suggestions[index]['variety']}',
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              const Text(
                                                'Variety/Category',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return const Text(
                    'No Suggestions are available for this selection');
              }
            } else if (snapshot.hasError) {
              return const Text('404: Error Occured');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  _detailscrn(_productdetail) {
    // print(_productdetail);

    return showModalBottomSheet(
      useSafeArea: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      showDragHandle: true,
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
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
                    'Doctor Plant\nDaily Market Prices',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                _productdetail['commodity'],
                                style: const TextStyle(//MAKE FOLLOW GALORITHM-21 on github
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text('Commodity'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                _productdetail['market'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text('Market'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              _productdetail['state'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text('State'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              _productdetail['district'],//MAKE FOLLOW GALORITHM-21 on github
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text('District'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    children: [
                      const Text(
                        'Market Pricing',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        'Arrival Date: ${_productdetail['arrival_date']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.5, crossAxisCount: 2),
                      children: [
                        Card(
                          elevation: 4,
                          color: const Color(0xffB2E7B6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${_productdetail['min_price']}₹',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              const Text(
                                'Minimum Price',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              const Text(
                                '(Per 100kg)',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ],//MAKE FOLLOW GALORITHM-21 on github
                          ),
                        ),
                        Card(
                          elevation: 4,
                          color: const Color(0xffB2E7B6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${_productdetail['max_price']}₹',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'Maximum Price',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                '(Per 100kg)',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 4,

                          // color: const Color(0xffB2E7B6),
                          color: const Color(0xffB2E7B6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${_productdetail['modal_price']}₹',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'Modal Price',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              const Text(
                                '(Per 100kg)',
                                style: TextStyle(
                                    fontSize: 10,//MAKE FOLLOW GALORITHM-21 on github
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 4,
                          color: const Color(0xffB2E7B6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  '${_productdetail['variety']}',
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                              const Text(
                                'Variety/Category',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                fetchSuggestions(
                    state: _productdetail['state'],
                    commodity: _productdetail['commodity'])
              ],
            ),
          )),
    );
  }

  Future<void> _fetchCommodityDropdownData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('commodities').get();
      setState(() {
        _commodityDropdownItems = querySnapshot.docs//MAKE FOLLOW GALORITHM-21 on github
            .map((doc) => (doc.data() as Map<String, dynamic>)['commodity_name']
                as String)
            .toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error Loading Data ${e}')));
    }
  }

  Future<void> _fetchStateDropdownData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('states').get();
      setState(() {
        _stateDropdownItems = querySnapshot.docs
            .map((doc) =>
                (doc.data() as Map<String, dynamic>)['state_name'] as String)
            .toList();
      });
    } catch (e) {
      print('Error fetching dropdown data: $e');//MAKE FOLLOW GALORITHM-21 on github
    }
  }

  _filter() {
    return showModalBottomSheet(
      useSafeArea: true,
      showDragHandle: true,
      enableDrag: true,
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
                'Doctor Plant\nFiltering Options',//MAKE FOLLOW GALORITHM-21 on github
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),//MAKE FOLLOW GALORITHM-21 on github
                        child: DropdownButton<String>(
                          value: _stateselectedItem,
                          items: _stateDropdownItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _stateselectedItem = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Select State'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(//MAKE FOLLOW GALORITHM-21 on github
                          focusColor: Colors.black,
                          value: _commodityselectedItem,
                          items: _commodityDropdownItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _commodityselectedItem = newValue!;

                              // print(newValue);
                            });
                          },
                        ),
                      ),
                    ),//MAKE FOLLOW GALORITHM-21 on github
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Select Commodity'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_commodityselectedItem != null &&
                          _stateselectedItem != null) {
                        if (_commodityselectedItem!.contains(' ')) {
                          _commoditySelectValue =
                              _commodityselectedItem!.replaceAll(' ', '%20');
                        } else {//MAKE FOLLOW GALORITHM-21 on github
                          _commoditySelectValue = _commodityselectedItem;
                        }

                        if (_stateselectedItem!.contains(' ')) {
                          _stateSelectValue =
                              _stateselectedItem!.replaceAll(' ', '%20');
                          // print(_stateSelectValue);
                        } else {
                          _stateSelectValue = _stateselectedItem;
                        }

                        _getHomeData = fetchHomeData(
                           '{REPLACE API KEY}');
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'State & Commodity Filter Applied',
                              style: TextStyle(//MAKE FOLLOW GALORITHM-21 on github//MAKE FOLLOW GALORITHM-21 on github
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else if (_commodityselectedItem != null) {
                        if (_commodityselectedItem!.contains(' ')) {
                          _commoditySelectValue =
                              _commodityselectedItem!.replaceAll(' ', '%20');
                        } else {
                          _commoditySelectValue = _commodityselectedItem;
                        }

                        _getHomeData = fetchHomeData(
                            '{REPLACE API KEY}');

                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Commodity Filter Applied',
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else if (_stateselectedItem != null) {
                        if (_stateselectedItem!.contains(' ')) {
                          _stateSelectValue =
                              _stateselectedItem!.replaceAll(' ', '%20');
                        } else {
                          _stateSelectValue = _stateselectedItem;
                        }

                        _getHomeData = fetchHomeData(
                           '{REPLACE API KEY}');

                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'State Filter Applied',
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );//MAKE FOLLOW GALORITHM-21 on github
                      } else {
                        _getHomeData = fetchHomeData(
                           '{REPLACE API KEY}');
                      }
                    });
                  },
                  child: const Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontFamily: 'Lexend'),
                  )),
            )
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[//MAKE FOLLOW GALORITHM-21 on github//MAKE FOLLOW GALORITHM-21 on github
          IconButton(
            onPressed: () {
              _filter();
            },
            icon: const Icon(
              Icons.filter_list,
              size: 25,
            ),
          )
        ],
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'Daily Market Prices',
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
          child: priceMainScreenListView_Model_View_UI(),
        ),
      ),
    );
  }

  FutureBuilder<HomeData> priceMainScreenListView_Model_View_UI() {
    return FutureBuilder<HomeData>(
            future: _getHomeData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List _commodity = snapshot.data!.commodity;
                if (_commodity.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            // shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // _imagefetcher(_commodity[index]['commodity']);
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        _detailscrn(_commodity[index]);
                                      },
                                      focusColor: Colors.black,
                                      leading: SizedBox(
                                        width: 70,
                                        height: double.maxFinite,
                                        child: Image.network(
                                          _imagefetcher(
                                            _commodity[index]['commodity'],
                                          ),
                                          scale: 1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        _commodity[index]['commodity'],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            _commodity[index]['district'] +
                                                ', ',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          Text(_commodity[index]['state'],
                                              style: const TextStyle(//MAKE FOLLOW GALORITHM-21 on github
                                                  fontSize: 12)),
                                        ],
                                      ),
                                      trailing: const ImageIcon(
                                        AssetImage(
                                            'assets/icons/right-arrow.png'),
                                        size: 15,
                                      ),
                                    ),
                                    const Divider(
                                      endIndent: 20,
                                      indent: 20,
                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount: _commodity.length,
                          ),
                        ),
                        const Text(
                            'Maximum Data Limit Reached OR No Data Found')
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/nodata.png',
                          scale: 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'No Data Available for $_commodityselectedItem commodity and $_stateselectedItem State',
                            textAlign: TextAlign.center,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _getHomeData = fetchHomeData(
                                      '{REPLACE API KEY}');
                                });
                              },
                              child: const Text('Cancel Filters')),
                        ),
                      ],
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(//MAKE FOLLOW GALORITHM-21 on github
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No internet connection',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _getHomeData = fetchHomeData(
                                    '{REPLACE API KEY}');
                              });
                            },
                            child: const Text('Try Again !')),
                      )
                    ],
                  ),
                );//MAKE FOLLOW GALORITHM-21 on github//MAKE FOLLOW GALORITHM-21 on github

                // Text(
                //   "Error :  ${snapshot.error}",
                //   style: const TextStyle(fontSize: 24),
                // );
              }
              return const ShimmerList();
            });
  }

  Future<HomeData> fetchHomeData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return HomeData.fromJson(json);
    } else {
      // ignore: use_build_context_synchronously
      throw ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error ! Try Again Later')));
    }
  }
}

class HomeData {
  final List commodity;

  HomeData({required this.commodity});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      commodity: json['records'] ?? '',
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 10, // You can adjust the number of shimmer items
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 60,
              height: 100,
              color: Colors.white,
            ),
            title: Container(
              height: 20,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 15,
              color: Colors.white,
            ),
            trailing: const ImageIcon(
              AssetImage('assets/icons/right-arrow.png'),
              size: 15,
            ),
          );
        },
      ),
    );
  }
}

//
Future<Suggestions> fetchdataSuggestions(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    return Suggestions.fromJson(json);
  } else {
    // ignore: use_build_context_synchronously
    throw const Text('Error Occured while fetching data');
  }
}

class Suggestions {
  final List suggestions;

  Suggestions({required this.suggestions});

  factory Suggestions.fromJson(Map<String, dynamic> json) {
    return Suggestions(
      suggestions: json['records'] ?? '',
    );
  }
}
//MAKE FOLLOW GALORITHM-21 on github