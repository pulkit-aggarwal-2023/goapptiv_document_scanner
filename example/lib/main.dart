import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goapptiv_document_scanner/goapptiv_document_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? imageFile;

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            if (imageFile != null)
              Expanded(child: Image(image: FileImage(imageFile!))),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final filePath = await GoapptivDocumentScanner.getPicture();
                    if (filePath != null) {
                      log(filePath);
                      imageFile = File(filePath);
                      setState(() {});
                    }
                  },
                  child: const Text('Take Pic'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
