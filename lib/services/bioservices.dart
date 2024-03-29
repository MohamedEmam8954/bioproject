import 'dart:developer';

import 'package:bioproject/helper/api.dart';
import 'package:bioproject/models/biomodels.dart';

class BioServices {
  String baseurl = "http://10.0.2.2:5000";
  Future<BioModel> match({
    required String seq,
    required String subsquence,
  }) async {
    var data =
        await Api().api(url: "$baseurl/match?text=$seq&pattern=$subsquence");
    log("http://10.0.2.2:5000/match?text=$seq&pattern=$subsquence");
    log(data.toString());
    return BioModel.FromJson(data);
  }

  Future<BadCharModel> badChar({
    required String seq,
    required String subsquence,
  }) async {
    var data =
        await Api().api(url: "$baseurl/badchars?seq=$seq&sub_seq=$subsquence");
    log(data.toString());
    return BadCharModel.fromjson(data);
  }

  Future<BioModel> gcContent({required String Sequence}) async {
    // to get the percentage G ,C in dna
    var data = await Api().api(url: "$baseurl/gc_content?seq=$Sequence");
    log("http://10.0.2.2:5000/gc_content?seq=$Sequence");
    log(data.toString());
    return BioModel.FromJson(data);
  }

  Future<BioModel> complement({required String Sequence}) async {
    // to get  complement G ,C in dna
    var data = await Api().api(url: "$baseurl/complement?seq=$Sequence");
    log("http://10.0.2.2:5000/complement?seq=$Sequence");
    log(data.toString());
    return BioModel.FromJson(data);
  }

  Future<BioModel> reverese({required String Sequence}) async {
    // to make reverse
    var data = await Api().api(url: "$baseurl/reverse?seq=$Sequence");
    log("http://10.0.2.2:5000/reverse?seq=$Sequence");
    log(data.toString());
    return BioModel.FromJson(data);
  }

  Future<BioModel> revereseComplement({required String Sequence}) async {
    var data =
        await Api().api(url: "$baseurl/reverse_complement?seq=$Sequence");
    log("http://10.0.2.2:5000/reverse_complement?seq=$Sequence");
    log(data.toString());
    return BioModel.FromJson(data);
  }

  Future<BioModel> verifiyDna({required String Sequence}) async {
    var data = await Api().api(url: "$baseurl/verify_rna?sequence=$Sequence");
    log(data.toString());
    return BioModel.FromJson(data);
  }

  Future<BioModel> translationTable({required String Sequence}) async {
    var data = await Api().api(url: "$baseurl/translation_table?seq=$Sequence");
    log("http://10.0.2.2:5000/translation_table?seq=$Sequence");
    log(data.toString());
    return BioModel.FromJson(data);
  }

  Future<List<int>> boyerMoore(
      {required String text, required String pattern}) async {
    var response = await Api().api(
        url: "$baseurl/boyer_moore_search_all?text=$text&pattern=$pattern");
    List<int> patternindex = [];
    List<dynamic> data = response["output"];
    for (int i = 0; i < data.length; i++) {
      patternindex.add(data[i]);
    }

    log("the length is ${patternindex.length}");
    return patternindex;
  }

  Future<List<dynamic>> indexsorted(
      {required String sequence, required int ln}) async {
    var response =
        await Api().api(url: "$baseurl/index_sorted?seq=$sequence&ln=$ln");
    List<dynamic> data = response["output"];
    return data;
  }

  Future<List<dynamic>> query(
      // its take the input from file dna.fasta
      {required int length,
      required String pattern}) async {
    var response = await Api().api(url: "$baseurl/kmer?p=$pattern&ln=$length");
    List<dynamic> data = response["output"];
    log(data.toString());
    return data;
  }

  Future<int> overlap({required String a, required String b}) async {
    var response = await Api().api(url: "$baseurl/overlap?a=$a&b=$b");
    int data = response["output"];
    log(data.toString());
    return data;
  }

  Future<List<dynamic>> suffixArray({required String inputstr}) async {
    var response =
        await Api().api(url: "$baseurl/suffix_array?input_str=$inputstr");
    List<dynamic> data = response["output"];
    List<dynamic> res = [];
    for (int i = 0; i < data.length; i++) {
      res.add(data[i]);
    }
    return res;
  }

  Future<BioModel> calculatedifference(
      {required String sequence1, required String sequence2}) async {
    var response = await Api().api(
        url: "$baseurl/calculate_distance?seq1=$sequence1&seq2=$sequence2");
    log(response["output"].toString());
    return BioModel.FromJson(response);
  }

  Future<BioModel> boyermooregoodsuffix(
      {required String text, required String pattern}) async {
    var response = await Api()
        .api(url: "$baseurl/find_pattern?text=$text&pattern=$pattern");
    log(response["output"].toString());
    return BioModel.FromJson(response);
  }

  Future<BioModel> kmpSearch(
      {required String text, required String pattern}) async {
    var response =
        await Api().api(url: "$baseurl/kmp_search?text=$text&pattern=$pattern");
    log(response["output"].toString());
    return BioModel.FromJson(response);
  }
}
