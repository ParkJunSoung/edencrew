import 'package:flutter/services.dart';

abstract interface class StockAssetReader {
  Future<List<int>> readBytes(String path);
}

class RootBundleStockAssetReader implements StockAssetReader {
  const RootBundleStockAssetReader();

  @override
  Future<List<int>> readBytes(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
