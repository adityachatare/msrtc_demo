import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PrintTicketScreen extends StatefulWidget {
  String sourceInMarathi = "", destinationInMarathi = "";
  int adultCount = 0, totalStages = 0, fare = 0;
  String ticketType = "";
  PrintTicketScreen(
      {super.key,
      required this.sourceInMarathi,
      required this.destinationInMarathi,
      required this.adultCount,
      required this.totalStages,
      required this.fare,
      required this.ticketType});

  @override
  State<PrintTicketScreen> createState() => _PrintTicketScreenState();
}

class MarathiNumbers {
  int index = 0;
  String marathiNumber = "";
  MarathiNumbers({required this.index, required this.marathiNumber});
}

class _PrintTicketScreenState extends State<PrintTicketScreen> {
  double totalFare = 0.0;

  String convertedTotalFare = "",
      convertedStages = "",
      convertedNumberOfAdults = "",
      convertedFare = '';
  List<String> marathiNumbers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalFare = (widget.adultCount * widget.fare).toDouble();

    marathiNumbers.clear();
    marathiNumbers.add("०");
    marathiNumbers.add("१");
    marathiNumbers.add("२");
    marathiNumbers.add("३");
    marathiNumbers.add("४");
    marathiNumbers.add("५");
    marathiNumbers.add("६");
    marathiNumbers.add("७");
    marathiNumbers.add("८");
    marathiNumbers.add("९");
    print("Total Fare : $totalFare");
    convertedTotalFare = convertDoubleNumber(totalFare);
    convertedStages = convertIntNumber(widget.totalStages);
    convertedFare = convertIntNumber(widget.fare);
    convertedNumberOfAdults = convertIntNumber(widget.adultCount);
  }

  String convertIntNumber(int engNumber) {
    String convertedNumber = '';
    String inputStr = engNumber.toString();
    for (int i = 0; i < inputStr.length; i++) {
      int index = int.parse(inputStr[i]);
      convertedNumber += marathiNumbers[index];
    }
    return convertedNumber;
  }

  String convertDoubleNumber(double engNumber) {
    String convertedNumber = '';
    String inputStr = engNumber.toString();

    String intPartStr = '';
    String fracPartStr = '';

    List<String> parts = inputStr.split('.');
    String intPart = parts[0];
    String fracPart = parts.length > 1 ? parts[1] : '';

    // Process the integer part
    for (int i = 0; i < intPart.length; i++) {
      int index = int.parse(intPart[i]);
      intPartStr += marathiNumbers[index];
    }

    // Process the fractional part
    for (int i = 0; i < fracPart.length; i++) {
      int index = int.parse(fracPart[i]);
      fracPartStr += marathiNumbers[index];
    }

    // Concatenate the integer and fractional parts with a dot
    convertedNumber = intPartStr + '.' + fracPartStr;
    return convertedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            title: const Text(
              "म. रा. मा. प. म",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("म. रा. मा. प. म", style: TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("रा. प. श्रीवर्धन आगार",
                        style: TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("क्र:०००१४४७   १९/०६/२४   ०५:१५:३६",
                        style: TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("साधी बस S25130", style: TextStyle(fontSize: 19)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "${widget.sourceInMarathi}  ते  ${widget.destinationInMarathi}",
                        style: TextStyle(fontSize: 19))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("(प्रवासाचे एकूण टप्पे = $convertedStages ) ",
                        style: TextStyle(fontSize: 19))
                  ],
                ),
                Visibility(
                  visible: widget.ticketType == "Ladies",
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("महिला सन्मान योजना", style: TextStyle(fontSize: 19))
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.ticketType == "SeniorCitizen",
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("जेष्ठ नागरिक", style: TextStyle(fontSize: 19))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "फुल:    $convertedNumberOfAdults x $convertedFare = ₹$convertedTotalFare",
                        style: TextStyle(fontSize: 19))
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("अ. स. निधी सहित", style: TextStyle(fontSize: 19))
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SDN0010   ००००७८   S K PAWAR",
                        style: TextStyle(fontSize: 19))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("रोख  =  ₹ $convertedTotalFare",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("अहस्तांतऱणीय  ८६२८५८०६१६६९४३६",
                        style: TextStyle(fontSize: 19))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                    backgroundColor: Colors.green[300],
                    msg: "Printing Ticket",
                    textColor: Colors.black,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM);
                Navigator.pop(context);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  // onPressed: () {},
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(0)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CASH PAY",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 70,
                      // onPressed: () {},
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(0)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WALLET",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 70,
                      // onPressed: () {},
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(0)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CANCEL",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
