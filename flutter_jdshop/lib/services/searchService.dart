import 'dart:convert';

import 'storage.dart';

class SearchService {
  static setHistoryData(keyword) async {
    try {
      List historyList = json.decode(await Storage.getString("searchList"));
      bool hasData = historyList.any((value) {
        return value == keyword;
      });
      if (!hasData) {
        historyList.add(keyword);
        await Storage.setString("searchList", json.encode(historyList));
      }
    } catch (e) {
      List historyList = new List();
      historyList.add(keyword);
      await Storage.setString("searchList", json.encode(historyList));
    }
  }

  static getHistoryData() async {
    try {
      List historyList = json.decode(await Storage.getString("searchList"));
      return historyList;
    } catch (e) {
      return [];
    }
  }

  static clearHistoryList() async {
    await Storage.remove('searchList');
  }

  static removeHistoryData(keywords) async {
    List historyList = json.decode(await Storage.getString("searchList"));
    historyList.remove(keywords);
    await Storage.setString("searchList", json.encode(historyList));
  }
}
