import 'dart:typed_data';

import 'package:esc_pos_bluetooth_updated/esc_pos_bluetooth_updated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:msrtc_demo/selecttrip.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  PrinterBluetoothManager printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printerManager.scanResults.listen((devices) async {
      // print('UI: Devices found ${devices.length}');
      setState(() {
        _devices = devices;
      });
    });
  }

  void _startScanDevices() {
    setState(() {
      _devices = [];
    });

    printerManager.startScan(Duration(seconds: 10));
    print("Devices $_devices");
  }

  void _stopScanDevices() {
    printerManager.stopScan();
  }

  Future<List<int>> demoReceipt(
      PaperSize paper, CapabilityProfile profile) async {
    final Generator ticket = Generator(paper, profile);
    List<int> bytes = [];

    // Print image
    // final ByteData data = await rootBundle.load('assets/rabbit_black.jpg');
    // final Uint8List imageBytes = data.buffer.asUint8List();
    // final Image? image = decodeImage(imageBytes);
    // bytes += ticket.image(image);

    bytes += ticket.text('GROCERYLY',
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
        linesAfter: 1);

    bytes += ticket.text('889  Watson Lane',
        styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('New Braunfels, TX',
        styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('Tel: 830-221-1234',
        styles: PosStyles(align: PosAlign.center));
    bytes += ticket.text('Web: www.example.com',
        styles: PosStyles(align: PosAlign.center), linesAfter: 1);

    bytes += ticket.hr();
    bytes += ticket.row([
      PosColumn(text: 'Qty', width: 1),
      PosColumn(text: 'Item', width: 7),
      PosColumn(
          text: 'Price', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: 'Total', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);

    bytes += ticket.row([
      PosColumn(text: '2', width: 1),
      PosColumn(text: 'ONION RINGS', width: 7),
      PosColumn(
          text: '0.99', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: '1.98', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.row([
      PosColumn(text: '1', width: 1),
      PosColumn(text: 'PIZZA', width: 7),
      PosColumn(
          text: '3.45', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: '3.45', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.row([
      PosColumn(text: '1', width: 1),
      PosColumn(text: 'SPRING ROLLS', width: 7),
      PosColumn(
          text: '2.99', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: '2.99', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.row([
      PosColumn(text: '3', width: 1),
      PosColumn(text: 'CRUNCHY STICKS', width: 7),
      PosColumn(
          text: '0.85', width: 2, styles: PosStyles(align: PosAlign.right)),
      PosColumn(
          text: '2.55', width: 2, styles: PosStyles(align: PosAlign.right)),
    ]);
    bytes += ticket.hr();

    bytes += ticket.row([
      PosColumn(
          text: 'TOTAL',
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
      PosColumn(
          text: '\$10.97',
          width: 6,
          styles: PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
    ]);

    bytes += ticket.hr(ch: '=', linesAfter: 1);

    bytes += ticket.row([
      PosColumn(
          text: 'Cash',
          width: 7,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(
          text: '\$15.00',
          width: 5,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);
    bytes += ticket.row([
      PosColumn(
          text: 'Change',
          width: 7,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
      PosColumn(
          text: '\$4.03',
          width: 5,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
    ]);

    bytes += ticket.feed(2);
    bytes += ticket.text('Thank you!',
        styles: PosStyles(align: PosAlign.center, bold: true));

    final now = DateTime.now();
    final formatter = DateFormat('MM/dd/yyyy H:m');
    final String timestamp = formatter.format(now);
    bytes += ticket.text(timestamp,
        styles: PosStyles(align: PosAlign.center), linesAfter: 2);

    // Print QR Code from image
    // try {
    //   const String qrData = 'example.com';
    //   const double qrSize = 200;
    //   final uiImg = await QrPainter(
    //     data: qrData,
    //     version: QrVersions.auto,
    //     gapless: false,
    //   ).toImageData(qrSize);
    //   final dir = await getTemporaryDirectory();
    //   final pathName = '${dir.path}/qr_tmp.png';
    //   final qrFile = File(pathName);
    //   final imgFile = await qrFile.writeAsBytes(uiImg.buffer.asUint8List());
    //   final img = decodeImage(imgFile.readAsBytesSync());

    //   bytes += ticket.image(img);
    // } catch (e) {
    //   print(e);
    // }

    // Print QR Code using native function
    // bytes += ticket.qrcode('example.com');

    ticket.feed(2);
    ticket.cut();
    return bytes;
  }

  Future<List<int>> testTicket(
      PaperSize paper, CapabilityProfile profile) async {
    final Generator generator = Generator(paper, profile);
    List<int> bytes = [];

    bytes += generator.text(
        'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    // bytes += generator.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
    //     styles: PosStyles(codeTable: PosCodeTable.westEur));
    // bytes += generator.text('Special 2: blåbærgrød',
    //     styles: PosStyles(codeTable: PosCodeTable.westEur));

    bytes += generator.text('Bold text', styles: PosStyles(bold: true));
    bytes += generator.text('Reverse text', styles: PosStyles(reverse: true));
    bytes += generator.text('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    bytes +=
        generator.text('Align left', styles: PosStyles(align: PosAlign.left));
    bytes += generator.text('Align center',
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Align right',
        styles: PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.row([
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col6',
        width: 6,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
    ]);

    bytes += generator.text('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    // Print image
    // final ByteData data = await rootBundle.load('assets/logo.png');
    // final Uint8List buf = data.buffer.asUint8List();
    // final Image image = decodeImage(buf)!;
    // bytes += generator.image(image);
    // Print image using alternative commands
    // bytes += generator.imageRaster(image);
    // bytes += generator.imageRaster(image, imageFn: PosImageFn.graphics);

    // Print barcode
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));

    // Print mixed (chinese + latin) text. Only for printers supporting Kanji mode
    // bytes += generator.text(
    //   'hello ! 中文字 # world @ éphémère &',
    //   styles: PosStyles(codeTable: PosCodeTable.westEur),
    //   containsChinese: true,
    // );

    bytes += generator.feed(2);

    bytes += generator.cut();
    return bytes;
  }

  void _testPrint(PrinterBluetooth printer) async {
    printerManager.selectPrinter(printer);

    // TODO Don't forget to choose printer's paper
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();

    // TEST PRINT
    // final PosPrintResult res =
    // await printerManager.printTicket(await testTicket(paper));

    // DEMO RECEIPT
    final PosPrintResult res =
        await printerManager.printTicket((await demoReceipt(paper, profile)));

    // showToast(res.msg);
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
              "Select Trip",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(_devices.length.toString()),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: _devices.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => _testPrint(_devices[index]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.print),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(_devices[index].name ?? ''),
                                    Text(_devices[index].address!),
                                    Text(
                                      'Click to print a test receipt',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SelectTrip()));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  // onPressed: () {},
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SELECT TRIP",
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
      floatingActionButton: StreamBuilder<bool>(
        stream: printerManager.isScanningStream,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: _stopScanDevices,
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: _startScanDevices,
            );
          }
        },
      ),
    );
  }
}
