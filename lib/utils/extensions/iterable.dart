import 'package:collection/collection.dart';

extension SortByOrderColumnExtensions<T extends Object> on Iterable<T> {
  sortByOrderColumn() {
    return sortedBy((element) => 'orderColumn');
  }
}
