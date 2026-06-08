import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PrintTicketScreen extends StatefulWidget {
  final String sourceInMarathi;
  final String destinationInMarathi;
  final int adultCount;
  final int totalStages;
  final int fare;
  final String ticketType;

  const PrintTicketScreen({
    super.key,
    required this.sourceInMarathi,
    required this.destinationInMarathi,
    required this.adultCount,
    required this.totalStages,
    required this.fare,
    required this.ticketType,
  });

  @override
  State<PrintTicketScreen> createState() => _PrintTicketScreenState();
}

class _PrintTicketScreenState extends State<PrintTicketScreen> {
  late final double totalFare;
  late final String convertedTotalFare;
  late final String convertedStages;
  late final String convertedNumberOfAdults;
  late final String convertedFare;
  late final List<String> marathiNumbers;

  @override
  void initState() {
    super.initState();
    totalFare = widget.adultCount * widget.fare.toDouble();
    marathiNumbers = const ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];
    convertedTotalFare = convertDoubleNumber(totalFare);
    convertedStages = convertIntNumber(widget.totalStages);
    convertedFare = convertIntNumber(widget.fare);
    convertedNumberOfAdults = convertIntNumber(widget.adultCount);
  }

  String convertIntNumber(int value) {
    return value.toString().split('').map((digit) {
      final index = int.parse(digit);
      return marathiNumbers[index];
    }).join();
  }

  String convertDoubleNumber(double value) {
    final parts = value.toString().split('.');
    final integerPart = parts[0].split('').map((digit) {
      final index = int.parse(digit);
      return marathiNumbers[index];
    }).join();
    final decimalPart = parts.length > 1
        ? parts[1].split('').map((digit) {
            final index = int.parse(digit);
            return marathiNumbers[index];
          }).join()
        : '';
    return decimalPart.isEmpty ? integerPart : '$integerPart.$decimalPart';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          title: const Text(
            'म. रा. मा. प. म',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
                    Text('म. रा. मा. प. म', style: TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('रा. प. श्रीवर्धन आगार', style: TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('क्र:०००१४४७   १९/०६/२४   ०५:१५:३६', style: TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('साधी बस S25130', style: TextStyle(fontSize: 19)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${widget.sourceInMarathi}  ते  ${widget.destinationInMarathi}', style: const TextStyle(fontSize: 19)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('(प्रवासाचे एकूण टप्पे = $convertedStages ) ', style: const TextStyle(fontSize: 19)),
                  ],
                ),
                Visibility(
                  visible: widget.ticketType == 'Ladies',
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('महिला सन्मान योजना', style: TextStyle(fontSize: 19)),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.ticketType == 'SeniorCitizen',
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('जेष्ठ नागरिक', style: TextStyle(fontSize: 19)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('फुल:    $convertedNumberOfAdults x $convertedFare = ₹$convertedTotalFare', style: const TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('अ. स. निधी सहित', style: TextStyle(fontSize: 19)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SDN0010   ००००७८   S K PAWAR', style: TextStyle(fontSize: 19)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('रोख  =  ₹ $convertedTotalFare', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('अहस्तांतऱणीय  ८६२८५८०६१६६९४३६', style: TextStyle(fontSize: 19)),
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
                  msg: 'Printing Ticket',
                  textColor: Colors.black,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                );
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(0)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CASH PAY', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
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
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(0)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WALLET', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 70,
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(0)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CANCEL', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
