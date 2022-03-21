// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watering.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetWateringCollection on Isar {
  IsarCollection<Watering> get waterings {
    return getCollection('Watering');
  }
}

final WateringSchema = CollectionSchema(
  name: 'Watering',
  schema:
      '{"name":"Watering","idName":"id","properties":[{"name":"amount","type":"Long"},{"name":"date","type":"Long"},{"name":"hashCode","type":"Long"},{"name":"plantId","type":"Long"},{"name":"stringify","type":"Bool"}],"indexes":[{"name":"plantId","unique":false,"properties":[{"name":"plantId","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _WateringNativeAdapter(),
  webAdapter: const _WateringWebAdapter(),
  idName: 'id',
  propertyIds: {
    'amount': 0,
    'date': 1,
    'hashCode': 2,
    'plantId': 3,
    'stringify': 4
  },
  listProperties: {},
  indexIds: {'plantId': 0},
  indexTypes: {
    'plantId': [
      NativeIndexType.long,
    ]
  },
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

class _WateringWebAdapter extends IsarWebTypeAdapter<Watering> {
  const _WateringWebAdapter();

  @override
  Object serialize(IsarCollection<Watering> collection, Watering object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'amount', object.amount);
    IsarNative.jsObjectSet(
        jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'plantId', object.plantId);
    IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
    return jsObj;
  }

  @override
  Watering deserialize(IsarCollection<Watering> collection, dynamic jsObj) {
    final object = Watering(
      amount:
          IsarNative.jsObjectGet(jsObj, 'amount') ?? double.negativeInfinity,
      date: IsarNative.jsObjectGet(jsObj, 'date') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'date'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      id: IsarNative.jsObjectGet(jsObj, 'id'),
      plantId:
          IsarNative.jsObjectGet(jsObj, 'plantId') ?? double.negativeInfinity,
    );
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'amount':
        return (IsarNative.jsObjectGet(jsObj, 'amount') ??
            double.negativeInfinity) as P;
      case 'date':
        return (IsarNative.jsObjectGet(jsObj, 'date') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'date'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'hashCode':
        return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'plantId':
        return (IsarNative.jsObjectGet(jsObj, 'plantId') ??
            double.negativeInfinity) as P;
      case 'stringify':
        return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Watering object) {}
}

class _WateringNativeAdapter extends IsarNativeTypeAdapter<Watering> {
  const _WateringNativeAdapter();

  @override
  void serialize(IsarCollection<Watering> collection, IsarRawObject rawObj,
      Watering object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.amount;
    final _amount = value0;
    final value1 = object.date;
    final _date = value1;
    final value2 = object.hashCode;
    final _hashCode = value2;
    final value3 = object.plantId;
    final _plantId = value3;
    final value4 = object.stringify;
    final _stringify = value4;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _amount);
    writer.writeDateTime(offsets[1], _date);
    writer.writeLong(offsets[2], _hashCode);
    writer.writeLong(offsets[3], _plantId);
    writer.writeBool(offsets[4], _stringify);
  }

  @override
  Watering deserialize(IsarCollection<Watering> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Watering(
      amount: reader.readLong(offsets[0]),
      date: reader.readDateTime(offsets[1]),
      id: id,
      plantId: reader.readLong(offsets[3]),
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
        return (reader.readLong(offset)) as P;
      case 1:
        return (reader.readDateTime(offset)) as P;
      case 2:
        return (reader.readLong(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      case 4:
        return (reader.readBoolOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Watering object) {}
}

extension WateringQueryWhereSort on QueryBuilder<Watering, Watering, QWhere> {
  QueryBuilder<Watering, Watering, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Watering, Watering, QAfterWhere> anyPlantId() {
    return addWhereClauseInternal(const WhereClause(indexName: 'plantId'));
  }
}

extension WateringQueryWhere on QueryBuilder<Watering, Watering, QWhereClause> {
  QueryBuilder<Watering, Watering, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterWhereClause> idNotEqualTo(int? id) {
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

  QueryBuilder<Watering, Watering, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterWhereClause> idBetween(
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

  QueryBuilder<Watering, Watering, QAfterWhereClause> plantIdEqualTo(
      int plantId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'plantId',
      lower: [plantId],
      includeLower: true,
      upper: [plantId],
      includeUpper: true,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterWhereClause> plantIdNotEqualTo(
      int plantId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'plantId',
        upper: [plantId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'plantId',
        lower: [plantId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'plantId',
        lower: [plantId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'plantId',
        upper: [plantId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Watering, Watering, QAfterWhereClause> plantIdGreaterThan(
    int plantId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'plantId',
      lower: [plantId],
      includeLower: include,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterWhereClause> plantIdLessThan(
    int plantId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'plantId',
      upper: [plantId],
      includeUpper: include,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterWhereClause> plantIdBetween(
    int lowerPlantId,
    int upperPlantId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'plantId',
      lower: [lowerPlantId],
      includeLower: includeLower,
      upper: [upperPlantId],
      includeUpper: includeUpper,
    ));
  }
}

extension WateringQueryFilter
    on QueryBuilder<Watering, Watering, QFilterCondition> {
  QueryBuilder<Watering, Watering, QAfterFilterCondition> amountEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'amount',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> amountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'amount',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> amountLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'amount',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> amountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'amount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'date',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Watering, Watering, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Watering, Watering, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Watering, Watering, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Watering, Watering, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Watering, Watering, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Watering, Watering, QAfterFilterCondition> plantIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'plantId',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> plantIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'plantId',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> plantIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'plantId',
      value: value,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> plantIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'plantId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<Watering, Watering, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }
}

extension WateringQueryLinks
    on QueryBuilder<Watering, Watering, QFilterCondition> {}

extension WateringQueryWhereSortBy
    on QueryBuilder<Watering, Watering, QSortBy> {
  QueryBuilder<Watering, Watering, QAfterSortBy> sortByAmount() {
    return addSortByInternal('amount', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByAmountDesc() {
    return addSortByInternal('amount', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByPlantId() {
    return addSortByInternal('plantId', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByPlantIdDesc() {
    return addSortByInternal('plantId', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension WateringQueryWhereSortThenBy
    on QueryBuilder<Watering, Watering, QSortThenBy> {
  QueryBuilder<Watering, Watering, QAfterSortBy> thenByAmount() {
    return addSortByInternal('amount', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByAmountDesc() {
    return addSortByInternal('amount', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByPlantId() {
    return addSortByInternal('plantId', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByPlantIdDesc() {
    return addSortByInternal('plantId', Sort.desc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Watering, Watering, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension WateringQueryWhereDistinct
    on QueryBuilder<Watering, Watering, QDistinct> {
  QueryBuilder<Watering, Watering, QDistinct> distinctByAmount() {
    return addDistinctByInternal('amount');
  }

  QueryBuilder<Watering, Watering, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<Watering, Watering, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Watering, Watering, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Watering, Watering, QDistinct> distinctByPlantId() {
    return addDistinctByInternal('plantId');
  }

  QueryBuilder<Watering, Watering, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }
}

extension WateringQueryProperty
    on QueryBuilder<Watering, Watering, QQueryProperty> {
  QueryBuilder<Watering, int, QQueryOperations> amountProperty() {
    return addPropertyNameInternal('amount');
  }

  QueryBuilder<Watering, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<Watering, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Watering, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Watering, int, QQueryOperations> plantIdProperty() {
    return addPropertyNameInternal('plantId');
  }

  QueryBuilder<Watering, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }
}
