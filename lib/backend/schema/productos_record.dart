import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProductosRecord extends FirestoreRecord {
  ProductosRecord._(
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

  void _initializeFields() {
    _nombreProducto = snapshotData['nombreProducto'] as String?;
    _precio = castToType<double>(snapshotData['Precio']);
    _categoria = snapshotData['Categoria'] as String?;
    _imagen = snapshotData['imagen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('productos');

  static Stream<ProductosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosRecord.fromSnapshot(s));

  static Future<ProductosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductosRecord.fromSnapshot(s));

  static ProductosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosRecordData({
  String? nombreProducto,
  double? precio,
  String? categoria,
  String? imagen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreProducto': nombreProducto,
      'Precio': precio,
      'Categoria': categoria,
      'imagen': imagen,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosRecordDocumentEquality implements Equality<ProductosRecord> {
  const ProductosRecordDocumentEquality();

  @override
  bool equals(ProductosRecord? e1, ProductosRecord? e2) {
    return e1?.nombreProducto == e2?.nombreProducto &&
        e1?.precio == e2?.precio &&
        e1?.categoria == e2?.categoria &&
        e1?.imagen == e2?.imagen;
  }

  @override
  int hash(ProductosRecord? e) => const ListEquality()
      .hash([e?.nombreProducto, e?.precio, e?.categoria, e?.imagen]);

  @override
  bool isValidKey(Object? o) => o is ProductosRecord;
}
