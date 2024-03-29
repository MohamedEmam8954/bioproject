import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:bioproject/services/bioservices.dart';

import 'package:flutter/material.dart';

class KmpSearch extends StatefulWidget {
  const KmpSearch({super.key});

  @override
  State<KmpSearch> createState() => _KmpSearchState();
}

class _KmpSearchState extends State<KmpSearch> {
  String text = "", pattern = "", content = "Pattern found at indices:";
  bool dna = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(),
            child: Card(
              color: Colors.brown,
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
                      "KMP search",
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
                        hinttext: "text",
                        onsubmit: (value) {
                          setState(() {
                            text = value;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.text,
                        hinttext: "pattern",
                        onsubmit: (value) {
                          pattern = value;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (text.isNotEmpty && pattern.isNotEmpty) {
                            try {
                              BioModel data = await BioServices()
                                  .kmpSearch(text: text, pattern: pattern);
                              log(data.value.toString());
                              if (data.value.toString() == '[]') {
                                content = "";
                                content += "Pattern does't find in text";
                                showMessage(
                                  context,
                                  content: content,
                                  title: "",
                                );
                              } else {
                                content += data.value.toString();
                                showMessage(
                                  context,
                                  content: content,
                                  title: "",
                                );
                                content = "Pattern found at indices:";
                              }
                            } catch (e) {
                              log(e.toString());
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
                          "kmpsearch",
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
