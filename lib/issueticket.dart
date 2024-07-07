import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msrtc_demo/printticketscreen.dart';

class IssueTicket extends StatefulWidget {
  String routeNo = "";

  IssueTicket({super.key, required this.routeNo});

  @override
  State<IssueTicket> createState() => _IssueTicketState();
}

class StopsObj {
  int stageNo = 0;
  int kmsFromSource = 0;
  int kmsFromLastStage = 0;
  String stopName = "";
  String stopNameMarathi = "";
  StopsObj(
      {required this.stageNo,
      required this.kmsFromSource,
      required this.kmsFromLastStage,
      required this.stopName,
      required this.stopNameMarathi});
}

class _IssueTicketState extends State<IssueTicket> {
  int adultPassengers = 0,
      childPassengers = 0,
      sourceIndex = 0,
      destinationIndex = 1;
  bool normalTicket = true, ladiesTicket = false, srCitizenTicket = false;
  List<StopsObj> stops = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stops.clear();
    print("Route no : ${widget.routeNo}");
    if (widget.routeNo == "63328") {
      print("We are in if");
      stops.add(StopsObj(
          stageNo: 1,
          kmsFromSource: 0,
          kmsFromLastStage: 0,
          stopName: "SHRIVARDHAN",
          stopNameMarathi: "श्रीवर्धन"));
      stops.add(StopsObj(
          stageNo: 2,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "SHRIVARDHAN GAON",
          stopNameMarathi: "श्रीवर्धन गाव"));
      stops.add(StopsObj(
          stageNo: 3,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "AARATHI",
          stopNameMarathi: "आराठी"));
      stops.add(StopsObj(
          stageNo: 4,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "JASAWLI",
          stopNameMarathi: "जसवली गाव"));
      stops.add(StopsObj(
          stageNo: 5,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "BODNI FATA",
          stopNameMarathi: "बोडणी फाटा"));
      stops.add(StopsObj(
          stageNo: 6,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "WADGHAR PANGLOLI",
          stopNameMarathi: "वडघर पांगलोळी"));
      stops.add(StopsObj(
          stageNo: 7,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "JAMBHUL",
          stopNameMarathi: "जांभूळ"));
      stops.add(StopsObj(
          stageNo: 8,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "WADAMBA",
          stopNameMarathi: "वाडांबा"));

      stops.add(StopsObj(
          stageNo: 9,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "MHSALA",
          stopNameMarathi: "म्हसळा"));
      stops.add(StopsObj(
          stageNo: 10,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "DEVGHAR",
          stopNameMarathi: "देवघर"));
      stops.add(StopsObj(
          stageNo: 11,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "GHONSE",
          stopNameMarathi: "घोणसे"));
      stops.add(StopsObj(
          stageNo: 12,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "KELICHIWADI",
          stopNameMarathi: "केळीचीवाडी"));
      stops.add(StopsObj(
          stageNo: 13,
          kmsFromSource: 28,
          kmsFromLastStage: 12,
          stopName: "CHANDORE",
          stopNameMarathi: "चांदोरे"));
      stops.add(StopsObj(
          stageNo: 14,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "NALEFODI",
          stopNameMarathi: "नळेफोडी"));

      stops.add(StopsObj(
          stageNo: 15,
          kmsFromSource: 33,
          kmsFromLastStage: 5,
          stopName: "SAI",
          stopNameMarathi: "साई"));
      stops.add(StopsObj(
          stageNo: 16,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "VIHULE",
          stopNameMarathi: "विहुले"));
      stops.add(StopsObj(
          stageNo: 17,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "DONGROLI",
          stopNameMarathi: "डोंगरोली"));
      stops.add(StopsObj(
          stageNo: 18,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "NAITNE",
          stopNameMarathi: "नाईटने"));
      stops.add(StopsObj(
          stageNo: 19,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "BORLA",
          stopNameMarathi: "बोर्ला"));
      stops.add(StopsObj(
          stageNo: 19,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "MORBA",
          stopNameMarathi: "मोर्बा"));
      stops.add(StopsObj(
          stageNo: 6,
          kmsFromSource: 46,
          kmsFromLastStage: 13,
          stopName: "MANGAON",
          stopNameMarathi: "माणगाव"));
      stops.add(StopsObj(
          stageNo: 21,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "NIJAMPUR",
          stopNameMarathi: "निजामपूर"));
      stops.add(StopsObj(
          stageNo: 22,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "BHAGAD",
          stopNameMarathi: "भागाड"));
      stops.add(StopsObj(
          stageNo: 23,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "VILA",
          stopNameMarathi: "विळा"));
      stops.add(StopsObj(
          stageNo: 24,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "DONGARWADI",
          stopNameMarathi: "डोंगरवाडी"));
      stops.add(StopsObj(
          stageNo: 25,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "NIVE",
          stopNameMarathi: "निवे"));
      stops.add(StopsObj(
          stageNo: 26,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "SAROLE",
          stopNameMarathi: "सारोळे"));
      stops.add(StopsObj(
          stageNo: 27,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "TAMHINI",
          stopNameMarathi: "ताम्हिणी"));
      stops.add(StopsObj(
          stageNo: 28,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "VARAK",
          stopNameMarathi: "वारक"));
      stops.add(StopsObj(
          stageNo: 29,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "GONWADI",
          stopNameMarathi: "गोनवाडी"));
      stops.add(StopsObj(
          stageNo: 30,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "VARCHI MULSHI",
          stopNameMarathi: "वरची मुळशी"));
      stops.add(StopsObj(
          stageNo: 31,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "KHALCHI MULSHI",
          stopNameMarathi: "खालची मुळशी"));
      stops.add(StopsObj(
          stageNo: 32,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "SHERE",
          stopNameMarathi: "शेरे"));

      stops.add(StopsObj(
          stageNo: 7,
          kmsFromSource: 129,
          kmsFromLastStage: 83,
          stopName: "PAUD",
          stopNameMarathi: "पौड"));
      stops.add(StopsObj(
          stageNo: 34,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "PIRANGUT",
          stopNameMarathi: "पिरंगुट"));
      stops.add(StopsObj(
          stageNo: 35,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "GHOTAVDE FATA",
          stopNameMarathi: "घोटावडे फाटा"));
      stops.add(StopsObj(
          stageNo: 36,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "BHUKUM",
          stopNameMarathi: "भुकुम"));
      stops.add(StopsObj(
          stageNo: 8,
          kmsFromSource: 150,
          kmsFromLastStage: 23,
          stopName: "CHANDANI CHOWK",
          stopNameMarathi: "चांदणी चौक"));
      stops.add(StopsObj(
          stageNo: 38,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "VANAZ",
          stopNameMarathi: "वनाझ"));
      stops.add(StopsObj(
          stageNo: 39,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "NAL STOP",
          stopNameMarathi: "नळ स्टॉप"));
      stops.add(StopsObj(
          stageNo: 40,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "DANDEKAR PUL",
          stopNameMarathi: "दांडेकर पूल"));
      stops.add(StopsObj(
          stageNo: 27,
          kmsFromSource: 158,
          kmsFromLastStage: 8,
          stopName: "SWARGATE, PUNE",
          stopNameMarathi: "स्वारगेट, पुणे"));
    } else if (widget.routeNo == "63329") {
      print("We are in else");
      stops.add(StopsObj(
          stageNo: 1,
          kmsFromSource: 0,
          kmsFromLastStage: 0,
          stopName: "SHRIVARDHAN",
          stopNameMarathi: "श्रीवर्धन"));
      stops.add(StopsObj(
          stageNo: 2,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "SHRIVARDHAN GAON",
          stopNameMarathi: "श्रीवर्धन गाव"));
      stops.add(StopsObj(
          stageNo: 3,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "AARATHI",
          stopNameMarathi: "आराठी"));
      stops.add(StopsObj(
          stageNo: 4,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "JASAWLI",
          stopNameMarathi: "जसवली गाव"));
      stops.add(StopsObj(
          stageNo: 5,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "BODNI FATA",
          stopNameMarathi: "बोडणी फाटा"));
      stops.add(StopsObj(
          stageNo: 6,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "WADGHAR PANGLOLI",
          stopNameMarathi: "वडघर पांगलोळी"));
      stops.add(StopsObj(
          stageNo: 7,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "JAMBHUL",
          stopNameMarathi: "जांभूळ"));
      stops.add(StopsObj(
          stageNo: 8,
          kmsFromSource: 3,
          kmsFromLastStage: 3,
          stopName: "WADAMBA",
          stopNameMarathi: "वाडांबा"));

      stops.add(StopsObj(
          stageNo: 9,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "MHSALA",
          stopNameMarathi: "म्हसळा"));
      stops.add(StopsObj(
          stageNo: 10,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "DEVGHAR",
          stopNameMarathi: "देवघर"));
      stops.add(StopsObj(
          stageNo: 11,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "GHONSE",
          stopNameMarathi: "घोणसे"));
      stops.add(StopsObj(
          stageNo: 12,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "KELICHIWADI",
          stopNameMarathi: "केळीचीवाडी"));
      stops.add(StopsObj(
          stageNo: 13,
          kmsFromSource: 28,
          kmsFromLastStage: 12,
          stopName: "CHANDORE",
          stopNameMarathi: "चांदोरे"));
      stops.add(StopsObj(
          stageNo: 14,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "NALEFODI",
          stopNameMarathi: "नळेफोडी"));

      stops.add(StopsObj(
          stageNo: 15,
          kmsFromSource: 33,
          kmsFromLastStage: 5,
          stopName: "SAI",
          stopNameMarathi: "साई"));
      stops.add(StopsObj(
          stageNo: 16,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "VIHULE",
          stopNameMarathi: "विहुले"));
      stops.add(StopsObj(
          stageNo: 17,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "DONGROLI",
          stopNameMarathi: "डोंगरोली"));
      stops.add(StopsObj(
          stageNo: 18,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "NAITNE",
          stopNameMarathi: "नाईटने"));
      stops.add(StopsObj(
          stageNo: 19,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "BORLA",
          stopNameMarathi: "बोर्ला"));
      stops.add(StopsObj(
          stageNo: 19,
          kmsFromSource: 16,
          kmsFromLastStage: 19,
          stopName: "MORBA",
          stopNameMarathi: "मोर्बा"));
      stops.add(StopsObj(
          stageNo: 6,
          kmsFromSource: 46,
          kmsFromLastStage: 13,
          stopName: "MANGAON",
          stopNameMarathi: "माणगाव"));
      stops.add(StopsObj(
          stageNo: 7,
          kmsFromSource: 55,
          kmsFromLastStage: 9,
          stopName: "INDAPUR",
          stopNameMarathi: "इंदापूर "));
      stops.add(StopsObj(
          stageNo: 8,
          kmsFromSource: 67,
          kmsFromLastStage: 11,
          stopName: "KOLAD",
          stopNameMarathi: "कोलाड"));
      stops.add(StopsObj(
          stageNo: 9,
          kmsFromSource: 73,
          kmsFromLastStage: 6,
          stopName: "KHAMB",
          stopNameMarathi: "खांब"));

      stops.add(StopsObj(
          stageNo: 10,
          kmsFromSource: 78,
          kmsFromLastStage: 5,
          stopName: "SUKELI",
          stopNameMarathi: "कोलाड"));
      stops.add(StopsObj(
          stageNo: 11,
          kmsFromSource: 82,
          kmsFromLastStage: 4,
          stopName: "VAKAN FATA",
          stopNameMarathi: "वाकन फाटा"));
      stops.add(StopsObj(
          stageNo: 12,
          kmsFromSource: 86,
          kmsFromLastStage: 16,
          stopName: "NAGOTHANE",
          stopNameMarathi: "नागोठने"));
      stops.add(StopsObj(
          stageNo: 13,
          kmsFromSource: 99,
          kmsFromLastStage: 5,
          stopName: "KASU",
          stopNameMarathi: "कासू"));
      stops.add(StopsObj(
          stageNo: 14,
          kmsFromSource: 106,
          kmsFromLastStage: 7,
          stopName: "DOLVI",
          stopNameMarathi: "डोल्वी "));
      stops.add(StopsObj(
          stageNo: 15,
          kmsFromSource: 107,
          kmsFromLastStage: 1,
          stopName: "VADKHAL",
          stopNameMarathi: "वडखळ"));
      stops.add(StopsObj(
          stageNo: 16,
          kmsFromSource: 113,
          kmsFromLastStage: 6,
          stopName: "RAMWADI",
          stopNameMarathi: "रामवाडी"));
      stops.add(StopsObj(
          stageNo: 17,
          kmsFromSource: 115,
          kmsFromLastStage: 2,
          stopName: "PEN",
          stopNameMarathi: "पेण"));
      stops.add(StopsObj(
          stageNo: 18,
          kmsFromSource: 123,
          kmsFromLastStage: 8,
          stopName: "JITE",
          stopNameMarathi: "जिते"));
      stops.add(StopsObj(
          stageNo: 19,
          kmsFromSource: 125,
          kmsFromLastStage: 2,
          stopName: "KHARPADA",
          stopNameMarathi: "खारपाडा"));

      stops.add(StopsObj(
          stageNo: 20,
          kmsFromSource: 127,
          kmsFromLastStage: 2,
          stopName: "AAPTA FATA",
          stopNameMarathi: "आपटा फाटा"));
      stops.add(StopsObj(
          stageNo: 21,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "KARNALA",
          stopNameMarathi: "कर्नाळा"));
      //  stops.add(StopsObj(
      // stageNo: 21,
      // kmsFromSource: 131,
      // kmsFromLastStage: 4,
      // stopName: "KARNALA",
      // stopNameMarathi: "कर्नाळा"));
      stops.add(StopsObj(
          stageNo: 22,
          kmsFromSource: 161,
          kmsFromLastStage: 30,
          stopName: "PANVEL",
          stopNameMarathi: "पनवेल"));
      stops.add(StopsObj(
          stageNo: 23,
          kmsFromSource: 164,
          kmsFromLastStage: 3,
          stopName: "KAMOTHE",
          stopNameMarathi: "कामोठे"));

      stops.add(StopsObj(
          stageNo: 24,
          kmsFromSource: 169,
          kmsFromLastStage: 5,
          stopName: "KHARGHAR",
          stopNameMarathi: "खारघर"));
      stops.add(StopsObj(
          stageNo: 25,
          kmsFromSource: 172,
          kmsFromLastStage: 3,
          stopName: "BELAPUR C.B.D",
          stopNameMarathi: "बेलापूर सी.बी.डी"));
      stops.add(StopsObj(
          stageNo: 26,
          kmsFromSource: 174,
          kmsFromLastStage: 2,
          stopName: "NERUL",
          stopNameMarathi: "नेरुळ"));
      stops.add(StopsObj(
          stageNo: 27,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "JUINAGAR",
          stopNameMarathi: "जुईनगर"));
      stops.add(StopsObj(
          stageNo: 28,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "VASHI",
          stopNameMarathi: "वाशी"));
      stops.add(StopsObj(
          stageNo: 29,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "MANKHURD",
          stopNameMarathi: "मानखुर्द"));
      stops.add(StopsObj(
          stageNo: 30,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "CHEMBUR, MAITRI PARK",
          stopNameMarathi: "चेंबूर, मैत्री पार्क"));
      stops.add(StopsObj(
          stageNo: 31,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "SION",
          stopNameMarathi: "सायन"));
      stops.add(StopsObj(
          stageNo: 32,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "DADAR",
          stopNameMarathi: "दादर"));
      stops.add(StopsObj(
          stageNo: 33,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "LAALBAG",
          stopNameMarathi: "लालबाग"));
      stops.add(StopsObj(
          stageNo: 34,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "BAYCULLA",
          stopNameMarathi: "भायखाळा"));
      stops.add(StopsObj(
          stageNo: 35,
          kmsFromSource: 131,
          kmsFromLastStage: 4,
          stopName: "MUMBAI CENTRAL",
          stopNameMarathi: "मुंबई सेंट्रल"));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.all(0), children: [
        // const DrawerHeader(
        //   decoration: BoxDecoration(
        //     color: Colors.green,
        //   ), //BoxDecoration
        //   child: UserAccountsDrawerHeader(
        //     decoration: BoxDecoration(color: Colors.green),
        //     accountName: Text(
        //       "Abhishek Mishra",
        //       style: TextStyle(fontSize: 18),
        //     ),
        //     accountEmail: Text("abhishekm977@gmail.com"),
        //     currentAccountPictureSize: Size.square(50),
        //     currentAccountPicture: CircleAvatar(
        //       backgroundColor: Color.fromARGB(255, 165, 255, 137),
        //       child: Text(
        //         "A",
        //         style: TextStyle(fontSize: 30.0, color: Colors.blue),
        //       ), //Text
        //     ), //circleAvatar
        //   ), //UserAccountDrawerHeader
        // ), //DrawerHeader
        // ListTile(
        //   leading: const Icon(Icons.person),
        //   title: const Text(' My Profile '),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // ListTile(
        //   leading: const Icon(Icons.book),
        //   title: const Text(' My Course '),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // ListTile(
        //   leading: const Icon(Icons.workspace_premium),
        //   title: const Text(' Go Premium '),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // ListTile(
        //   leading: const Icon(Icons.video_label),
        //   title: const Text(' Saved Videos '),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // ListTile(
        //   leading: const Icon(Icons.edit),
        //   title: const Text(' Edit Profile '),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // ListTile(
        //   leading: const Icon(Icons.logout),
        //   title: const Text('LogOut'),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ])),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            title: Text(
              "Issue Ticket",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DottedBorder(
              color: Colors.red,
              // gap: 3,
              strokeWidth: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text(
                          "Boarding :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  // title: Text("Select Value"),
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const ScrollPhysics(),
                                        itemBuilder: (ctx, index) {
                                          return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  sourceIndex = index;
                                                });
                                                Navigator.pop(context);
                                              },
                                              title: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "${stops[index].stopName}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              subtitle: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "(${stops[index].stageNo})  ${stops[index].stopNameMarathi}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ));
                                        },
                                        itemCount: stops.length,
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2)),
                            child: Center(
                                child: Text(stops[sourceIndex].stopName)),
                          ),
                        ),
                        SizedBox(
                          width: stops[sourceIndex].stageNo > 9 ? 7 : 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  // title: Text("Select Value"),
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: ScrollPhysics(),
                                        itemBuilder: (ctx, index) {
                                          return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  sourceIndex = index;
                                                });
                                                Navigator.pop(context);
                                              },
                                              title: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "${stops[index].stopName}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              subtitle: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "(${stops[index].stageNo})  ${stops[index].stopNameMarathi}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ));
                                        },
                                        itemCount: stops.length,
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "(${stops[sourceIndex].stageNo}) ${stops[sourceIndex].stopNameMarathi}",
                            style: TextStyle(
                                fontSize: stops[sourceIndex]
                                        .stopNameMarathi
                                        .contains(" ")
                                    ? 16
                                    : 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Alighting :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  // title: Text("Select Value"),
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: ScrollPhysics(),
                                        itemCount: stops.length,
                                        itemBuilder: (ctx, index) {
                                          return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  destinationIndex = index;
                                                });
                                                Navigator.pop(context);
                                              },
                                              title: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "${stops[index].stopName}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              subtitle: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "(${stops[index].stageNo})  ${stops[index].stopNameMarathi}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ));
                                        },
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2)),
                            child: Center(
                                child: Text(stops[destinationIndex].stopName)),
                          ),
                        ),
                        SizedBox(
                          width: stops[destinationIndex].stageNo > 9 ? 7 : 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  // title: Text("Select Value"),
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: ScrollPhysics(),
                                        itemCount: stops.length,
                                        itemBuilder: (ctx, index) {
                                          return ListTile(
                                              onTap: () {
                                                setState(() {
                                                  destinationIndex = index;
                                                });
                                                Navigator.pop(context);
                                              },
                                              title: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "${stops[index].stopName}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              subtitle: SizedBox(
                                                width: 250,
                                                child: Text(
                                                  "(${stops[index].stageNo})  ${stops[index].stopNameMarathi}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ));
                                        },
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "(${stops[destinationIndex].stageNo}) ${stops[destinationIndex].stopNameMarathi}",
                            style: TextStyle(
                                fontSize: stops[destinationIndex]
                                        .stopNameMarathi
                                        .contains(" ")
                                    ? 16
                                    : 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "T.Pasgr : (A: $adultPassengers C:$childPassengers)  A.Pasgr: (A:0 C:0)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: normalTicket,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Adult",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (adultPassengers > 0) {
                              setState(() {
                                adultPassengers--;
                              });
                            }
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          decoration:
                              BoxDecoration(border: Border.all(width: 2)),
                          child: Center(
                              child: Text(
                            adultPassengers.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              adultPassengers++;
                            });
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: normalTicket,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Child",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (childPassengers > 0) {
                              setState(() {
                                childPassengers--;
                              });
                            }
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          decoration:
                              BoxDecoration(border: Border.all(width: 2)),
                          child: Center(
                              child: Text(
                            childPassengers.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              childPassengers++;
                            });
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: const Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: ladiesTicket,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Ladies",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (adultPassengers > 0) {
                              setState(() {
                                adultPassengers--;
                              });
                            }
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          decoration:
                              BoxDecoration(border: Border.all(width: 2)),
                          child: Center(
                              child: Text(
                            adultPassengers.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              adultPassengers++;
                            });
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: srCitizenTicket,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Senior Citizen",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (adultPassengers > 0) {
                              setState(() {
                                adultPassengers--;
                              });
                            }
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          decoration:
                              BoxDecoration(border: Border.all(width: 2)),
                          child: Center(
                              child: Text(
                            adultPassengers.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              adultPassengers++;
                            });
                          },
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color: Colors.grey[200]),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.red),
                              ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      normalTicket = true;
                      ladiesTicket = false;
                      srCitizenTicket = false;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "NORMAL",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ladiesTicket = true;
                      normalTicket = false;
                      srCitizenTicket = false;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "FEMALE",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      normalTicket = false;
                      ladiesTicket = false;
                      srCitizenTicket = true;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "SR.CT",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "AMRUT SR.",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Luggage (in kg)",
                    textAlign: TextAlign.right,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 80,
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: const Center(
                    child: Text(
                  "",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "REPEAT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "PUNCH\nPASS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "SEAT",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Concession Type",
                    textAlign: TextAlign.right,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 70,
                // decoration: BoxDecoration(border: Border.all(width: 2)),
                child: const Center(
                    child: Text(
                  "",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 50,
                // decoration: BoxDecoration(
                //     color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Adult",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 80,
                height: 50,
                // decoration: BoxDecoration(
                //     color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Child",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                if (adultPassengers < 1) {
                  Fluttertoast.showToast(msg: "No. of adults cannot be 0.");
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PrintTicketScreen(
                                sourceInMarathi:
                                    stops[sourceIndex].stopNameMarathi,
                                destinationInMarathi:
                                    stops[destinationIndex].stopNameMarathi,
                                adultCount: adultPassengers,
                                totalStages: stops[destinationIndex].stageNo >
                                        stops[sourceIndex].stageNo
                                    ? stops[destinationIndex].stageNo -
                                        stops[sourceIndex].stageNo
                                    : stops[sourceIndex].stageNo -
                                        stops[destinationIndex].stageNo,
                                fare: stops[destinationIndex].stageNo >
                                        stops[sourceIndex].stageNo
                                    ? ((stops[destinationIndex].stageNo -
                                                stops[sourceIndex].stageNo) *
                                            8.5)
                                        .toInt()
                                    : ((stops[sourceIndex].stageNo -
                                                stops[destinationIndex]
                                                    .stageNo) *
                                            8.5)
                                        .toInt(),
                                ticketType: normalTicket
                                    ? "Normal"
                                    : ladiesTicket
                                        ? "Ladies"
                                        : "SeniorCitizen",
                              )));
                }
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  // onPressed: () {},
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PRINT TICKET",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
