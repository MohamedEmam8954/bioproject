import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/isvaliddna.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:flutter/material.dart';

class Complement extends StatefulWidget {
  const Complement({super.key});

  @override
  State<Complement> createState() => _ComplementState();
}

class _ComplementState extends State<Complement> {
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
              color: const Color(0xffd29edb),
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
                      "Complement",
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
                            bool isvalid = validateDNA(Sequence);
                            setState(() {
                              dna = isvalid;
                            });
                            if (dna) {
                              try {
                                BioModel data = await BioServices()
                                    .complement(Sequence: Sequence);
                                // ignore: use_build_context_synchronously
                                showMessage(context,
                                    content: "Complement is:${data.value}",
                                    title: "Complement");
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
                          "Complement",
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
