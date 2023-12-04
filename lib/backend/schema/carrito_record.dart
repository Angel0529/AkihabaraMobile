import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';


class CarritoRecord extends FirestoreRecord {
  CarritoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreProducto" field.
  String? _nombreProducto;
  String get nombreProducto => _nombreProducto ?? '';
  bool hasNombreProducto() => _nombreProducto != null;

  // "Precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  void _initializeFields() {
    _nombreProducto = snapshotData['nombreProducto'] as String?;
    _precio = castToType<double>(snapshotData['Precio']);
    _categoria = snapshotData['Categoria'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _cantidad = castToType<int>(snapshotData['Cantidad']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carrito');

  static Stream<CarritoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarritoRecord.fromSnapshot(s));

  static Future<CarritoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarritoRecord.fromSnapshot(s));

  static CarritoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarritoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarritoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarritoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarritoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarritoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarritoRecordData({
  String? nombreProducto,
  double? precio,
  String? categoria,
  String? imagen,
  int? cantidad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreProducto': nombreProducto,
      'Precio': precio,
      'Categoria': categoria,
      'imagen': imagen,
      'Cantidad': cantidad,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarritoRecordDocumentEquality implements Equality<CarritoRecord> {
  const CarritoRecordDocumentEquality();

  @override
  bool equals(CarritoRecord? e1, CarritoRecord? e2) {
    return e1?.nombreProducto == e2?.nombreProducto &&
        e1?.precio == e2?.precio &&
        e1?.categoria == e2?.categoria &&
        e1?.imagen == e2?.imagen &&
        e1?.cantidad == e2?.cantidad;
  }

  @override
  int hash(CarritoRecord? e) => const ListEquality().hash(
      [e?.nombreProducto, e?.precio, e?.categoria, e?.imagen, e?.cantidad]);

  @override
  bool isValidKey(Object? o) => o is CarritoRecord;
}
