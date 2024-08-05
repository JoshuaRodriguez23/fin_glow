import 'package:fin_glow/data/cash_data.dart';

class CashDataRepository {
  Future<CashDataView> fetchCashData() {
    return CashDataView.loadFromAsset();
  }
}
