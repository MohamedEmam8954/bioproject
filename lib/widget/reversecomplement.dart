import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:flutter/material.dart';

class ReverseComplement extends StatefulWidget {
  const ReverseComplement({super.key});

  @override
  State<ReverseComplement> createState() => _ReverseComplementState();
}

class _ReverseComplementState extends State<ReverseComplement> {
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
              color: const Color(0xff604b8c),
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
                      "Reverse complement",
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
                            log(Sequence);
                            for (int i = 0; i < Sequence.length; i++) {
                              if (Sequence[i] == 'A' ||
                                  Sequence[i] == 'G' ||
                                  Sequence[i] == 'C' ||
                                  Sequence[i] == 'T') {
                                continue;
                              } else {
                                dna = false;
                                break;
                              }
                            }
                            if (dna) {
                              try {
                                BioModel data = await BioServices()
                                    .revereseComplement(Sequence: Sequence);
                                // ignore: use_build_context_synchronously
                                showMessage(context,
                                    content: "Reverse complement:${data.value}",
                                    title: "Reverse complement");
                              } catch (e) {
                                log(e.toString());
                              }
                            } else {
                              showMessage(
                                context,
                                content: "enter char dna {A,C,G,T}",
                                title: "",
                              );
                            }
                          } else {
                            showMessage(
                              context,
                              content: "field musn't be empty",
                              title: "",
                            );
                          }
                        },
                        child: const Text(
                          "Reverse complement",
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
