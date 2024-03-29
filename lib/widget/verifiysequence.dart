import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/isvaliddna.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:flutter/material.dart';

class VerifiySequence extends StatefulWidget {
  const VerifiySequence({super.key});

  @override
  State<VerifiySequence> createState() => _VerifiySequenceState();
}

class _VerifiySequenceState extends State<VerifiySequence> {
  String Sequence = "";
  bool dna = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 185,
            decoration: const BoxDecoration(),
            child: Card(
              color: Colors.greenAccent,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Verifiy Sequence",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.text,
                        hinttext: "Squence",
                        onsubmit: (value) {
                          setState(() {
                            Sequence = value;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (Sequence.isNotEmpty) {
                            Sequence = Sequence.toUpperCase();
                            BioModel data = await BioServices()
                                .verifiyDna(Sequence: Sequence);

                            showMessage(
                              context,
                              content: "the $Sequence is:${data.value}",
                              title: "",
                            );
                          } else {
                            showMessage(
                              context,
                              content: "field musn't be empty",
                              title: "",
                            );
                          }
                        },
                        child: const Text(
                          "Verifiy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
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
