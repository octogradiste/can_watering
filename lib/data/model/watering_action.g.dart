// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watering_action.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetWateringActionCollection on Isar {
  IsarCollection<WateringAction> get wateringActions {
    return getCollection('WateringAction');
  }
}

final WateringActionSchema = CollectionSchema(
  name: 'WateringAction',
  schema:
      '{"name":"WateringAction","idName":"id","properties":[{"name":"amount","type":"Long"},{"name":"date","type":"Long"},{"name":"hashCode","type":"Long"},{"name":"plantId","type":"Long"},{"name":"stringify","type":"Bool"}],"indexes":[{"name":"plantId","unique":false,"properties":[{"name":"plantId","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _WateringActionNativeAdapter(),
  webAdapter: const _WateringActionWebAdapter(),
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

class _WateringActionWebAdapter extends IsarWebTypeAdapter<WateringAction> {
  const _WateringActionWebAdapter();

  @override
  Object serialize(
      IsarCollection<WateringAction> collection, WateringAction object) {
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
  WateringAction deserialize(
      IsarCollection<WateringAction> collection, dynamic jsObj) {
    final object = WateringAction(
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
  void attachLinks(Isar isar, int id, WateringAction object) {}
}

class _WateringActionNativeAdapter
    extends IsarNativeTypeAdapter<WateringAction> {
  const _WateringActionNativeAdapter();

  @override
  void serialize(
      IsarCollection<WateringAction> collection,
      IsarRawObject rawObj,
      WateringAction object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
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
  WateringAction deserialize(IsarCollection<WateringAction> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = WateringAction(
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
  void attachLinks(Isar isar, int id, WateringAction object) {}
}

extension WateringActionQueryWhereSort
    on QueryBuilder<WateringAction, WateringAction, QWhere> {
  QueryBuilder<WateringAction, WateringAction, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterWhere> anyPlantId() {
    return addWhereClauseInternal(const WhereClause(indexName: 'plantId'));
  }
}

extension WateringActionQueryWhere
    on QueryBuilder<WateringAction, WateringAction, QWhereClause> {
  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause> idEqualTo(
      int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause> idNotEqualTo(
      int? id) {
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

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause> idBetween(
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

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause>
      plantIdEqualTo(int plantId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'plantId',
      lower: [plantId],
      includeLower: true,
      upper: [plantId],
      includeUpper: true,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause>
      plantIdNotEqualTo(int plantId) {
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

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause>
      plantIdGreaterThan(
    int plantId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'plantId',
      lower: [plantId],
      includeLower: include,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause>
      plantIdLessThan(
    int plantId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'plantId',
      upper: [plantId],
      includeUpper: include,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterWhereClause>
      plantIdBetween(
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

extension WateringActionQueryFilter
    on QueryBuilder<WateringAction, WateringAction, QFilterCondition> {
  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      amountEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'amount',
      value: value,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      amountGreaterThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      amountLessThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      amountBetween(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      dateGreaterThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      dateLessThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      dateBetween(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      hashCodeGreaterThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      hashCodeLessThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      hashCodeBetween(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      plantIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'plantId',
      value: value,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      plantIdGreaterThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      plantIdLessThan(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      plantIdBetween(
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

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<WateringAction, WateringAction, QAfterFilterCondition>
      stringifyEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }
}

extension WateringActionQueryLinks
    on QueryBuilder<WateringAction, WateringAction, QFilterCondition> {}

extension WateringActionQueryWhereSortBy
    on QueryBuilder<WateringAction, WateringAction, QSortBy> {
  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortByAmount() {
    return addSortByInternal('amount', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      sortByAmountDesc() {
    return addSortByInternal('amount', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortByPlantId() {
    return addSortByInternal('plantId', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      sortByPlantIdDesc() {
    return addSortByInternal('plantId', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension WateringActionQueryWhereSortThenBy
    on QueryBuilder<WateringAction, WateringAction, QSortThenBy> {
  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenByAmount() {
    return addSortByInternal('amount', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      thenByAmountDesc() {
    return addSortByInternal('amount', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenByPlantId() {
    return addSortByInternal('plantId', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      thenByPlantIdDesc() {
    return addSortByInternal('plantId', Sort.desc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<WateringAction, WateringAction, QAfterSortBy>
      thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension WateringActionQueryWhereDistinct
    on QueryBuilder<WateringAction, WateringAction, QDistinct> {
  QueryBuilder<WateringAction, WateringAction, QDistinct> distinctByAmount() {
    return addDistinctByInternal('amount');
  }

  QueryBuilder<WateringAction, WateringAction, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<WateringAction, WateringAction, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<WateringAction, WateringAction, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<WateringAction, WateringAction, QDistinct> distinctByPlantId() {
    return addDistinctByInternal('plantId');
  }

  QueryBuilder<WateringAction, WateringAction, QDistinct>
      distinctByStringify() {
    return addDistinctByInternal('stringify');
  }
}

extension WateringActionQueryProperty
    on QueryBuilder<WateringAction, WateringAction, QQueryProperty> {
  QueryBuilder<WateringAction, int, QQueryOperations> amountProperty() {
    return addPropertyNameInternal('amount');
  }

  QueryBuilder<WateringAction, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<WateringAction, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<WateringAction, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<WateringAction, int, QQueryOperations> plantIdProperty() {
    return addPropertyNameInternal('plantId');
  }

  QueryBuilder<WateringAction, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }
}
