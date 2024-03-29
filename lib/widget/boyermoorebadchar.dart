import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';

import 'package:flutter/material.dart';

class BoyerMoorebadchar extends StatefulWidget {
  const BoyerMoorebadchar({super.key});

  @override
  State<BoyerMoorebadchar> createState() => _BoyerMoorebadcharState();
}

class _BoyerMoorebadcharState extends State<BoyerMoorebadchar> {
  String text = "", pattern = "", content = "pattern found at";
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
              color: Colors.red,
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
                      "Boyer Moore bad char",
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
                              List<int> data = await BioServices()
                                  .boyerMoore(text: text, pattern: pattern);
                              log(data.length.toString());
                              if (data.isNotEmpty) {
                                for (int i = 0; i < data.length; i++) {
                                  content += "\n ${data[i]}";
                                }
                                // ignore: use_build_context_synchronously
                                showMessage(context,
                                    content: content,
                                    title: "Boyer moore bad char");
                                content = "pattern found at";
                              } else {
                                showMessage(
                                  context,
                                  content: "pattern doesn't find in text",
                                  title: "",
                                );
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
                        child: Text(
                          "boyerMooreBadchar",
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
