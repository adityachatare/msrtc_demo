import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msrtc_demo/domain/entities/stop.dart';
import 'package:msrtc_demo/domain/usecases/get_stops_for_route.dart';
import 'package:msrtc_demo/printticketscreen.dart';

class IssueTicket extends StatefulWidget {
  final String routeNo;
  final GetStopsForRoute getStopsForRoute;

  const IssueTicket({
    super.key,
    required this.routeNo,
    required this.getStopsForRoute,
  });

  @override
  State<IssueTicket> createState() => _IssueTicketState();
}

class _IssueTicketState extends State<IssueTicket> {
  int adultPassengers = 0;
  int childPassengers = 0;
  int sourceIndex = 0;
  int destinationIndex = 1;
  bool normalTicket = true;
  bool ladiesTicket = false;
  bool srCitizenTicket = false;
  late final List<Stop> stops;
  late final List<String> marathiNumbers;

  @override
  void initState() {
    super.initState();
    stops = widget.getStopsForRoute(widget.routeNo);
    if (stops.length > 1) {
      destinationIndex = 1;
    } else {
      destinationIndex = 0;
    }
    marathiNumbers = const ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];
  }

  Future<void> _showStopSelectionDialog(bool isSource) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: stops.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(
                      stops[index].stopName,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '(${stops[index].stageNo})  ${stops[index].stopNameMarathi}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (isSource) {
                          sourceIndex = index;
                          if (destinationIndex == sourceIndex && stops.length > 1) {
                            destinationIndex = (sourceIndex + 1) % stops.length;
                          }
                        } else {
                          destinationIndex = index;
                        }
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            )
          ],
        );
      },
    );
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
    final totalStages = stops[destinationIndex].stageNo > stops[sourceIndex].stageNo
        ? stops[destinationIndex].stageNo - stops[sourceIndex].stageNo
        : stops[sourceIndex].stageNo - stops[destinationIndex].stageNo;
    final fare = (totalStages * 8.5).toInt();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          title: const Text(
            'Issue Ticket',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DottedBorder(
              color: Colors.red,
              strokeWidth: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text(
                          'Boarding :',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _showStopSelectionDialog(true),
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2),
                            ),
                            child: Center(
                              child: Text(
                                stops[sourceIndex].stopName,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showStopSelectionDialog(true),
                            child: Text(
                              '(${stops[sourceIndex].stageNo}) ${stops[sourceIndex].stopNameMarathi}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text(
                          'Alighting :',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _showStopSelectionDialog(false),
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2),
                            ),
                            child: Center(
                              child: Text(
                                stops[destinationIndex].stopName,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showStopSelectionDialog(false),
                            child: Text(
                              '(${stops[destinationIndex].stageNo}) ${stops[destinationIndex].stopNameMarathi}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'T.Pasgr : (A: $adultPassengers C:$childPassengers)  A.Pasgr: (A:0 C:0)',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                        'Adult',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                              color: Colors.grey[200],
                            ),
                            child: const Center(
                              child: Text(
                                '-',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(border: Border.all(width: 2)),
                          child: Center(
                            child: Text(
                              adultPassengers.toString(),
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
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
                              color: Colors.grey[200],
                            ),
                            child: const Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
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
                        'Child',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                              color: Colors.grey[200],
                            ),
                            child: const Center(
                              child: Text(
                                '-',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(border: Border.all(width: 2)),
                          child: Center(
                            child: Text(
                              childPassengers.toString(),
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
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
                              color: Colors.grey[200],
                            ),
                            child: const Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'NORMAL',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'FEMALE',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'SR.CT',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'AMRUT SR.',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Luggage (in kg)',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ),
              Container(
                height: 60,
                width: 80,
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: const Center(
                  child: Text('', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text('REPEAT', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'PUNCH\nPASS',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
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
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('SEAT', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Concession Type', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              ),
              Container(
                height: 60,
                width: 70,
                child: const Center(
                  child: Text('', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 10),
              const SizedBox(
                width: 100,
                height: 50,
                child: Center(
                  child: Text('Adult', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black)),
                ),
              ),
              const SizedBox(width: 10),
              const SizedBox(
                width: 80,
                height: 50,
                child: Center(
                  child: Text('Child', textAlign: TextAlign.center, style: TextStyle(fontSize: 19, fontWeight: FontWeight.normal, color: Colors.black)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                if (adultPassengers < 1) {
                  Fluttertoast.showToast(msg: 'No. of adults cannot be 0.');
                } else if (destinationIndex == sourceIndex) {
                  Fluttertoast.showToast(msg: 'Select a different alighting stop than boarding stop.');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PrintTicketScreen(
                        sourceInMarathi: stops[sourceIndex].stopNameMarathi,
                        destinationInMarathi: stops[destinationIndex].stopNameMarathi,
                        adultCount: adultPassengers,
                        totalStages: totalStages,
                        fare: fare,
                        ticketType: normalTicket ? 'Normal' : ladiesTicket ? 'Ladies' : 'SeniorCitizen',
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('PRINT TICKET', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
