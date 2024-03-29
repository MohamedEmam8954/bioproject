import 'package:bioproject/widget/Translation_Table.dart';
import 'package:bioproject/widget/badchar.dart';
import 'package:bioproject/widget/boyermoorebadchar.dart';
import 'package:bioproject/widget/boyermooregoodsuffix.dart';
import 'package:bioproject/widget/calculatedifference.dart';
import 'package:bioproject/widget/complement.dart';
import 'package:bioproject/widget/gc_content.dart';
import 'package:bioproject/widget/indexsorted.dart';
import 'package:bioproject/widget/kmp_search.dart';
import 'package:bioproject/widget/match.dart';
import 'package:bioproject/widget/offest.dart';
import 'package:bioproject/widget/overlap.dart';
import 'package:bioproject/widget/reverse.dart';
import 'package:bioproject/widget/reversecomplement.dart';
import 'package:bioproject/widget/suffixarray.dart';
import 'package:bioproject/widget/verifiysequence.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BioinFormatices",
            style: TextStyle(fontFamily: "Pacifico", fontSize: 24),
          ),
        ),
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ExactMatch(),
              SizedBox(
                height: 10,
              ),
              BadChar(),
              SizedBox(
                height: 10,
              ),
              GcContent(),
              SizedBox(
                height: 10,
              ),
              Complement(),
              SizedBox(
                height: 10,
              ),
              Reverse(),
              SizedBox(
                height: 10,
              ),
              ReverseComplement(),
              SizedBox(
                height: 10,
              ),
              TranslationTable(),
              SizedBox(
                height: 10,
              ),
              VerifiySequence(),
              SizedBox(
                height: 10,
              ),
              BoyerMoorebadchar(),
              SizedBox(
                height: 10,
              ),
              BoyerMooregoodsuffix(),
              SizedBox(
                height: 10,
              ),
              IndexSorted(),
              SizedBox(
                height: 10,
              ),
              OffestBio(),
              SizedBox(
                height: 10,
              ),
              Overlap(),
              SizedBox(
                height: 10,
              ),
              SuffixArry(),
              SizedBox(
                height: 10,
              ),
              CalculateDifference(),
              SizedBox(
                height: 10,
              ),
              KmpSearch(),
            ],
          ),
        ));
  }
}
