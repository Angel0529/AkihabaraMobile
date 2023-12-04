import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';


class OrdenesRecord extends FirestoreRecord {
  OrdenesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "codigoOrden" field.
  String? _codigoOrden;
  String get codigoOrden => _codigoOrden ?? '';
  bool hasCodigoOrden() => _codigoOrden != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "fechaCompra" field.
  DateTime? _fechaCompra;
  DateTime? get fechaCompra => _fechaCompra;
  bool hasFechaCompra() => _fechaCompra != null;

  void _initializeFields() {
    _codigoOrden = snapshotData['codigoOrden'] as String?;
    _total = castToType<double>(snapshotData['total']);
    _fechaCompra = snapshotData['fechaCompra'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ordenes');

  static Stream<OrdenesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdenesRecord.fromSnapshot(s));

  static Future<OrdenesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdenesRecord.fromSnapshot(s));

  static OrdenesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrdenesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdenesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdenesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdenesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdenesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdenesRecordData({
  String? codigoOrden,
  double? total,
  DateTime? fechaCompra,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigoOrden': codigoOrden,
      'total': total,
      'fechaCompra': fechaCompra,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdenesRecordDocumentEquality implements Equality<OrdenesRecord> {
  const OrdenesRecordDocumentEquality();

  @override
  bool equals(OrdenesRecord? e1, OrdenesRecord? e2) {
    return e1?.codigoOrden == e2?.codigoOrden &&
        e1?.total == e2?.total &&
        e1?.fechaCompra == e2?.fechaCompra;
  }

  @override
  int hash(OrdenesRecord? e) =>
      const ListEquality().hash([e?.codigoOrden, e?.total, e?.fechaCompra]);

  @override
  bool isValidKey(Object? o) => o is OrdenesRecord;
}
