import 'package:flutter/material.dart';

import '../../domain/model/stock_metadata.dart';
import '../search/search_screen.dart';
import '../stock_detail/stock_detail_screen.dart';
import '../watchlist/watchlist_screen.dart';

class StockHomeScreen extends StatefulWidget {
  const StockHomeScreen({super.key});

  @override
  State<StockHomeScreen> createState() => _StockHomeScreenState();
}

class _StockHomeScreenState extends State<StockHomeScreen> {
  int _selectedIndex = 0;

  void _selectTab(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
  }

  void _openDetail(StockMetadata stock) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => StockDetailRoot(stock: stock),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _selectedIndex,
      children: <Widget>[
        WatchlistRoot(
          onTapSearch: () => _selectTab(1),
          onTapStock: _openDetail,
        ),
        SearchRoot(
          isActive: _selectedIndex == 1,
          onTapWatchlist: () => _selectTab(0),
          onTapStock: _openDetail,
        ),
      ],
    );
  }
}
