// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetPlantCollection on Isar {
  IsarCollection<Plant> get plants {
    return getCollection('Plant');
  }
}

final PlantSchema = CollectionSchema(
  name: 'Plant',
  schema:
      '{"name":"Plant","idName":"id","properties":[{"name":"created","type":"Long"},{"name":"hashCode","type":"Long"},{"name":"imagePath","type":"String"},{"name":"location","type":"String"},{"name":"modified","type":"Long"},{"name":"name","type":"String"},{"name":"stringify","type":"Bool"}],"indexes":[],"links":[]}',
  nativeAdapter: const _PlantNativeAdapter(),
  webAdapter: const _PlantWebAdapter(),
  idName: 'id',
  propertyIds: {
    'created': 0,
    'hashCode': 1,
    'imagePath': 2,
    'location': 3,
    'modified': 4,
    'name': 5,
    'stringify': 6
  },
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: null,
  getLinks: (obj) => [],
  version: 2,
);

class _PlantWebAdapter extends IsarWebTypeAdapter<Plant> {
  const _PlantWebAdapter();

  @override
  Object serialize(IsarCollection<Plant> collection, Plant object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(
        jsObj, 'created', object.created.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'imagePath', object.imagePath);
    IsarNative.jsObjectSet(jsObj, 'location', object.location);
    IsarNative.jsObjectSet(
        jsObj, 'modified', object.modified.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
    return jsObj;
  }

  @override
  Plant deserialize(IsarCollection<Plant> collection, dynamic jsObj) {
    final object = Plant(
      created: IsarNative.jsObjectGet(jsObj, 'created') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'created'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      id: IsarNative.jsObjectGet(jsObj, 'id'),
      imagePath: IsarNative.jsObjectGet(jsObj, 'imagePath'),
      location: IsarNative.jsObjectGet(jsObj, 'location') ?? '',
      modified: IsarNative.jsObjectGet(jsObj, 'modified') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'modified'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    );
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'created':
        return (IsarNative.jsObjectGet(jsObj, 'created') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'created'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'hashCode':
        return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'imagePath':
        return (IsarNative.jsObjectGet(jsObj, 'imagePath')) as P;
      case 'location':
        return (IsarNative.jsObjectGet(jsObj, 'location') ?? '') as P;
      case 'modified':
        return (IsarNative.jsObjectGet(jsObj, 'modified') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'modified'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
      case 'stringify':
        return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Plant object) {}
}

class _PlantNativeAdapter extends IsarNativeTypeAdapter<Plant> {
  const _PlantNativeAdapter();

  @override
  void serialize(IsarCollection<Plant> collection, IsarRawObject rawObj,
      Plant object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.created;
    final _created = value0;
    final value1 = object.hashCode;
    final _hashCode = value1;
    final value2 = object.imagePath;
    IsarUint8List? _imagePath;
    if (value2 != null) {
      _imagePath = IsarBinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += (_imagePath?.length ?? 0) as int;
    final value3 = object.location;
    final _location = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_location.length) as int;
    final value4 = object.modified;
    final _modified = value4;
    final value5 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += (_name.length) as int;
    final value6 = object.stringify;
    final _stringify = value6;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeDateTime(offsets[0], _created);
    writer.writeLong(offsets[1], _hashCode);
    writer.writeBytes(offsets[2], _imagePath);
    writer.writeBytes(offsets[3], _location);
    writer.writeDateTime(offsets[4], _modified);
    writer.writeBytes(offsets[5], _name);
    writer.writeBool(offsets[6], _stringify);
  }

  @override
  Plant deserialize(IsarCollection<Plant> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Plant(
      created: reader.readDateTime(offsets[0]),
      id: id,
      imagePath: reader.readStringOrNull(offsets[2]),
      location: reader.readString(offsets[3]),
      modified: reader.readDateTime(offsets[4]),
      name: reader.readString(offsets[5]),
    );
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readDateTime(offset)) as P;
      case 1:
        return (reader.readLong(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readDateTime(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (reader.readBoolOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Plant object) {}
}

extension PlantQueryWhereSort on QueryBuilder<Plant, Plant, QWhere> {
  QueryBuilder<Plant, Plant, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension PlantQueryWhere on QueryBuilder<Plant, Plant, QWhereClause> {
  QueryBuilder<Plant, Plant, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension PlantQueryFilter on QueryBuilder<Plant, Plant, QFilterCondition> {
  QueryBuilder<Plant, Plant, QAfterFilterCondition> createdEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'created',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createdGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'created',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createdLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'created',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> createdBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'created',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'imagePath',
      value: null,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'imagePath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> imagePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'imagePath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'location',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'location',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'location',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'location',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'location',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'location',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'location',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'location',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> modifiedEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'modified',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> modifiedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'modified',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> modifiedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'modified',
      value: value,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> modifiedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'modified',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<Plant, Plant, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }
}

extension PlantQueryLinks on QueryBuilder<Plant, Plant, QFilterCondition> {}

extension PlantQueryWhereSortBy on QueryBuilder<Plant, Plant, QSortBy> {
  QueryBuilder<Plant, Plant, QAfterSortBy> sortByCreated() {
    return addSortByInternal('created', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByCreatedDesc() {
    return addSortByInternal('created', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByImagePath() {
    return addSortByInternal('imagePath', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByImagePathDesc() {
    return addSortByInternal('imagePath', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLocation() {
    return addSortByInternal('location', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByLocationDesc() {
    return addSortByInternal('location', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByModified() {
    return addSortByInternal('modified', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByModifiedDesc() {
    return addSortByInternal('modified', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension PlantQueryWhereSortThenBy on QueryBuilder<Plant, Plant, QSortThenBy> {
  QueryBuilder<Plant, Plant, QAfterSortBy> thenByCreated() {
    return addSortByInternal('created', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByCreatedDesc() {
    return addSortByInternal('created', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByImagePath() {
    return addSortByInternal('imagePath', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByImagePathDesc() {
    return addSortByInternal('imagePath', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLocation() {
    return addSortByInternal('location', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByLocationDesc() {
    return addSortByInternal('location', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByModified() {
    return addSortByInternal('modified', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByModifiedDesc() {
    return addSortByInternal('modified', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Plant, Plant, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension PlantQueryWhereDistinct on QueryBuilder<Plant, Plant, QDistinct> {
  QueryBuilder<Plant, Plant, QDistinct> distinctByCreated() {
    return addDistinctByInternal('created');
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('imagePath', caseSensitive: caseSensitive);
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('location', caseSensitive: caseSensitive);
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByModified() {
    return addDistinctByInternal('modified');
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Plant, Plant, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }
}

extension PlantQueryProperty on QueryBuilder<Plant, Plant, QQueryProperty> {
  QueryBuilder<Plant, DateTime, QQueryOperations> createdProperty() {
    return addPropertyNameInternal('created');
  }

  QueryBuilder<Plant, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Plant, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Plant, String?, QQueryOperations> imagePathProperty() {
    return addPropertyNameInternal('imagePath');
  }

  QueryBuilder<Plant, String, QQueryOperations> locationProperty() {
    return addPropertyNameInternal('location');
  }

  QueryBuilder<Plant, DateTime, QQueryOperations> modifiedProperty() {
    return addPropertyNameInternal('modified');
  }

  QueryBuilder<Plant, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Plant, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }
}
