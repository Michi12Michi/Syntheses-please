// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database_shared.dart';

// ignore_for_file: type=lint, unnecessary_null_comparison, unnecessary_non_null_assertion

class $CreditsTable extends Credits with TableInfo<$CreditsTable, Credit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creditMeta = const VerificationMeta('credit');
  @override
  late final GeneratedColumn<String> credit = GeneratedColumn<String>(
      'credit', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, number, credit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credits';
  @override
  VerificationContext validateIntegrity(Insertable<Credit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('credit')) {
      context.handle(_creditMeta,
          credit.isAcceptableOrUnknown(data['credit']!, _creditMeta));
    } else if (isInserting) {
      context.missing(_creditMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Credit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Credit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
      credit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}credit'])!,
    );
  }

  @override
  $CreditsTable createAlias(String alias) {
    return $CreditsTable(attachedDatabase, alias);
  }
}

class Credit extends DataClass implements Insertable<Credit> {
  final int id;
  final int number;
  final String credit;
  const Credit({required this.id, required this.number, required this.credit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<int>(number);
    map['credit'] = Variable<String>(credit);
    return map;
  }

  CreditsCompanion toCompanion(bool nullToAbsent) {
    return CreditsCompanion(
      id: Value(id),
      number: Value(number),
      credit: Value(credit),
    );
  }

  factory Credit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Credit(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<int>(json['number']),
      credit: serializer.fromJson<String>(json['credit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<int>(number),
      'credit': serializer.toJson<String>(credit),
    };
  }

  Credit copyWith({int? id, int? number, String? credit}) => Credit(
        id: id ?? this.id,
        number: number ?? this.number,
        credit: credit ?? this.credit,
      );
  Credit copyWithCompanion(CreditsCompanion data) {
    return Credit(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      credit: data.credit.present ? data.credit.value : this.credit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Credit(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('credit: $credit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, number, credit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Credit &&
          other.id == this.id &&
          other.number == this.number &&
          other.credit == this.credit);
}

class CreditsCompanion extends UpdateCompanion<Credit> {
  final Value<int> id;
  final Value<int> number;
  final Value<String> credit;
  const CreditsCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.credit = const Value.absent(),
  });
  CreditsCompanion.insert({
    this.id = const Value.absent(),
    required int number,
    required String credit,
  })  : number = Value(number),
        credit = Value(credit);
  static Insertable<Credit> custom({
    Expression<int>? id,
    Expression<int>? number,
    Expression<String>? credit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (credit != null) 'credit': credit,
    });
  }

  CreditsCompanion copyWith(
      {Value<int>? id, Value<int>? number, Value<String>? credit}) {
    return CreditsCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      credit: credit ?? this.credit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (credit.present) {
      map['credit'] = Variable<String>(credit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditsCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('credit: $credit')
          ..write(')'))
        .toString();
  }
}

class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, image, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(Insertable<Character> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final int id;
  final String name;
  final Uint8List? image;
  final String? description;
  const Character(
      {required this.id, required this.name, this.image, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<Uint8List>(image);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      name: Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Character.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<Uint8List?>(json['image']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<Uint8List?>(image),
      'description': serializer.toJson<String?>(description),
    };
  }

  Character copyWith(
          {int? id,
          String? name,
          Value<Uint8List?> image = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      Character(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image.present ? image.value : this.image,
        description: description.present ? description.value : this.description,
      );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, $driftBlobEquality.hash(image), description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.name == this.name &&
          $driftBlobEquality.equals(other.image, this.image) &&
          other.description == this.description);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<int> id;
  final Value<String> name;
  final Value<Uint8List?> image;
  final Value<String?> description;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.image = const Value.absent(),
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Character> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<Uint8List>? image,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (description != null) 'description': description,
    });
  }

  CharactersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<Uint8List?>? image,
      Value<String?>? description}) {
    return CharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $MaterialsTable extends Materials
    with TableInfo<$MaterialsTable, Material> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _commonNameMeta =
      const VerificationMeta('commonName');
  @override
  late final GeneratedColumn<String> commonName = GeneratedColumn<String>(
      'common_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iupacNameMeta =
      const VerificationMeta('iupacName');
  @override
  late final GeneratedColumn<String> iupacName = GeneratedColumn<String>(
      'iupac_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _experienceMeta =
      const VerificationMeta('experience');
  @override
  late final GeneratedColumn<double> experience = GeneratedColumn<double>(
      'experience', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: Constant(0.0));
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _temporaryMeta =
      const VerificationMeta('temporary');
  @override
  late final GeneratedColumn<bool> temporary = GeneratedColumn<bool>(
      'temporary', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("temporary" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        commonName,
        iupacName,
        image,
        description,
        price,
        experience,
        level,
        temporary
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'materials';
  @override
  VerificationContext validateIntegrity(Insertable<Material> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('common_name')) {
      context.handle(
          _commonNameMeta,
          commonName.isAcceptableOrUnknown(
              data['common_name']!, _commonNameMeta));
    } else if (isInserting) {
      context.missing(_commonNameMeta);
    }
    if (data.containsKey('iupac_name')) {
      context.handle(_iupacNameMeta,
          iupacName.isAcceptableOrUnknown(data['iupac_name']!, _iupacNameMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('experience')) {
      context.handle(
          _experienceMeta,
          experience.isAcceptableOrUnknown(
              data['experience']!, _experienceMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    }
    if (data.containsKey('temporary')) {
      context.handle(_temporaryMeta,
          temporary.isAcceptableOrUnknown(data['temporary']!, _temporaryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Material map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Material(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      commonName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}common_name'])!,
      iupacName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}iupac_name']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      experience: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}experience'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level']),
      temporary: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}temporary'])!,
    );
  }

  @override
  $MaterialsTable createAlias(String alias) {
    return $MaterialsTable(attachedDatabase, alias);
  }
}

class Material extends DataClass implements Insertable<Material> {
  final int id;
  final String commonName;
  final String? iupacName;
  final String? image;
  final String? description;
  final double? price;
  final double experience;
  final int? level;
  final bool temporary;
  const Material(
      {required this.id,
      required this.commonName,
      this.iupacName,
      this.image,
      this.description,
      this.price,
      required this.experience,
      this.level,
      required this.temporary});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['common_name'] = Variable<String>(commonName);
    if (!nullToAbsent || iupacName != null) {
      map['iupac_name'] = Variable<String>(iupacName);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    map['experience'] = Variable<double>(experience);
    if (!nullToAbsent || level != null) {
      map['level'] = Variable<int>(level);
    }
    map['temporary'] = Variable<bool>(temporary);
    return map;
  }

  MaterialsCompanion toCompanion(bool nullToAbsent) {
    return MaterialsCompanion(
      id: Value(id),
      commonName: Value(commonName),
      iupacName: iupacName == null && nullToAbsent
          ? const Value.absent()
          : Value(iupacName),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      experience: Value(experience),
      level:
          level == null && nullToAbsent ? const Value.absent() : Value(level),
      temporary: Value(temporary),
    );
  }

  factory Material.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Material(
      id: serializer.fromJson<int>(json['id']),
      commonName: serializer.fromJson<String>(json['commonName']),
      iupacName: serializer.fromJson<String?>(json['iupacName']),
      image: serializer.fromJson<String?>(json['image']),
      description: serializer.fromJson<String?>(json['description']),
      price: serializer.fromJson<double?>(json['price']),
      experience: serializer.fromJson<double>(json['experience']),
      level: serializer.fromJson<int?>(json['level']),
      temporary: serializer.fromJson<bool>(json['temporary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'commonName': serializer.toJson<String>(commonName),
      'iupacName': serializer.toJson<String?>(iupacName),
      'image': serializer.toJson<String?>(image),
      'description': serializer.toJson<String?>(description),
      'price': serializer.toJson<double?>(price),
      'experience': serializer.toJson<double>(experience),
      'level': serializer.toJson<int?>(level),
      'temporary': serializer.toJson<bool>(temporary),
    };
  }

  Material copyWith(
          {int? id,
          String? commonName,
          Value<String?> iupacName = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<double?> price = const Value.absent(),
          double? experience,
          Value<int?> level = const Value.absent(),
          bool? temporary}) =>
      Material(
        id: id ?? this.id,
        commonName: commonName ?? this.commonName,
        iupacName: iupacName.present ? iupacName.value : this.iupacName,
        image: image.present ? image.value : this.image,
        description: description.present ? description.value : this.description,
        price: price.present ? price.value : this.price,
        experience: experience ?? this.experience,
        level: level.present ? level.value : this.level,
        temporary: temporary ?? this.temporary,
      );
  Material copyWithCompanion(MaterialsCompanion data) {
    return Material(
      id: data.id.present ? data.id.value : this.id,
      commonName:
          data.commonName.present ? data.commonName.value : this.commonName,
      iupacName: data.iupacName.present ? data.iupacName.value : this.iupacName,
      image: data.image.present ? data.image.value : this.image,
      description:
          data.description.present ? data.description.value : this.description,
      price: data.price.present ? data.price.value : this.price,
      experience:
          data.experience.present ? data.experience.value : this.experience,
      level: data.level.present ? data.level.value : this.level,
      temporary: data.temporary.present ? data.temporary.value : this.temporary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Material(')
          ..write('id: $id, ')
          ..write('commonName: $commonName, ')
          ..write('iupacName: $iupacName, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('experience: $experience, ')
          ..write('level: $level, ')
          ..write('temporary: $temporary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, commonName, iupacName, image, description,
      price, experience, level, temporary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Material &&
          other.id == this.id &&
          other.commonName == this.commonName &&
          other.iupacName == this.iupacName &&
          other.image == this.image &&
          other.description == this.description &&
          other.price == this.price &&
          other.experience == this.experience &&
          other.level == this.level &&
          other.temporary == this.temporary);
}

class MaterialsCompanion extends UpdateCompanion<Material> {
  final Value<int> id;
  final Value<String> commonName;
  final Value<String?> iupacName;
  final Value<String?> image;
  final Value<String?> description;
  final Value<double?> price;
  final Value<double> experience;
  final Value<int?> level;
  final Value<bool> temporary;
  const MaterialsCompanion({
    this.id = const Value.absent(),
    this.commonName = const Value.absent(),
    this.iupacName = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.experience = const Value.absent(),
    this.level = const Value.absent(),
    this.temporary = const Value.absent(),
  });
  MaterialsCompanion.insert({
    this.id = const Value.absent(),
    required String commonName,
    this.iupacName = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.experience = const Value.absent(),
    this.level = const Value.absent(),
    this.temporary = const Value.absent(),
  }) : commonName = Value(commonName);
  static Insertable<Material> custom({
    Expression<int>? id,
    Expression<String>? commonName,
    Expression<String>? iupacName,
    Expression<String>? image,
    Expression<String>? description,
    Expression<double>? price,
    Expression<double>? experience,
    Expression<int>? level,
    Expression<bool>? temporary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (commonName != null) 'common_name': commonName,
      if (iupacName != null) 'iupac_name': iupacName,
      if (image != null) 'image': image,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (experience != null) 'experience': experience,
      if (level != null) 'level': level,
      if (temporary != null) 'temporary': temporary,
    });
  }

  MaterialsCompanion copyWith(
      {Value<int>? id,
      Value<String>? commonName,
      Value<String?>? iupacName,
      Value<String?>? image,
      Value<String?>? description,
      Value<double?>? price,
      Value<double>? experience,
      Value<int?>? level,
      Value<bool>? temporary}) {
    return MaterialsCompanion(
      id: id ?? this.id,
      commonName: commonName ?? this.commonName,
      iupacName: iupacName ?? this.iupacName,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      experience: experience ?? this.experience,
      level: level ?? this.level,
      temporary: temporary ?? this.temporary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (commonName.present) {
      map['common_name'] = Variable<String>(commonName.value);
    }
    if (iupacName.present) {
      map['iupac_name'] = Variable<String>(iupacName.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (experience.present) {
      map['experience'] = Variable<double>(experience.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (temporary.present) {
      map['temporary'] = Variable<bool>(temporary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialsCompanion(')
          ..write('id: $id, ')
          ..write('commonName: $commonName, ')
          ..write('iupacName: $iupacName, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('experience: $experience, ')
          ..write('level: $level, ')
          ..write('temporary: $temporary')
          ..write(')'))
        .toString();
  }
}

class $QuestsTable extends Quests with TableInfo<$QuestsTable, Quest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _startingDialogMeta =
      const VerificationMeta('startingDialog');
  @override
  late final GeneratedColumn<String> startingDialog = GeneratedColumn<String>(
      'starting_dialog', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _endingDialogSuccessMeta =
      const VerificationMeta('endingDialogSuccess');
  @override
  late final GeneratedColumn<String> endingDialogSuccess =
      GeneratedColumn<String>('ending_dialog_success', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 500),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _endingDialogFailureMeta =
      const VerificationMeta('endingDialogFailure');
  @override
  late final GeneratedColumn<String> endingDialogFailure =
      GeneratedColumn<String>('ending_dialog_failure', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 500),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _minimumMoneyRequiredMeta =
      const VerificationMeta('minimumMoneyRequired');
  @override
  late final GeneratedColumn<int> minimumMoneyRequired = GeneratedColumn<int>(
      'minimum_money_required', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maximumMoneyRequiredMeta =
      const VerificationMeta('maximumMoneyRequired');
  @override
  late final GeneratedColumn<int> maximumMoneyRequired = GeneratedColumn<int>(
      'maximum_money_required', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _levelWhenActiveMeta =
      const VerificationMeta('levelWhenActive');
  @override
  late final GeneratedColumn<int> levelWhenActive = GeneratedColumn<int>(
      'level_when_active', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'REFERENCES levels(id) ON DELETE SET NULL ON UPDATE CASCADE');
  static const VerificationMeta _characterIssuerMeta =
      const VerificationMeta('characterIssuer');
  @override
  late final GeneratedColumn<int> characterIssuer = GeneratedColumn<int>(
      'character_issuer', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'REFERENCES characters(id) ON DELETE SET NULL ON UPDATE CASCADE');
  static const VerificationMeta _objectiveMaterialMeta =
      const VerificationMeta('objectiveMaterial');
  @override
  late final GeneratedColumn<int> objectiveMaterial = GeneratedColumn<int>(
      'objective_material', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'REFERENCES materials(id) ON DELETE SET NULL ON UPDATE CASCADE');
  static const VerificationMeta _experienceAddedMeta =
      const VerificationMeta('experienceAdded');
  @override
  late final GeneratedColumn<int> experienceAdded = GeneratedColumn<int>(
      'experience_added', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _moneyAddedSuccessMeta =
      const VerificationMeta('moneyAddedSuccess');
  @override
  late final GeneratedColumn<int> moneyAddedSuccess = GeneratedColumn<int>(
      'money_added_success', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _moneyAddedFailureMeta =
      const VerificationMeta('moneyAddedFailure');
  @override
  late final GeneratedColumn<int> moneyAddedFailure = GeneratedColumn<int>(
      'money_added_failure', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _acceptButtonMeta =
      const VerificationMeta('acceptButton');
  @override
  late final GeneratedColumn<String> acceptButton = GeneratedColumn<String>(
      'accept_button', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant('Accetta'));
  static const VerificationMeta _declineButtonMeta =
      const VerificationMeta('declineButton');
  @override
  late final GeneratedColumn<String> declineButton = GeneratedColumn<String>(
      'decline_button', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant('Rifiuta'));
  static const VerificationMeta _minimumLikeRequiredMeta =
      const VerificationMeta('minimumLikeRequired');
  @override
  late final GeneratedColumn<int> minimumLikeRequired = GeneratedColumn<int>(
      'minimum_like_required', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maximumLikeRequiredMeta =
      const VerificationMeta('maximumLikeRequired');
  @override
  late final GeneratedColumn<int> maximumLikeRequired = GeneratedColumn<int>(
      'maximum_like_required', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _likeAddedSuccessMeta =
      const VerificationMeta('likeAddedSuccess');
  @override
  late final GeneratedColumn<int> likeAddedSuccess = GeneratedColumn<int>(
      'like_added_success', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _likeAddedFailureMeta =
      const VerificationMeta('likeAddedFailure');
  @override
  late final GeneratedColumn<int> likeAddedFailure = GeneratedColumn<int>(
      'like_added_failure', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        startingDialog,
        endingDialogSuccess,
        endingDialogFailure,
        minimumMoneyRequired,
        maximumMoneyRequired,
        image,
        levelWhenActive,
        characterIssuer,
        objectiveMaterial,
        experienceAdded,
        moneyAddedSuccess,
        moneyAddedFailure,
        acceptButton,
        declineButton,
        minimumLikeRequired,
        maximumLikeRequired,
        likeAddedSuccess,
        likeAddedFailure
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quests';
  @override
  VerificationContext validateIntegrity(Insertable<Quest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('starting_dialog')) {
      context.handle(
          _startingDialogMeta,
          startingDialog.isAcceptableOrUnknown(
              data['starting_dialog']!, _startingDialogMeta));
    } else if (isInserting) {
      context.missing(_startingDialogMeta);
    }
    if (data.containsKey('ending_dialog_success')) {
      context.handle(
          _endingDialogSuccessMeta,
          endingDialogSuccess.isAcceptableOrUnknown(
              data['ending_dialog_success']!, _endingDialogSuccessMeta));
    } else if (isInserting) {
      context.missing(_endingDialogSuccessMeta);
    }
    if (data.containsKey('ending_dialog_failure')) {
      context.handle(
          _endingDialogFailureMeta,
          endingDialogFailure.isAcceptableOrUnknown(
              data['ending_dialog_failure']!, _endingDialogFailureMeta));
    } else if (isInserting) {
      context.missing(_endingDialogFailureMeta);
    }
    if (data.containsKey('minimum_money_required')) {
      context.handle(
          _minimumMoneyRequiredMeta,
          minimumMoneyRequired.isAcceptableOrUnknown(
              data['minimum_money_required']!, _minimumMoneyRequiredMeta));
    }
    if (data.containsKey('maximum_money_required')) {
      context.handle(
          _maximumMoneyRequiredMeta,
          maximumMoneyRequired.isAcceptableOrUnknown(
              data['maximum_money_required']!, _maximumMoneyRequiredMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('level_when_active')) {
      context.handle(
          _levelWhenActiveMeta,
          levelWhenActive.isAcceptableOrUnknown(
              data['level_when_active']!, _levelWhenActiveMeta));
    }
    if (data.containsKey('character_issuer')) {
      context.handle(
          _characterIssuerMeta,
          characterIssuer.isAcceptableOrUnknown(
              data['character_issuer']!, _characterIssuerMeta));
    }
    if (data.containsKey('objective_material')) {
      context.handle(
          _objectiveMaterialMeta,
          objectiveMaterial.isAcceptableOrUnknown(
              data['objective_material']!, _objectiveMaterialMeta));
    }
    if (data.containsKey('experience_added')) {
      context.handle(
          _experienceAddedMeta,
          experienceAdded.isAcceptableOrUnknown(
              data['experience_added']!, _experienceAddedMeta));
    }
    if (data.containsKey('money_added_success')) {
      context.handle(
          _moneyAddedSuccessMeta,
          moneyAddedSuccess.isAcceptableOrUnknown(
              data['money_added_success']!, _moneyAddedSuccessMeta));
    }
    if (data.containsKey('money_added_failure')) {
      context.handle(
          _moneyAddedFailureMeta,
          moneyAddedFailure.isAcceptableOrUnknown(
              data['money_added_failure']!, _moneyAddedFailureMeta));
    }
    if (data.containsKey('accept_button')) {
      context.handle(
          _acceptButtonMeta,
          acceptButton.isAcceptableOrUnknown(
              data['accept_button']!, _acceptButtonMeta));
    }
    if (data.containsKey('decline_button')) {
      context.handle(
          _declineButtonMeta,
          declineButton.isAcceptableOrUnknown(
              data['decline_button']!, _declineButtonMeta));
    }
    if (data.containsKey('minimum_like_required')) {
      context.handle(
          _minimumLikeRequiredMeta,
          minimumLikeRequired.isAcceptableOrUnknown(
              data['minimum_like_required']!, _minimumLikeRequiredMeta));
    }
    if (data.containsKey('maximum_like_required')) {
      context.handle(
          _maximumLikeRequiredMeta,
          maximumLikeRequired.isAcceptableOrUnknown(
              data['maximum_like_required']!, _maximumLikeRequiredMeta));
    }
    if (data.containsKey('like_added_success')) {
      context.handle(
          _likeAddedSuccessMeta,
          likeAddedSuccess.isAcceptableOrUnknown(
              data['like_added_success']!, _likeAddedSuccessMeta));
    }
    if (data.containsKey('like_added_failure')) {
      context.handle(
          _likeAddedFailureMeta,
          likeAddedFailure.isAcceptableOrUnknown(
              data['like_added_failure']!, _likeAddedFailureMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      startingDialog: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}starting_dialog'])!,
      endingDialogSuccess: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ending_dialog_success'])!,
      endingDialogFailure: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}ending_dialog_failure'])!,
      minimumMoneyRequired: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}minimum_money_required']),
      maximumMoneyRequired: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}maximum_money_required']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image']),
      levelWhenActive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level_when_active']),
      characterIssuer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}character_issuer']),
      objectiveMaterial: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}objective_material']),
      experienceAdded: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}experience_added']),
      moneyAddedSuccess: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}money_added_success']),
      moneyAddedFailure: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}money_added_failure']),
      acceptButton: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}accept_button'])!,
      declineButton: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}decline_button'])!,
      minimumLikeRequired: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}minimum_like_required']),
      maximumLikeRequired: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}maximum_like_required']),
      likeAddedSuccess: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}like_added_success']),
      likeAddedFailure: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}like_added_failure']),
    );
  }

  @override
  $QuestsTable createAlias(String alias) {
    return $QuestsTable(attachedDatabase, alias);
  }
}

class Quest extends DataClass implements Insertable<Quest> {
  final int id;
  final String name;
  final String description;
  final String startingDialog;
  final String endingDialogSuccess;
  final String endingDialogFailure;
  final int? minimumMoneyRequired;
  final int? maximumMoneyRequired;
  final Uint8List? image;
  final int? levelWhenActive;
  final int? characterIssuer;
  final int? objectiveMaterial;
  final int? experienceAdded;
  final int? moneyAddedSuccess;
  final int? moneyAddedFailure;
  final String acceptButton;
  final String declineButton;
  final int? minimumLikeRequired;
  final int? maximumLikeRequired;
  final int? likeAddedSuccess;
  final int? likeAddedFailure;
  const Quest(
      {required this.id,
      required this.name,
      required this.description,
      required this.startingDialog,
      required this.endingDialogSuccess,
      required this.endingDialogFailure,
      this.minimumMoneyRequired,
      this.maximumMoneyRequired,
      this.image,
      this.levelWhenActive,
      this.characterIssuer,
      this.objectiveMaterial,
      this.experienceAdded,
      this.moneyAddedSuccess,
      this.moneyAddedFailure,
      required this.acceptButton,
      required this.declineButton,
      this.minimumLikeRequired,
      this.maximumLikeRequired,
      this.likeAddedSuccess,
      this.likeAddedFailure});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['starting_dialog'] = Variable<String>(startingDialog);
    map['ending_dialog_success'] = Variable<String>(endingDialogSuccess);
    map['ending_dialog_failure'] = Variable<String>(endingDialogFailure);
    if (!nullToAbsent || minimumMoneyRequired != null) {
      map['minimum_money_required'] = Variable<int>(minimumMoneyRequired);
    }
    if (!nullToAbsent || maximumMoneyRequired != null) {
      map['maximum_money_required'] = Variable<int>(maximumMoneyRequired);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<Uint8List>(image);
    }
    if (!nullToAbsent || levelWhenActive != null) {
      map['level_when_active'] = Variable<int>(levelWhenActive);
    }
    if (!nullToAbsent || characterIssuer != null) {
      map['character_issuer'] = Variable<int>(characterIssuer);
    }
    if (!nullToAbsent || objectiveMaterial != null) {
      map['objective_material'] = Variable<int>(objectiveMaterial);
    }
    if (!nullToAbsent || experienceAdded != null) {
      map['experience_added'] = Variable<int>(experienceAdded);
    }
    if (!nullToAbsent || moneyAddedSuccess != null) {
      map['money_added_success'] = Variable<int>(moneyAddedSuccess);
    }
    if (!nullToAbsent || moneyAddedFailure != null) {
      map['money_added_failure'] = Variable<int>(moneyAddedFailure);
    }
    map['accept_button'] = Variable<String>(acceptButton);
    map['decline_button'] = Variable<String>(declineButton);
    if (!nullToAbsent || minimumLikeRequired != null) {
      map['minimum_like_required'] = Variable<int>(minimumLikeRequired);
    }
    if (!nullToAbsent || maximumLikeRequired != null) {
      map['maximum_like_required'] = Variable<int>(maximumLikeRequired);
    }
    if (!nullToAbsent || likeAddedSuccess != null) {
      map['like_added_success'] = Variable<int>(likeAddedSuccess);
    }
    if (!nullToAbsent || likeAddedFailure != null) {
      map['like_added_failure'] = Variable<int>(likeAddedFailure);
    }
    return map;
  }

  QuestsCompanion toCompanion(bool nullToAbsent) {
    return QuestsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      startingDialog: Value(startingDialog),
      endingDialogSuccess: Value(endingDialogSuccess),
      endingDialogFailure: Value(endingDialogFailure),
      minimumMoneyRequired: minimumMoneyRequired == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumMoneyRequired),
      maximumMoneyRequired: maximumMoneyRequired == null && nullToAbsent
          ? const Value.absent()
          : Value(maximumMoneyRequired),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      levelWhenActive: levelWhenActive == null && nullToAbsent
          ? const Value.absent()
          : Value(levelWhenActive),
      characterIssuer: characterIssuer == null && nullToAbsent
          ? const Value.absent()
          : Value(characterIssuer),
      objectiveMaterial: objectiveMaterial == null && nullToAbsent
          ? const Value.absent()
          : Value(objectiveMaterial),
      experienceAdded: experienceAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(experienceAdded),
      moneyAddedSuccess: moneyAddedSuccess == null && nullToAbsent
          ? const Value.absent()
          : Value(moneyAddedSuccess),
      moneyAddedFailure: moneyAddedFailure == null && nullToAbsent
          ? const Value.absent()
          : Value(moneyAddedFailure),
      acceptButton: Value(acceptButton),
      declineButton: Value(declineButton),
      minimumLikeRequired: minimumLikeRequired == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumLikeRequired),
      maximumLikeRequired: maximumLikeRequired == null && nullToAbsent
          ? const Value.absent()
          : Value(maximumLikeRequired),
      likeAddedSuccess: likeAddedSuccess == null && nullToAbsent
          ? const Value.absent()
          : Value(likeAddedSuccess),
      likeAddedFailure: likeAddedFailure == null && nullToAbsent
          ? const Value.absent()
          : Value(likeAddedFailure),
    );
  }

  factory Quest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quest(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      startingDialog: serializer.fromJson<String>(json['startingDialog']),
      endingDialogSuccess:
          serializer.fromJson<String>(json['endingDialogSuccess']),
      endingDialogFailure:
          serializer.fromJson<String>(json['endingDialogFailure']),
      minimumMoneyRequired:
          serializer.fromJson<int?>(json['minimumMoneyRequired']),
      maximumMoneyRequired:
          serializer.fromJson<int?>(json['maximumMoneyRequired']),
      image: serializer.fromJson<Uint8List?>(json['image']),
      levelWhenActive: serializer.fromJson<int?>(json['levelWhenActive']),
      characterIssuer: serializer.fromJson<int?>(json['characterIssuer']),
      objectiveMaterial: serializer.fromJson<int?>(json['objectiveMaterial']),
      experienceAdded: serializer.fromJson<int?>(json['experienceAdded']),
      moneyAddedSuccess: serializer.fromJson<int?>(json['moneyAddedSuccess']),
      moneyAddedFailure: serializer.fromJson<int?>(json['moneyAddedFailure']),
      acceptButton: serializer.fromJson<String>(json['acceptButton']),
      declineButton: serializer.fromJson<String>(json['declineButton']),
      minimumLikeRequired:
          serializer.fromJson<int?>(json['minimumLikeRequired']),
      maximumLikeRequired:
          serializer.fromJson<int?>(json['maximumLikeRequired']),
      likeAddedSuccess: serializer.fromJson<int?>(json['likeAddedSuccess']),
      likeAddedFailure: serializer.fromJson<int?>(json['likeAddedFailure']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'startingDialog': serializer.toJson<String>(startingDialog),
      'endingDialogSuccess': serializer.toJson<String>(endingDialogSuccess),
      'endingDialogFailure': serializer.toJson<String>(endingDialogFailure),
      'minimumMoneyRequired': serializer.toJson<int?>(minimumMoneyRequired),
      'maximumMoneyRequired': serializer.toJson<int?>(maximumMoneyRequired),
      'image': serializer.toJson<Uint8List?>(image),
      'levelWhenActive': serializer.toJson<int?>(levelWhenActive),
      'characterIssuer': serializer.toJson<int?>(characterIssuer),
      'objectiveMaterial': serializer.toJson<int?>(objectiveMaterial),
      'experienceAdded': serializer.toJson<int?>(experienceAdded),
      'moneyAddedSuccess': serializer.toJson<int?>(moneyAddedSuccess),
      'moneyAddedFailure': serializer.toJson<int?>(moneyAddedFailure),
      'acceptButton': serializer.toJson<String>(acceptButton),
      'declineButton': serializer.toJson<String>(declineButton),
      'minimumLikeRequired': serializer.toJson<int?>(minimumLikeRequired),
      'maximumLikeRequired': serializer.toJson<int?>(maximumLikeRequired),
      'likeAddedSuccess': serializer.toJson<int?>(likeAddedSuccess),
      'likeAddedFailure': serializer.toJson<int?>(likeAddedFailure),
    };
  }

  Quest copyWith(
          {int? id,
          String? name,
          String? description,
          String? startingDialog,
          String? endingDialogSuccess,
          String? endingDialogFailure,
          Value<int?> minimumMoneyRequired = const Value.absent(),
          Value<int?> maximumMoneyRequired = const Value.absent(),
          Value<Uint8List?> image = const Value.absent(),
          Value<int?> levelWhenActive = const Value.absent(),
          Value<int?> characterIssuer = const Value.absent(),
          Value<int?> objectiveMaterial = const Value.absent(),
          Value<int?> experienceAdded = const Value.absent(),
          Value<int?> moneyAddedSuccess = const Value.absent(),
          Value<int?> moneyAddedFailure = const Value.absent(),
          String? acceptButton,
          String? declineButton,
          Value<int?> minimumLikeRequired = const Value.absent(),
          Value<int?> maximumLikeRequired = const Value.absent(),
          Value<int?> likeAddedSuccess = const Value.absent(),
          Value<int?> likeAddedFailure = const Value.absent()}) =>
      Quest(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        startingDialog: startingDialog ?? this.startingDialog,
        endingDialogSuccess: endingDialogSuccess ?? this.endingDialogSuccess,
        endingDialogFailure: endingDialogFailure ?? this.endingDialogFailure,
        minimumMoneyRequired: minimumMoneyRequired.present
            ? minimumMoneyRequired.value
            : this.minimumMoneyRequired,
        maximumMoneyRequired: maximumMoneyRequired.present
            ? maximumMoneyRequired.value
            : this.maximumMoneyRequired,
        image: image.present ? image.value : this.image,
        levelWhenActive: levelWhenActive.present
            ? levelWhenActive.value
            : this.levelWhenActive,
        characterIssuer: characterIssuer.present
            ? characterIssuer.value
            : this.characterIssuer,
        objectiveMaterial: objectiveMaterial.present
            ? objectiveMaterial.value
            : this.objectiveMaterial,
        experienceAdded: experienceAdded.present
            ? experienceAdded.value
            : this.experienceAdded,
        moneyAddedSuccess: moneyAddedSuccess.present
            ? moneyAddedSuccess.value
            : this.moneyAddedSuccess,
        moneyAddedFailure: moneyAddedFailure.present
            ? moneyAddedFailure.value
            : this.moneyAddedFailure,
        acceptButton: acceptButton ?? this.acceptButton,
        declineButton: declineButton ?? this.declineButton,
        minimumLikeRequired: minimumLikeRequired.present
            ? minimumLikeRequired.value
            : this.minimumLikeRequired,
        maximumLikeRequired: maximumLikeRequired.present
            ? maximumLikeRequired.value
            : this.maximumLikeRequired,
        likeAddedSuccess: likeAddedSuccess.present
            ? likeAddedSuccess.value
            : this.likeAddedSuccess,
        likeAddedFailure: likeAddedFailure.present
            ? likeAddedFailure.value
            : this.likeAddedFailure,
      );
  Quest copyWithCompanion(QuestsCompanion data) {
    return Quest(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      startingDialog: data.startingDialog.present
          ? data.startingDialog.value
          : this.startingDialog,
      endingDialogSuccess: data.endingDialogSuccess.present
          ? data.endingDialogSuccess.value
          : this.endingDialogSuccess,
      endingDialogFailure: data.endingDialogFailure.present
          ? data.endingDialogFailure.value
          : this.endingDialogFailure,
      minimumMoneyRequired: data.minimumMoneyRequired.present
          ? data.minimumMoneyRequired.value
          : this.minimumMoneyRequired,
      maximumMoneyRequired: data.maximumMoneyRequired.present
          ? data.maximumMoneyRequired.value
          : this.maximumMoneyRequired,
      image: data.image.present ? data.image.value : this.image,
      levelWhenActive: data.levelWhenActive.present
          ? data.levelWhenActive.value
          : this.levelWhenActive,
      characterIssuer: data.characterIssuer.present
          ? data.characterIssuer.value
          : this.characterIssuer,
      objectiveMaterial: data.objectiveMaterial.present
          ? data.objectiveMaterial.value
          : this.objectiveMaterial,
      experienceAdded: data.experienceAdded.present
          ? data.experienceAdded.value
          : this.experienceAdded,
      moneyAddedSuccess: data.moneyAddedSuccess.present
          ? data.moneyAddedSuccess.value
          : this.moneyAddedSuccess,
      moneyAddedFailure: data.moneyAddedFailure.present
          ? data.moneyAddedFailure.value
          : this.moneyAddedFailure,
      acceptButton: data.acceptButton.present
          ? data.acceptButton.value
          : this.acceptButton,
      declineButton: data.declineButton.present
          ? data.declineButton.value
          : this.declineButton,
      minimumLikeRequired: data.minimumLikeRequired.present
          ? data.minimumLikeRequired.value
          : this.minimumLikeRequired,
      maximumLikeRequired: data.maximumLikeRequired.present
          ? data.maximumLikeRequired.value
          : this.maximumLikeRequired,
      likeAddedSuccess: data.likeAddedSuccess.present
          ? data.likeAddedSuccess.value
          : this.likeAddedSuccess,
      likeAddedFailure: data.likeAddedFailure.present
          ? data.likeAddedFailure.value
          : this.likeAddedFailure,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quest(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startingDialog: $startingDialog, ')
          ..write('endingDialogSuccess: $endingDialogSuccess, ')
          ..write('endingDialogFailure: $endingDialogFailure, ')
          ..write('minimumMoneyRequired: $minimumMoneyRequired, ')
          ..write('maximumMoneyRequired: $maximumMoneyRequired, ')
          ..write('image: $image, ')
          ..write('levelWhenActive: $levelWhenActive, ')
          ..write('characterIssuer: $characterIssuer, ')
          ..write('objectiveMaterial: $objectiveMaterial, ')
          ..write('experienceAdded: $experienceAdded, ')
          ..write('moneyAddedSuccess: $moneyAddedSuccess, ')
          ..write('moneyAddedFailure: $moneyAddedFailure, ')
          ..write('acceptButton: $acceptButton, ')
          ..write('declineButton: $declineButton, ')
          ..write('minimumLikeRequired: $minimumLikeRequired, ')
          ..write('maximumLikeRequired: $maximumLikeRequired, ')
          ..write('likeAddedSuccess: $likeAddedSuccess, ')
          ..write('likeAddedFailure: $likeAddedFailure')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        description,
        startingDialog,
        endingDialogSuccess,
        endingDialogFailure,
        minimumMoneyRequired,
        maximumMoneyRequired,
        $driftBlobEquality.hash(image),
        levelWhenActive,
        characterIssuer,
        objectiveMaterial,
        experienceAdded,
        moneyAddedSuccess,
        moneyAddedFailure,
        acceptButton,
        declineButton,
        minimumLikeRequired,
        maximumLikeRequired,
        likeAddedSuccess,
        likeAddedFailure
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quest &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.startingDialog == this.startingDialog &&
          other.endingDialogSuccess == this.endingDialogSuccess &&
          other.endingDialogFailure == this.endingDialogFailure &&
          other.minimumMoneyRequired == this.minimumMoneyRequired &&
          other.maximumMoneyRequired == this.maximumMoneyRequired &&
          $driftBlobEquality.equals(other.image, this.image) &&
          other.levelWhenActive == this.levelWhenActive &&
          other.characterIssuer == this.characterIssuer &&
          other.objectiveMaterial == this.objectiveMaterial &&
          other.experienceAdded == this.experienceAdded &&
          other.moneyAddedSuccess == this.moneyAddedSuccess &&
          other.moneyAddedFailure == this.moneyAddedFailure &&
          other.acceptButton == this.acceptButton &&
          other.declineButton == this.declineButton &&
          other.minimumLikeRequired == this.minimumLikeRequired &&
          other.maximumLikeRequired == this.maximumLikeRequired &&
          other.likeAddedSuccess == this.likeAddedSuccess &&
          other.likeAddedFailure == this.likeAddedFailure);
}

class QuestsCompanion extends UpdateCompanion<Quest> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> startingDialog;
  final Value<String> endingDialogSuccess;
  final Value<String> endingDialogFailure;
  final Value<int?> minimumMoneyRequired;
  final Value<int?> maximumMoneyRequired;
  final Value<Uint8List?> image;
  final Value<int?> levelWhenActive;
  final Value<int?> characterIssuer;
  final Value<int?> objectiveMaterial;
  final Value<int?> experienceAdded;
  final Value<int?> moneyAddedSuccess;
  final Value<int?> moneyAddedFailure;
  final Value<String> acceptButton;
  final Value<String> declineButton;
  final Value<int?> minimumLikeRequired;
  final Value<int?> maximumLikeRequired;
  final Value<int?> likeAddedSuccess;
  final Value<int?> likeAddedFailure;
  const QuestsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.startingDialog = const Value.absent(),
    this.endingDialogSuccess = const Value.absent(),
    this.endingDialogFailure = const Value.absent(),
    this.minimumMoneyRequired = const Value.absent(),
    this.maximumMoneyRequired = const Value.absent(),
    this.image = const Value.absent(),
    this.levelWhenActive = const Value.absent(),
    this.characterIssuer = const Value.absent(),
    this.objectiveMaterial = const Value.absent(),
    this.experienceAdded = const Value.absent(),
    this.moneyAddedSuccess = const Value.absent(),
    this.moneyAddedFailure = const Value.absent(),
    this.acceptButton = const Value.absent(),
    this.declineButton = const Value.absent(),
    this.minimumLikeRequired = const Value.absent(),
    this.maximumLikeRequired = const Value.absent(),
    this.likeAddedSuccess = const Value.absent(),
    this.likeAddedFailure = const Value.absent(),
  });
  QuestsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String startingDialog,
    required String endingDialogSuccess,
    required String endingDialogFailure,
    this.minimumMoneyRequired = const Value.absent(),
    this.maximumMoneyRequired = const Value.absent(),
    this.image = const Value.absent(),
    this.levelWhenActive = const Value.absent(),
    this.characterIssuer = const Value.absent(),
    this.objectiveMaterial = const Value.absent(),
    this.experienceAdded = const Value.absent(),
    this.moneyAddedSuccess = const Value.absent(),
    this.moneyAddedFailure = const Value.absent(),
    this.acceptButton = const Value.absent(),
    this.declineButton = const Value.absent(),
    this.minimumLikeRequired = const Value.absent(),
    this.maximumLikeRequired = const Value.absent(),
    this.likeAddedSuccess = const Value.absent(),
    this.likeAddedFailure = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        startingDialog = Value(startingDialog),
        endingDialogSuccess = Value(endingDialogSuccess),
        endingDialogFailure = Value(endingDialogFailure);
  static Insertable<Quest> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? startingDialog,
    Expression<String>? endingDialogSuccess,
    Expression<String>? endingDialogFailure,
    Expression<int>? minimumMoneyRequired,
    Expression<int>? maximumMoneyRequired,
    Expression<Uint8List>? image,
    Expression<int>? levelWhenActive,
    Expression<int>? characterIssuer,
    Expression<int>? objectiveMaterial,
    Expression<int>? experienceAdded,
    Expression<int>? moneyAddedSuccess,
    Expression<int>? moneyAddedFailure,
    Expression<String>? acceptButton,
    Expression<String>? declineButton,
    Expression<int>? minimumLikeRequired,
    Expression<int>? maximumLikeRequired,
    Expression<int>? likeAddedSuccess,
    Expression<int>? likeAddedFailure,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (startingDialog != null) 'starting_dialog': startingDialog,
      if (endingDialogSuccess != null)
        'ending_dialog_success': endingDialogSuccess,
      if (endingDialogFailure != null)
        'ending_dialog_failure': endingDialogFailure,
      if (minimumMoneyRequired != null)
        'minimum_money_required': minimumMoneyRequired,
      if (maximumMoneyRequired != null)
        'maximum_money_required': maximumMoneyRequired,
      if (image != null) 'image': image,
      if (levelWhenActive != null) 'level_when_active': levelWhenActive,
      if (characterIssuer != null) 'character_issuer': characterIssuer,
      if (objectiveMaterial != null) 'objective_material': objectiveMaterial,
      if (experienceAdded != null) 'experience_added': experienceAdded,
      if (moneyAddedSuccess != null) 'money_added_success': moneyAddedSuccess,
      if (moneyAddedFailure != null) 'money_added_failure': moneyAddedFailure,
      if (acceptButton != null) 'accept_button': acceptButton,
      if (declineButton != null) 'decline_button': declineButton,
      if (minimumLikeRequired != null)
        'minimum_like_required': minimumLikeRequired,
      if (maximumLikeRequired != null)
        'maximum_like_required': maximumLikeRequired,
      if (likeAddedSuccess != null) 'like_added_success': likeAddedSuccess,
      if (likeAddedFailure != null) 'like_added_failure': likeAddedFailure,
    });
  }

  QuestsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? startingDialog,
      Value<String>? endingDialogSuccess,
      Value<String>? endingDialogFailure,
      Value<int?>? minimumMoneyRequired,
      Value<int?>? maximumMoneyRequired,
      Value<Uint8List?>? image,
      Value<int?>? levelWhenActive,
      Value<int?>? characterIssuer,
      Value<int?>? objectiveMaterial,
      Value<int?>? experienceAdded,
      Value<int?>? moneyAddedSuccess,
      Value<int?>? moneyAddedFailure,
      Value<String>? acceptButton,
      Value<String>? declineButton,
      Value<int?>? minimumLikeRequired,
      Value<int?>? maximumLikeRequired,
      Value<int?>? likeAddedSuccess,
      Value<int?>? likeAddedFailure}) {
    return QuestsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startingDialog: startingDialog ?? this.startingDialog,
      endingDialogSuccess: endingDialogSuccess ?? this.endingDialogSuccess,
      endingDialogFailure: endingDialogFailure ?? this.endingDialogFailure,
      minimumMoneyRequired: minimumMoneyRequired ?? this.minimumMoneyRequired,
      maximumMoneyRequired: maximumMoneyRequired ?? this.maximumMoneyRequired,
      image: image ?? this.image,
      levelWhenActive: levelWhenActive ?? this.levelWhenActive,
      characterIssuer: characterIssuer ?? this.characterIssuer,
      objectiveMaterial: objectiveMaterial ?? this.objectiveMaterial,
      experienceAdded: experienceAdded ?? this.experienceAdded,
      moneyAddedSuccess: moneyAddedSuccess ?? this.moneyAddedSuccess,
      moneyAddedFailure: moneyAddedFailure ?? this.moneyAddedFailure,
      acceptButton: acceptButton ?? this.acceptButton,
      declineButton: declineButton ?? this.declineButton,
      minimumLikeRequired: minimumLikeRequired ?? this.minimumLikeRequired,
      maximumLikeRequired: maximumLikeRequired ?? this.maximumLikeRequired,
      likeAddedSuccess: likeAddedSuccess ?? this.likeAddedSuccess,
      likeAddedFailure: likeAddedFailure ?? this.likeAddedFailure,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startingDialog.present) {
      map['starting_dialog'] = Variable<String>(startingDialog.value);
    }
    if (endingDialogSuccess.present) {
      map['ending_dialog_success'] =
          Variable<String>(endingDialogSuccess.value);
    }
    if (endingDialogFailure.present) {
      map['ending_dialog_failure'] =
          Variable<String>(endingDialogFailure.value);
    }
    if (minimumMoneyRequired.present) {
      map['minimum_money_required'] = Variable<int>(minimumMoneyRequired.value);
    }
    if (maximumMoneyRequired.present) {
      map['maximum_money_required'] = Variable<int>(maximumMoneyRequired.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (levelWhenActive.present) {
      map['level_when_active'] = Variable<int>(levelWhenActive.value);
    }
    if (characterIssuer.present) {
      map['character_issuer'] = Variable<int>(characterIssuer.value);
    }
    if (objectiveMaterial.present) {
      map['objective_material'] = Variable<int>(objectiveMaterial.value);
    }
    if (experienceAdded.present) {
      map['experience_added'] = Variable<int>(experienceAdded.value);
    }
    if (moneyAddedSuccess.present) {
      map['money_added_success'] = Variable<int>(moneyAddedSuccess.value);
    }
    if (moneyAddedFailure.present) {
      map['money_added_failure'] = Variable<int>(moneyAddedFailure.value);
    }
    if (acceptButton.present) {
      map['accept_button'] = Variable<String>(acceptButton.value);
    }
    if (declineButton.present) {
      map['decline_button'] = Variable<String>(declineButton.value);
    }
    if (minimumLikeRequired.present) {
      map['minimum_like_required'] = Variable<int>(minimumLikeRequired.value);
    }
    if (maximumLikeRequired.present) {
      map['maximum_like_required'] = Variable<int>(maximumLikeRequired.value);
    }
    if (likeAddedSuccess.present) {
      map['like_added_success'] = Variable<int>(likeAddedSuccess.value);
    }
    if (likeAddedFailure.present) {
      map['like_added_failure'] = Variable<int>(likeAddedFailure.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startingDialog: $startingDialog, ')
          ..write('endingDialogSuccess: $endingDialogSuccess, ')
          ..write('endingDialogFailure: $endingDialogFailure, ')
          ..write('minimumMoneyRequired: $minimumMoneyRequired, ')
          ..write('maximumMoneyRequired: $maximumMoneyRequired, ')
          ..write('image: $image, ')
          ..write('levelWhenActive: $levelWhenActive, ')
          ..write('characterIssuer: $characterIssuer, ')
          ..write('objectiveMaterial: $objectiveMaterial, ')
          ..write('experienceAdded: $experienceAdded, ')
          ..write('moneyAddedSuccess: $moneyAddedSuccess, ')
          ..write('moneyAddedFailure: $moneyAddedFailure, ')
          ..write('acceptButton: $acceptButton, ')
          ..write('declineButton: $declineButton, ')
          ..write('minimumLikeRequired: $minimumLikeRequired, ')
          ..write('maximumLikeRequired: $maximumLikeRequired, ')
          ..write('likeAddedSuccess: $likeAddedSuccess, ')
          ..write('likeAddedFailure: $likeAddedFailure')
          ..write(')'))
        .toString();
  }
}

class $LevelsTable extends Levels with TableInfo<$LevelsTable, Level> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _levelNameMeta =
      const VerificationMeta('levelName');
  @override
  late final GeneratedColumn<String> levelName = GeneratedColumn<String>(
      'level_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _requiredExperienceMeta =
      const VerificationMeta('requiredExperience');
  @override
  late final GeneratedColumn<int> requiredExperience = GeneratedColumn<int>(
      'required_experience', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _questRequiredMeta =
      const VerificationMeta('questRequired');
  @override
  late final GeneratedColumn<int> questRequired = GeneratedColumn<int>(
      'quest_required', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'REFERENCES quests(id) ON DELETE SET NULL ON UPDATE CASCADE');
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, levelName, description, requiredExperience, questRequired, number];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'levels';
  @override
  VerificationContext validateIntegrity(Insertable<Level> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('level_name')) {
      context.handle(_levelNameMeta,
          levelName.isAcceptableOrUnknown(data['level_name']!, _levelNameMeta));
    } else if (isInserting) {
      context.missing(_levelNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('required_experience')) {
      context.handle(
          _requiredExperienceMeta,
          requiredExperience.isAcceptableOrUnknown(
              data['required_experience']!, _requiredExperienceMeta));
    } else if (isInserting) {
      context.missing(_requiredExperienceMeta);
    }
    if (data.containsKey('quest_required')) {
      context.handle(
          _questRequiredMeta,
          questRequired.isAcceptableOrUnknown(
              data['quest_required']!, _questRequiredMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Level map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Level(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      levelName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      requiredExperience: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}required_experience'])!,
      questRequired: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quest_required']),
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
    );
  }

  @override
  $LevelsTable createAlias(String alias) {
    return $LevelsTable(attachedDatabase, alias);
  }
}

class Level extends DataClass implements Insertable<Level> {
  final int id;
  final String levelName;
  final String? description;
  final int requiredExperience;
  final int? questRequired;
  final int number;
  const Level(
      {required this.id,
      required this.levelName,
      this.description,
      required this.requiredExperience,
      this.questRequired,
      required this.number});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['level_name'] = Variable<String>(levelName);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['required_experience'] = Variable<int>(requiredExperience);
    if (!nullToAbsent || questRequired != null) {
      map['quest_required'] = Variable<int>(questRequired);
    }
    map['number'] = Variable<int>(number);
    return map;
  }

  LevelsCompanion toCompanion(bool nullToAbsent) {
    return LevelsCompanion(
      id: Value(id),
      levelName: Value(levelName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      requiredExperience: Value(requiredExperience),
      questRequired: questRequired == null && nullToAbsent
          ? const Value.absent()
          : Value(questRequired),
      number: Value(number),
    );
  }

  factory Level.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Level(
      id: serializer.fromJson<int>(json['id']),
      levelName: serializer.fromJson<String>(json['levelName']),
      description: serializer.fromJson<String?>(json['description']),
      requiredExperience: serializer.fromJson<int>(json['requiredExperience']),
      questRequired: serializer.fromJson<int?>(json['questRequired']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'levelName': serializer.toJson<String>(levelName),
      'description': serializer.toJson<String?>(description),
      'requiredExperience': serializer.toJson<int>(requiredExperience),
      'questRequired': serializer.toJson<int?>(questRequired),
      'number': serializer.toJson<int>(number),
    };
  }

  Level copyWith(
          {int? id,
          String? levelName,
          Value<String?> description = const Value.absent(),
          int? requiredExperience,
          Value<int?> questRequired = const Value.absent(),
          int? number}) =>
      Level(
        id: id ?? this.id,
        levelName: levelName ?? this.levelName,
        description: description.present ? description.value : this.description,
        requiredExperience: requiredExperience ?? this.requiredExperience,
        questRequired:
            questRequired.present ? questRequired.value : this.questRequired,
        number: number ?? this.number,
      );
  Level copyWithCompanion(LevelsCompanion data) {
    return Level(
      id: data.id.present ? data.id.value : this.id,
      levelName: data.levelName.present ? data.levelName.value : this.levelName,
      description:
          data.description.present ? data.description.value : this.description,
      requiredExperience: data.requiredExperience.present
          ? data.requiredExperience.value
          : this.requiredExperience,
      questRequired: data.questRequired.present
          ? data.questRequired.value
          : this.questRequired,
      number: data.number.present ? data.number.value : this.number,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Level(')
          ..write('id: $id, ')
          ..write('levelName: $levelName, ')
          ..write('description: $description, ')
          ..write('requiredExperience: $requiredExperience, ')
          ..write('questRequired: $questRequired, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, levelName, description, requiredExperience, questRequired, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Level &&
          other.id == this.id &&
          other.levelName == this.levelName &&
          other.description == this.description &&
          other.requiredExperience == this.requiredExperience &&
          other.questRequired == this.questRequired &&
          other.number == this.number);
}

class LevelsCompanion extends UpdateCompanion<Level> {
  final Value<int> id;
  final Value<String> levelName;
  final Value<String?> description;
  final Value<int> requiredExperience;
  final Value<int?> questRequired;
  final Value<int> number;
  const LevelsCompanion({
    this.id = const Value.absent(),
    this.levelName = const Value.absent(),
    this.description = const Value.absent(),
    this.requiredExperience = const Value.absent(),
    this.questRequired = const Value.absent(),
    this.number = const Value.absent(),
  });
  LevelsCompanion.insert({
    this.id = const Value.absent(),
    required String levelName,
    this.description = const Value.absent(),
    required int requiredExperience,
    this.questRequired = const Value.absent(),
    this.number = const Value.absent(),
  })  : levelName = Value(levelName),
        requiredExperience = Value(requiredExperience);
  static Insertable<Level> custom({
    Expression<int>? id,
    Expression<String>? levelName,
    Expression<String>? description,
    Expression<int>? requiredExperience,
    Expression<int>? questRequired,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (levelName != null) 'level_name': levelName,
      if (description != null) 'description': description,
      if (requiredExperience != null) 'required_experience': requiredExperience,
      if (questRequired != null) 'quest_required': questRequired,
      if (number != null) 'number': number,
    });
  }

  LevelsCompanion copyWith(
      {Value<int>? id,
      Value<String>? levelName,
      Value<String?>? description,
      Value<int>? requiredExperience,
      Value<int?>? questRequired,
      Value<int>? number}) {
    return LevelsCompanion(
      id: id ?? this.id,
      levelName: levelName ?? this.levelName,
      description: description ?? this.description,
      requiredExperience: requiredExperience ?? this.requiredExperience,
      questRequired: questRequired ?? this.questRequired,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (levelName.present) {
      map['level_name'] = Variable<String>(levelName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (requiredExperience.present) {
      map['required_experience'] = Variable<int>(requiredExperience.value);
    }
    if (questRequired.present) {
      map['quest_required'] = Variable<int>(questRequired.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelsCompanion(')
          ..write('id: $id, ')
          ..write('levelName: $levelName, ')
          ..write('description: $description, ')
          ..write('requiredExperience: $requiredExperience, ')
          ..write('questRequired: $questRequired, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

class $BlogsTable extends Blogs with TableInfo<$BlogsTable, Blog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES levels(id) ON DELETE RESTRICT ON UPDATE CASCADE');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, level, title, description, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blogs';
  @override
  VerificationContext validateIntegrity(Insertable<Blog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Blog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image']),
    );
  }

  @override
  $BlogsTable createAlias(String alias) {
    return $BlogsTable(attachedDatabase, alias);
  }
}

class Blog extends DataClass implements Insertable<Blog> {
  final int id;
  final int level;
  final String title;
  final String? description;
  final Uint8List? image;
  const Blog(
      {required this.id,
      required this.level,
      required this.title,
      this.description,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['level'] = Variable<int>(level);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<Uint8List>(image);
    }
    return map;
  }

  BlogsCompanion toCompanion(bool nullToAbsent) {
    return BlogsCompanion(
      id: Value(id),
      level: Value(level),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory Blog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Blog(
      id: serializer.fromJson<int>(json['id']),
      level: serializer.fromJson<int>(json['level']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<Uint8List?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'level': serializer.toJson<int>(level),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<Uint8List?>(image),
    };
  }

  Blog copyWith(
          {int? id,
          int? level,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<Uint8List?> image = const Value.absent()}) =>
      Blog(
        id: id ?? this.id,
        level: level ?? this.level,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
      );
  Blog copyWithCompanion(BlogsCompanion data) {
    return Blog(
      id: data.id.present ? data.id.value : this.id,
      level: data.level.present ? data.level.value : this.level,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Blog(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, level, title, description, $driftBlobEquality.hash(image));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Blog &&
          other.id == this.id &&
          other.level == this.level &&
          other.title == this.title &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.image, this.image));
}

class BlogsCompanion extends UpdateCompanion<Blog> {
  final Value<int> id;
  final Value<int> level;
  final Value<String> title;
  final Value<String?> description;
  final Value<Uint8List?> image;
  const BlogsCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
  });
  BlogsCompanion.insert({
    this.id = const Value.absent(),
    required int level,
    required String title,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
  })  : level = Value(level),
        title = Value(title);
  static Insertable<Blog> custom({
    Expression<int>? id,
    Expression<int>? level,
    Expression<String>? title,
    Expression<String>? description,
    Expression<Uint8List>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
    });
  }

  BlogsCompanion copyWith(
      {Value<int>? id,
      Value<int>? level,
      Value<String>? title,
      Value<String?>? description,
      Value<Uint8List?>? image}) {
    return BlogsCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlogsCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _purchasableMeta =
      const VerificationMeta('purchasable');
  @override
  late final GeneratedColumn<int> purchasable = GeneratedColumn<int>(
      'purchasable', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, image, purchasable];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('purchasable')) {
      context.handle(
          _purchasableMeta,
          purchasable.isAcceptableOrUnknown(
              data['purchasable']!, _purchasableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      purchasable: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchasable'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final String? description;
  final String? image;
  final int purchasable;
  const Category(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      required this.purchasable});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['purchasable'] = Variable<int>(purchasable);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      purchasable: Value(purchasable),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      purchasable: serializer.fromJson<int>(json['purchasable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
      'purchasable': serializer.toJson<int>(purchasable),
    };
  }

  Category copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> image = const Value.absent(),
          int? purchasable}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
        purchasable: purchasable ?? this.purchasable,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      purchasable:
          data.purchasable.present ? data.purchasable.value : this.purchasable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('purchasable: $purchasable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, image, purchasable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.image == this.image &&
          other.purchasable == this.purchasable);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> image;
  final Value<int> purchasable;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.purchasable = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.purchasable = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? image,
    Expression<int>? purchasable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (purchasable != null) 'purchasable': purchasable,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? image,
      Value<int>? purchasable}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      purchasable: purchasable ?? this.purchasable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (purchasable.present) {
      map['purchasable'] = Variable<int>(purchasable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('purchasable: $purchasable')
          ..write(')'))
        .toString();
  }
}

class $CombinationsTable extends Combinations
    with TableInfo<$CombinationsTable, Combination> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CombinationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _blogIdMeta = const VerificationMeta('blogId');
  @override
  late final GeneratedColumn<int> blogId = GeneratedColumn<int>(
      'blog_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'REFERENCES blog(id) ON DELETE SET NULL ON UPDATE CASCADE');
  static const VerificationMeta _levelIdMeta =
      const VerificationMeta('levelId');
  @override
  late final GeneratedColumn<int> levelId = GeneratedColumn<int>(
      'level_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'REFERENCES levels(id) ON DELETE SET NULL ON UPDATE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [id, description, blogId, levelId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'combinations';
  @override
  VerificationContext validateIntegrity(Insertable<Combination> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('blog_id')) {
      context.handle(_blogIdMeta,
          blogId.isAcceptableOrUnknown(data['blog_id']!, _blogIdMeta));
    }
    if (data.containsKey('level_id')) {
      context.handle(_levelIdMeta,
          levelId.isAcceptableOrUnknown(data['level_id']!, _levelIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Combination map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Combination(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      blogId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}blog_id']),
      levelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level_id']),
    );
  }

  @override
  $CombinationsTable createAlias(String alias) {
    return $CombinationsTable(attachedDatabase, alias);
  }
}

class Combination extends DataClass implements Insertable<Combination> {
  final int id;
  final String? description;
  final int? blogId;
  final int? levelId;
  const Combination(
      {required this.id, this.description, this.blogId, this.levelId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || blogId != null) {
      map['blog_id'] = Variable<int>(blogId);
    }
    if (!nullToAbsent || levelId != null) {
      map['level_id'] = Variable<int>(levelId);
    }
    return map;
  }

  CombinationsCompanion toCompanion(bool nullToAbsent) {
    return CombinationsCompanion(
      id: Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      blogId:
          blogId == null && nullToAbsent ? const Value.absent() : Value(blogId),
      levelId: levelId == null && nullToAbsent
          ? const Value.absent()
          : Value(levelId),
    );
  }

  factory Combination.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Combination(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String?>(json['description']),
      blogId: serializer.fromJson<int?>(json['blogId']),
      levelId: serializer.fromJson<int?>(json['levelId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String?>(description),
      'blogId': serializer.toJson<int?>(blogId),
      'levelId': serializer.toJson<int?>(levelId),
    };
  }

  Combination copyWith(
          {int? id,
          Value<String?> description = const Value.absent(),
          Value<int?> blogId = const Value.absent(),
          Value<int?> levelId = const Value.absent()}) =>
      Combination(
        id: id ?? this.id,
        description: description.present ? description.value : this.description,
        blogId: blogId.present ? blogId.value : this.blogId,
        levelId: levelId.present ? levelId.value : this.levelId,
      );
  Combination copyWithCompanion(CombinationsCompanion data) {
    return Combination(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      blogId: data.blogId.present ? data.blogId.value : this.blogId,
      levelId: data.levelId.present ? data.levelId.value : this.levelId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Combination(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('blogId: $blogId, ')
          ..write('levelId: $levelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, blogId, levelId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Combination &&
          other.id == this.id &&
          other.description == this.description &&
          other.blogId == this.blogId &&
          other.levelId == this.levelId);
}

class CombinationsCompanion extends UpdateCompanion<Combination> {
  final Value<int> id;
  final Value<String?> description;
  final Value<int?> blogId;
  final Value<int?> levelId;
  const CombinationsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.blogId = const Value.absent(),
    this.levelId = const Value.absent(),
  });
  CombinationsCompanion.insert({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.blogId = const Value.absent(),
    this.levelId = const Value.absent(),
  });
  static Insertable<Combination> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<int>? blogId,
    Expression<int>? levelId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (blogId != null) 'blog_id': blogId,
      if (levelId != null) 'level_id': levelId,
    });
  }

  CombinationsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? description,
      Value<int?>? blogId,
      Value<int?>? levelId}) {
    return CombinationsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      blogId: blogId ?? this.blogId,
      levelId: levelId ?? this.levelId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (blogId.present) {
      map['blog_id'] = Variable<int>(blogId.value);
    }
    if (levelId.present) {
      map['level_id'] = Variable<int>(levelId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CombinationsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('blogId: $blogId, ')
          ..write('levelId: $levelId')
          ..write(')'))
        .toString();
  }
}

class $CombinationMaterialsTable extends CombinationMaterials
    with TableInfo<$CombinationMaterialsTable, CombinationMaterial> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CombinationMaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _combinationIdMeta =
      const VerificationMeta('combinationId');
  @override
  late final GeneratedColumn<int> combinationId = GeneratedColumn<int>(
      'combination_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES combinations(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _materialIdMeta =
      const VerificationMeta('materialId');
  @override
  late final GeneratedColumn<int> materialId = GeneratedColumn<int>(
      'material_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<bool> product = GeneratedColumn<bool>(
      'product', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("product" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [combinationId, materialId, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'combination_materials';
  @override
  VerificationContext validateIntegrity(
      Insertable<CombinationMaterial> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('combination_id')) {
      context.handle(
          _combinationIdMeta,
          combinationId.isAcceptableOrUnknown(
              data['combination_id']!, _combinationIdMeta));
    } else if (isInserting) {
      context.missing(_combinationIdMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
          _materialIdMeta,
          materialId.isAcceptableOrUnknown(
              data['material_id']!, _materialIdMeta));
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {combinationId, materialId};
  @override
  CombinationMaterial map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CombinationMaterial(
      combinationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}combination_id'])!,
      materialId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}material_id'])!,
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}product'])!,
    );
  }

  @override
  $CombinationMaterialsTable createAlias(String alias) {
    return $CombinationMaterialsTable(attachedDatabase, alias);
  }
}

class CombinationMaterial extends DataClass
    implements Insertable<CombinationMaterial> {
  final int combinationId;
  final int materialId;
  final bool product;
  const CombinationMaterial(
      {required this.combinationId,
      required this.materialId,
      required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['combination_id'] = Variable<int>(combinationId);
    map['material_id'] = Variable<int>(materialId);
    map['product'] = Variable<bool>(product);
    return map;
  }

  CombinationMaterialsCompanion toCompanion(bool nullToAbsent) {
    return CombinationMaterialsCompanion(
      combinationId: Value(combinationId),
      materialId: Value(materialId),
      product: Value(product),
    );
  }

  factory CombinationMaterial.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CombinationMaterial(
      combinationId: serializer.fromJson<int>(json['combinationId']),
      materialId: serializer.fromJson<int>(json['materialId']),
      product: serializer.fromJson<bool>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'combinationId': serializer.toJson<int>(combinationId),
      'materialId': serializer.toJson<int>(materialId),
      'product': serializer.toJson<bool>(product),
    };
  }

  CombinationMaterial copyWith(
          {int? combinationId, int? materialId, bool? product}) =>
      CombinationMaterial(
        combinationId: combinationId ?? this.combinationId,
        materialId: materialId ?? this.materialId,
        product: product ?? this.product,
      );
  CombinationMaterial copyWithCompanion(CombinationMaterialsCompanion data) {
    return CombinationMaterial(
      combinationId: data.combinationId.present
          ? data.combinationId.value
          : this.combinationId,
      materialId:
          data.materialId.present ? data.materialId.value : this.materialId,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CombinationMaterial(')
          ..write('combinationId: $combinationId, ')
          ..write('materialId: $materialId, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(combinationId, materialId, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CombinationMaterial &&
          other.combinationId == this.combinationId &&
          other.materialId == this.materialId &&
          other.product == this.product);
}

class CombinationMaterialsCompanion
    extends UpdateCompanion<CombinationMaterial> {
  final Value<int> combinationId;
  final Value<int> materialId;
  final Value<bool> product;
  final Value<int> rowid;
  const CombinationMaterialsCompanion({
    this.combinationId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.product = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CombinationMaterialsCompanion.insert({
    required int combinationId,
    required int materialId,
    this.product = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : combinationId = Value(combinationId),
        materialId = Value(materialId);
  static Insertable<CombinationMaterial> custom({
    Expression<int>? combinationId,
    Expression<int>? materialId,
    Expression<bool>? product,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (combinationId != null) 'combination_id': combinationId,
      if (materialId != null) 'material_id': materialId,
      if (product != null) 'product': product,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CombinationMaterialsCompanion copyWith(
      {Value<int>? combinationId,
      Value<int>? materialId,
      Value<bool>? product,
      Value<int>? rowid}) {
    return CombinationMaterialsCompanion(
      combinationId: combinationId ?? this.combinationId,
      materialId: materialId ?? this.materialId,
      product: product ?? this.product,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (combinationId.present) {
      map['combination_id'] = Variable<int>(combinationId.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<int>(materialId.value);
    }
    if (product.present) {
      map['product'] = Variable<bool>(product.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CombinationMaterialsCompanion(')
          ..write('combinationId: $combinationId, ')
          ..write('materialId: $materialId, ')
          ..write('product: $product, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FunFactsTable extends FunFacts with TableInfo<$FunFactsTable, FunFact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FunFactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _factMeta = const VerificationMeta('fact');
  @override
  late final GeneratedColumn<String> fact = GeneratedColumn<String>(
      'fact', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, fact, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fun_facts';
  @override
  VerificationContext validateIntegrity(Insertable<FunFact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fact')) {
      context.handle(
          _factMeta, fact.isAcceptableOrUnknown(data['fact']!, _factMeta));
    } else if (isInserting) {
      context.missing(_factMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FunFact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FunFact(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fact'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $FunFactsTable createAlias(String alias) {
    return $FunFactsTable(attachedDatabase, alias);
  }
}

class FunFact extends DataClass implements Insertable<FunFact> {
  final int id;
  final String fact;
  final String title;
  const FunFact({required this.id, required this.fact, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fact'] = Variable<String>(fact);
    map['title'] = Variable<String>(title);
    return map;
  }

  FunFactsCompanion toCompanion(bool nullToAbsent) {
    return FunFactsCompanion(
      id: Value(id),
      fact: Value(fact),
      title: Value(title),
    );
  }

  factory FunFact.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FunFact(
      id: serializer.fromJson<int>(json['id']),
      fact: serializer.fromJson<String>(json['fact']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fact': serializer.toJson<String>(fact),
      'title': serializer.toJson<String>(title),
    };
  }

  FunFact copyWith({int? id, String? fact, String? title}) => FunFact(
        id: id ?? this.id,
        fact: fact ?? this.fact,
        title: title ?? this.title,
      );
  FunFact copyWithCompanion(FunFactsCompanion data) {
    return FunFact(
      id: data.id.present ? data.id.value : this.id,
      fact: data.fact.present ? data.fact.value : this.fact,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FunFact(')
          ..write('id: $id, ')
          ..write('fact: $fact, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fact, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FunFact &&
          other.id == this.id &&
          other.fact == this.fact &&
          other.title == this.title);
}

class FunFactsCompanion extends UpdateCompanion<FunFact> {
  final Value<int> id;
  final Value<String> fact;
  final Value<String> title;
  const FunFactsCompanion({
    this.id = const Value.absent(),
    this.fact = const Value.absent(),
    this.title = const Value.absent(),
  });
  FunFactsCompanion.insert({
    this.id = const Value.absent(),
    required String fact,
    required String title,
  })  : fact = Value(fact),
        title = Value(title);
  static Insertable<FunFact> custom({
    Expression<int>? id,
    Expression<String>? fact,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fact != null) 'fact': fact,
      if (title != null) 'title': title,
    });
  }

  FunFactsCompanion copyWith(
      {Value<int>? id, Value<String>? fact, Value<String>? title}) {
    return FunFactsCompanion(
      id: id ?? this.id,
      fact: fact ?? this.fact,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fact.present) {
      map['fact'] = Variable<String>(fact.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FunFactsCompanion(')
          ..write('id: $id, ')
          ..write('fact: $fact, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $LevelMaterialsTable extends LevelMaterials
    with TableInfo<$LevelMaterialsTable, LevelMaterial> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelMaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _levelIdMeta =
      const VerificationMeta('levelId');
  @override
  late final GeneratedColumn<int> levelId = GeneratedColumn<int>(
      'level_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES levels(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _materialIdMeta =
      const VerificationMeta('materialId');
  @override
  late final GeneratedColumn<int> materialId = GeneratedColumn<int>(
      'material_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [levelId, materialId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'level_materials';
  @override
  VerificationContext validateIntegrity(Insertable<LevelMaterial> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('level_id')) {
      context.handle(_levelIdMeta,
          levelId.isAcceptableOrUnknown(data['level_id']!, _levelIdMeta));
    } else if (isInserting) {
      context.missing(_levelIdMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
          _materialIdMeta,
          materialId.isAcceptableOrUnknown(
              data['material_id']!, _materialIdMeta));
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {levelId, materialId};
  @override
  LevelMaterial map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LevelMaterial(
      levelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level_id'])!,
      materialId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}material_id'])!,
    );
  }

  @override
  $LevelMaterialsTable createAlias(String alias) {
    return $LevelMaterialsTable(attachedDatabase, alias);
  }
}

class LevelMaterial extends DataClass implements Insertable<LevelMaterial> {
  final int levelId;
  final int materialId;
  const LevelMaterial({required this.levelId, required this.materialId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['level_id'] = Variable<int>(levelId);
    map['material_id'] = Variable<int>(materialId);
    return map;
  }

  LevelMaterialsCompanion toCompanion(bool nullToAbsent) {
    return LevelMaterialsCompanion(
      levelId: Value(levelId),
      materialId: Value(materialId),
    );
  }

  factory LevelMaterial.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LevelMaterial(
      levelId: serializer.fromJson<int>(json['levelId']),
      materialId: serializer.fromJson<int>(json['materialId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'levelId': serializer.toJson<int>(levelId),
      'materialId': serializer.toJson<int>(materialId),
    };
  }

  LevelMaterial copyWith({int? levelId, int? materialId}) => LevelMaterial(
        levelId: levelId ?? this.levelId,
        materialId: materialId ?? this.materialId,
      );
  LevelMaterial copyWithCompanion(LevelMaterialsCompanion data) {
    return LevelMaterial(
      levelId: data.levelId.present ? data.levelId.value : this.levelId,
      materialId:
          data.materialId.present ? data.materialId.value : this.materialId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LevelMaterial(')
          ..write('levelId: $levelId, ')
          ..write('materialId: $materialId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(levelId, materialId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LevelMaterial &&
          other.levelId == this.levelId &&
          other.materialId == this.materialId);
}

class LevelMaterialsCompanion extends UpdateCompanion<LevelMaterial> {
  final Value<int> levelId;
  final Value<int> materialId;
  final Value<int> rowid;
  const LevelMaterialsCompanion({
    this.levelId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LevelMaterialsCompanion.insert({
    required int levelId,
    required int materialId,
    this.rowid = const Value.absent(),
  })  : levelId = Value(levelId),
        materialId = Value(materialId);
  static Insertable<LevelMaterial> custom({
    Expression<int>? levelId,
    Expression<int>? materialId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (levelId != null) 'level_id': levelId,
      if (materialId != null) 'material_id': materialId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LevelMaterialsCompanion copyWith(
      {Value<int>? levelId, Value<int>? materialId, Value<int>? rowid}) {
    return LevelMaterialsCompanion(
      levelId: levelId ?? this.levelId,
      materialId: materialId ?? this.materialId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (levelId.present) {
      map['level_id'] = Variable<int>(levelId.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<int>(materialId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelMaterialsCompanion(')
          ..write('levelId: $levelId, ')
          ..write('materialId: $materialId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MaterialCategoriesTable extends MaterialCategories
    with TableInfo<$MaterialCategoriesTable, MaterialCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _materialIdMeta =
      const VerificationMeta('materialId');
  @override
  late final GeneratedColumn<int> materialId = GeneratedColumn<int>(
      'material_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [materialId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_categories';
  @override
  VerificationContext validateIntegrity(Insertable<MaterialCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('material_id')) {
      context.handle(
          _materialIdMeta,
          materialId.isAcceptableOrUnknown(
              data['material_id']!, _materialIdMeta));
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {materialId, categoryId};
  @override
  MaterialCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialCategory(
      materialId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}material_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $MaterialCategoriesTable createAlias(String alias) {
    return $MaterialCategoriesTable(attachedDatabase, alias);
  }
}

class MaterialCategory extends DataClass
    implements Insertable<MaterialCategory> {
  final int materialId;
  final int categoryId;
  const MaterialCategory({required this.materialId, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['material_id'] = Variable<int>(materialId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  MaterialCategoriesCompanion toCompanion(bool nullToAbsent) {
    return MaterialCategoriesCompanion(
      materialId: Value(materialId),
      categoryId: Value(categoryId),
    );
  }

  factory MaterialCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialCategory(
      materialId: serializer.fromJson<int>(json['materialId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'materialId': serializer.toJson<int>(materialId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  MaterialCategory copyWith({int? materialId, int? categoryId}) =>
      MaterialCategory(
        materialId: materialId ?? this.materialId,
        categoryId: categoryId ?? this.categoryId,
      );
  MaterialCategory copyWithCompanion(MaterialCategoriesCompanion data) {
    return MaterialCategory(
      materialId:
          data.materialId.present ? data.materialId.value : this.materialId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialCategory(')
          ..write('materialId: $materialId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(materialId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialCategory &&
          other.materialId == this.materialId &&
          other.categoryId == this.categoryId);
}

class MaterialCategoriesCompanion extends UpdateCompanion<MaterialCategory> {
  final Value<int> materialId;
  final Value<int> categoryId;
  final Value<int> rowid;
  const MaterialCategoriesCompanion({
    this.materialId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaterialCategoriesCompanion.insert({
    required int materialId,
    required int categoryId,
    this.rowid = const Value.absent(),
  })  : materialId = Value(materialId),
        categoryId = Value(categoryId);
  static Insertable<MaterialCategory> custom({
    Expression<int>? materialId,
    Expression<int>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (materialId != null) 'material_id': materialId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaterialCategoriesCompanion copyWith(
      {Value<int>? materialId, Value<int>? categoryId, Value<int>? rowid}) {
    return MaterialCategoriesCompanion(
      materialId: materialId ?? this.materialId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (materialId.present) {
      map['material_id'] = Variable<int>(materialId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialCategoriesCompanion(')
          ..write('materialId: $materialId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestMaterialsTable extends QuestMaterials
    with TableInfo<$QuestMaterialsTable, QuestMaterial> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestMaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _questIdMeta =
      const VerificationMeta('questId');
  @override
  late final GeneratedColumn<int> questId = GeneratedColumn<int>(
      'quest_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES quests(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _materialIdMeta =
      const VerificationMeta('materialId');
  @override
  late final GeneratedColumn<int> materialId = GeneratedColumn<int>(
      'material_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _successMeta =
      const VerificationMeta('success');
  @override
  late final GeneratedColumn<int> success = GeneratedColumn<int>(
      'success', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(1));
  @override
  List<GeneratedColumn> get $columns => [questId, materialId, success];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quest_materials';
  @override
  VerificationContext validateIntegrity(Insertable<QuestMaterial> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('quest_id')) {
      context.handle(_questIdMeta,
          questId.isAcceptableOrUnknown(data['quest_id']!, _questIdMeta));
    } else if (isInserting) {
      context.missing(_questIdMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
          _materialIdMeta,
          materialId.isAcceptableOrUnknown(
              data['material_id']!, _materialIdMeta));
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    if (data.containsKey('success')) {
      context.handle(_successMeta,
          success.isAcceptableOrUnknown(data['success']!, _successMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {questId, materialId};
  @override
  QuestMaterial map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestMaterial(
      questId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quest_id'])!,
      materialId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}material_id'])!,
      success: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}success'])!,
    );
  }

  @override
  $QuestMaterialsTable createAlias(String alias) {
    return $QuestMaterialsTable(attachedDatabase, alias);
  }
}

class QuestMaterial extends DataClass implements Insertable<QuestMaterial> {
  final int questId;
  final int materialId;
  final int success;
  const QuestMaterial(
      {required this.questId, required this.materialId, required this.success});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['quest_id'] = Variable<int>(questId);
    map['material_id'] = Variable<int>(materialId);
    map['success'] = Variable<int>(success);
    return map;
  }

  QuestMaterialsCompanion toCompanion(bool nullToAbsent) {
    return QuestMaterialsCompanion(
      questId: Value(questId),
      materialId: Value(materialId),
      success: Value(success),
    );
  }

  factory QuestMaterial.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestMaterial(
      questId: serializer.fromJson<int>(json['questId']),
      materialId: serializer.fromJson<int>(json['materialId']),
      success: serializer.fromJson<int>(json['success']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'questId': serializer.toJson<int>(questId),
      'materialId': serializer.toJson<int>(materialId),
      'success': serializer.toJson<int>(success),
    };
  }

  QuestMaterial copyWith({int? questId, int? materialId, int? success}) =>
      QuestMaterial(
        questId: questId ?? this.questId,
        materialId: materialId ?? this.materialId,
        success: success ?? this.success,
      );
  QuestMaterial copyWithCompanion(QuestMaterialsCompanion data) {
    return QuestMaterial(
      questId: data.questId.present ? data.questId.value : this.questId,
      materialId:
          data.materialId.present ? data.materialId.value : this.materialId,
      success: data.success.present ? data.success.value : this.success,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestMaterial(')
          ..write('questId: $questId, ')
          ..write('materialId: $materialId, ')
          ..write('success: $success')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(questId, materialId, success);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestMaterial &&
          other.questId == this.questId &&
          other.materialId == this.materialId &&
          other.success == this.success);
}

class QuestMaterialsCompanion extends UpdateCompanion<QuestMaterial> {
  final Value<int> questId;
  final Value<int> materialId;
  final Value<int> success;
  final Value<int> rowid;
  const QuestMaterialsCompanion({
    this.questId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.success = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestMaterialsCompanion.insert({
    required int questId,
    required int materialId,
    this.success = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : questId = Value(questId),
        materialId = Value(materialId);
  static Insertable<QuestMaterial> custom({
    Expression<int>? questId,
    Expression<int>? materialId,
    Expression<int>? success,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (questId != null) 'quest_id': questId,
      if (materialId != null) 'material_id': materialId,
      if (success != null) 'success': success,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestMaterialsCompanion copyWith(
      {Value<int>? questId,
      Value<int>? materialId,
      Value<int>? success,
      Value<int>? rowid}) {
    return QuestMaterialsCompanion(
      questId: questId ?? this.questId,
      materialId: materialId ?? this.materialId,
      success: success ?? this.success,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (questId.present) {
      map['quest_id'] = Variable<int>(questId.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<int>(materialId.value);
    }
    if (success.present) {
      map['success'] = Variable<int>(success.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestMaterialsCompanion(')
          ..write('questId: $questId, ')
          ..write('materialId: $materialId, ')
          ..write('success: $success, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestQuestsTable extends QuestQuests
    with TableInfo<$QuestQuestsTable, QuestQuest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestQuestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _questActiveMeta =
      const VerificationMeta('questActive');
  @override
  late final GeneratedColumn<int> questActive = GeneratedColumn<int>(
      'quest_active', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES quests(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _questRequiredMeta =
      const VerificationMeta('questRequired');
  @override
  late final GeneratedColumn<int> questRequired = GeneratedColumn<int>(
      'quest_required', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES quests(id) ON DELETE CASCADE ON UPDATE CASCADE');
  static const VerificationMeta _succeededMeta =
      const VerificationMeta('succeeded');
  @override
  late final GeneratedColumn<int> succeeded = GeneratedColumn<int>(
      'succeeded', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(1));
  @override
  List<GeneratedColumn> get $columns => [questActive, questRequired, succeeded];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quest_quests';
  @override
  VerificationContext validateIntegrity(Insertable<QuestQuest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('quest_active')) {
      context.handle(
          _questActiveMeta,
          questActive.isAcceptableOrUnknown(
              data['quest_active']!, _questActiveMeta));
    } else if (isInserting) {
      context.missing(_questActiveMeta);
    }
    if (data.containsKey('quest_required')) {
      context.handle(
          _questRequiredMeta,
          questRequired.isAcceptableOrUnknown(
              data['quest_required']!, _questRequiredMeta));
    } else if (isInserting) {
      context.missing(_questRequiredMeta);
    }
    if (data.containsKey('succeeded')) {
      context.handle(_succeededMeta,
          succeeded.isAcceptableOrUnknown(data['succeeded']!, _succeededMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {questActive, questRequired};
  @override
  QuestQuest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestQuest(
      questActive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quest_active'])!,
      questRequired: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quest_required'])!,
      succeeded: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}succeeded'])!,
    );
  }

  @override
  $QuestQuestsTable createAlias(String alias) {
    return $QuestQuestsTable(attachedDatabase, alias);
  }
}

class QuestQuest extends DataClass implements Insertable<QuestQuest> {
  final int questActive;
  final int questRequired;
  final int succeeded;
  const QuestQuest(
      {required this.questActive,
      required this.questRequired,
      required this.succeeded});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['quest_active'] = Variable<int>(questActive);
    map['quest_required'] = Variable<int>(questRequired);
    map['succeeded'] = Variable<int>(succeeded);
    return map;
  }

  QuestQuestsCompanion toCompanion(bool nullToAbsent) {
    return QuestQuestsCompanion(
      questActive: Value(questActive),
      questRequired: Value(questRequired),
      succeeded: Value(succeeded),
    );
  }

  factory QuestQuest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestQuest(
      questActive: serializer.fromJson<int>(json['questActive']),
      questRequired: serializer.fromJson<int>(json['questRequired']),
      succeeded: serializer.fromJson<int>(json['succeeded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'questActive': serializer.toJson<int>(questActive),
      'questRequired': serializer.toJson<int>(questRequired),
      'succeeded': serializer.toJson<int>(succeeded),
    };
  }

  QuestQuest copyWith({int? questActive, int? questRequired, int? succeeded}) =>
      QuestQuest(
        questActive: questActive ?? this.questActive,
        questRequired: questRequired ?? this.questRequired,
        succeeded: succeeded ?? this.succeeded,
      );
  QuestQuest copyWithCompanion(QuestQuestsCompanion data) {
    return QuestQuest(
      questActive:
          data.questActive.present ? data.questActive.value : this.questActive,
      questRequired: data.questRequired.present
          ? data.questRequired.value
          : this.questRequired,
      succeeded: data.succeeded.present ? data.succeeded.value : this.succeeded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestQuest(')
          ..write('questActive: $questActive, ')
          ..write('questRequired: $questRequired, ')
          ..write('succeeded: $succeeded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(questActive, questRequired, succeeded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestQuest &&
          other.questActive == this.questActive &&
          other.questRequired == this.questRequired &&
          other.succeeded == this.succeeded);
}

class QuestQuestsCompanion extends UpdateCompanion<QuestQuest> {
  final Value<int> questActive;
  final Value<int> questRequired;
  final Value<int> succeeded;
  final Value<int> rowid;
  const QuestQuestsCompanion({
    this.questActive = const Value.absent(),
    this.questRequired = const Value.absent(),
    this.succeeded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestQuestsCompanion.insert({
    required int questActive,
    required int questRequired,
    this.succeeded = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : questActive = Value(questActive),
        questRequired = Value(questRequired);
  static Insertable<QuestQuest> custom({
    Expression<int>? questActive,
    Expression<int>? questRequired,
    Expression<int>? succeeded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (questActive != null) 'quest_active': questActive,
      if (questRequired != null) 'quest_required': questRequired,
      if (succeeded != null) 'succeeded': succeeded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestQuestsCompanion copyWith(
      {Value<int>? questActive,
      Value<int>? questRequired,
      Value<int>? succeeded,
      Value<int>? rowid}) {
    return QuestQuestsCompanion(
      questActive: questActive ?? this.questActive,
      questRequired: questRequired ?? this.questRequired,
      succeeded: succeeded ?? this.succeeded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (questActive.present) {
      map['quest_active'] = Variable<int>(questActive.value);
    }
    if (questRequired.present) {
      map['quest_required'] = Variable<int>(questRequired.value);
    }
    if (succeeded.present) {
      map['succeeded'] = Variable<int>(succeeded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestQuestsCompanion(')
          ..write('questActive: $questActive, ')
          ..write('questRequired: $questRequired, ')
          ..write('succeeded: $succeeded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$SharedAppDatabase extends GeneratedDatabase {
  _$SharedAppDatabase(QueryExecutor e) : super(e);
  $SharedAppDatabaseManager get managers => $SharedAppDatabaseManager(this);
  late final $CreditsTable credits = $CreditsTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $MaterialsTable materials = $MaterialsTable(this);
  late final $QuestsTable quests = $QuestsTable(this);
  late final $LevelsTable levels = $LevelsTable(this);
  late final $BlogsTable blogs = $BlogsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $CombinationsTable combinations = $CombinationsTable(this);
  late final $CombinationMaterialsTable combinationMaterials =
      $CombinationMaterialsTable(this);
  late final $FunFactsTable funFacts = $FunFactsTable(this);
  late final $LevelMaterialsTable levelMaterials = $LevelMaterialsTable(this);
  late final $MaterialCategoriesTable materialCategories =
      $MaterialCategoriesTable(this);
  late final $QuestMaterialsTable questMaterials = $QuestMaterialsTable(this);
  late final $QuestQuestsTable questQuests = $QuestQuestsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        credits,
        characters,
        materials,
        quests,
        levels,
        blogs,
        categories,
        combinations,
        combinationMaterials,
        funFacts,
        levelMaterials,
        materialCategories,
        questMaterials,
        questQuests
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('characters',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quests', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('characters',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('quests', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quests', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('quests', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('levels', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('levels', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('levels',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('blogs', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('levels',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('combinations', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('levels',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('combinations', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('combinations',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('combination_materials', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('combinations',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('combination_materials', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('combination_materials', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('combination_materials', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('levels',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('level_materials', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('levels',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('level_materials', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('level_materials', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('level_materials', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('material_categories', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('material_categories', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('categories',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('material_categories', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('categories',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('material_categories', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quest_materials', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('quest_materials', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quest_materials', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('materials',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('quest_materials', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quest_quests', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('quest_quests', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quest_quests', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('quest_quests', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}

typedef $$CreditsTableCreateCompanionBuilder = CreditsCompanion Function({
  Value<int> id,
  required int number,
  required String credit,
});
typedef $$CreditsTableUpdateCompanionBuilder = CreditsCompanion Function({
  Value<int> id,
  Value<int> number,
  Value<String> credit,
});

class $$CreditsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $CreditsTable> {
  $$CreditsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get credit => $composableBuilder(
      column: $table.credit, builder: (column) => ColumnFilters(column));
}

class $$CreditsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $CreditsTable> {
  $$CreditsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get credit => $composableBuilder(
      column: $table.credit, builder: (column) => ColumnOrderings(column));
}

class $$CreditsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $CreditsTable> {
  $$CreditsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get credit =>
      $composableBuilder(column: $table.credit, builder: (column) => column);
}

class $$CreditsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $CreditsTable,
    Credit,
    $$CreditsTableFilterComposer,
    $$CreditsTableOrderingComposer,
    $$CreditsTableAnnotationComposer,
    $$CreditsTableCreateCompanionBuilder,
    $$CreditsTableUpdateCompanionBuilder,
    (Credit, BaseReferences<_$SharedAppDatabase, $CreditsTable, Credit>),
    Credit,
    PrefetchHooks Function()> {
  $$CreditsTableTableManager(_$SharedAppDatabase db, $CreditsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> number = const Value.absent(),
            Value<String> credit = const Value.absent(),
          }) =>
              CreditsCompanion(
            id: id,
            number: number,
            credit: credit,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int number,
            required String credit,
          }) =>
              CreditsCompanion.insert(
            id: id,
            number: number,
            credit: credit,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CreditsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $CreditsTable,
    Credit,
    $$CreditsTableFilterComposer,
    $$CreditsTableOrderingComposer,
    $$CreditsTableAnnotationComposer,
    $$CreditsTableCreateCompanionBuilder,
    $$CreditsTableUpdateCompanionBuilder,
    (Credit, BaseReferences<_$SharedAppDatabase, $CreditsTable, Credit>),
    Credit,
    PrefetchHooks Function()>;
typedef $$CharactersTableCreateCompanionBuilder = CharactersCompanion Function({
  Value<int> id,
  required String name,
  Value<Uint8List?> image,
  Value<String?> description,
});
typedef $$CharactersTableUpdateCompanionBuilder = CharactersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<Uint8List?> image,
  Value<String?> description,
});

final class $$CharactersTableReferences
    extends BaseReferences<_$SharedAppDatabase, $CharactersTable, Character> {
  $$CharactersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuestsTable, List<Quest>> _questsRefsTable(
          _$SharedAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.quests,
          aliasName: $_aliasNameGenerator(
              db.characters.id, db.quests.characterIssuer));

  $$QuestsTableProcessedTableManager get questsRefs {
    final manager = $$QuestsTableTableManager($_db, $_db.quests)
        .filter((f) => f.characterIssuer.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_questsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CharactersTableFilterComposer
    extends Composer<_$SharedAppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  Expression<bool> questsRefs(
      Expression<bool> Function($$QuestsTableFilterComposer f) f) {
    final $$QuestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.characterIssuer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableFilterComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CharactersTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<Uint8List> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  Expression<T> questsRefs<T extends Object>(
      Expression<T> Function($$QuestsTableAnnotationComposer a) f) {
    final $$QuestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.characterIssuer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableAnnotationComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CharactersTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $CharactersTable,
    Character,
    $$CharactersTableFilterComposer,
    $$CharactersTableOrderingComposer,
    $$CharactersTableAnnotationComposer,
    $$CharactersTableCreateCompanionBuilder,
    $$CharactersTableUpdateCompanionBuilder,
    (Character, $$CharactersTableReferences),
    Character,
    PrefetchHooks Function({bool questsRefs})> {
  $$CharactersTableTableManager(_$SharedAppDatabase db, $CharactersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              CharactersCompanion(
            id: id,
            name: name,
            image: image,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<Uint8List?> image = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              CharactersCompanion.insert(
            id: id,
            name: name,
            image: image,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CharactersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({questsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (questsRefs) db.quests],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (questsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CharactersTableReferences._questsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CharactersTableReferences(db, table, p0)
                                .questsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.characterIssuer == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CharactersTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $CharactersTable,
    Character,
    $$CharactersTableFilterComposer,
    $$CharactersTableOrderingComposer,
    $$CharactersTableAnnotationComposer,
    $$CharactersTableCreateCompanionBuilder,
    $$CharactersTableUpdateCompanionBuilder,
    (Character, $$CharactersTableReferences),
    Character,
    PrefetchHooks Function({bool questsRefs})>;
typedef $$MaterialsTableCreateCompanionBuilder = MaterialsCompanion Function({
  Value<int> id,
  required String commonName,
  Value<String?> iupacName,
  Value<String?> image,
  Value<String?> description,
  Value<double?> price,
  Value<double> experience,
  Value<int?> level,
  Value<bool> temporary,
});
typedef $$MaterialsTableUpdateCompanionBuilder = MaterialsCompanion Function({
  Value<int> id,
  Value<String> commonName,
  Value<String?> iupacName,
  Value<String?> image,
  Value<String?> description,
  Value<double?> price,
  Value<double> experience,
  Value<int?> level,
  Value<bool> temporary,
});

final class $$MaterialsTableReferences
    extends BaseReferences<_$SharedAppDatabase, $MaterialsTable, Material> {
  $$MaterialsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuestsTable, List<Quest>> _questsRefsTable(
          _$SharedAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.quests,
          aliasName: $_aliasNameGenerator(
              db.materials.id, db.quests.objectiveMaterial));

  $$QuestsTableProcessedTableManager get questsRefs {
    final manager = $$QuestsTableTableManager($_db, $_db.quests)
        .filter((f) => f.objectiveMaterial.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_questsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CombinationMaterialsTable,
      List<CombinationMaterial>> _combinationMaterialsRefsTable(
          _$SharedAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.combinationMaterials,
          aliasName: $_aliasNameGenerator(
              db.materials.id, db.combinationMaterials.materialId));

  $$CombinationMaterialsTableProcessedTableManager
      get combinationMaterialsRefs {
    final manager =
        $$CombinationMaterialsTableTableManager($_db, $_db.combinationMaterials)
            .filter((f) => f.materialId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_combinationMaterialsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LevelMaterialsTable, List<LevelMaterial>>
      _levelMaterialsRefsTable(_$SharedAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.levelMaterials,
              aliasName: $_aliasNameGenerator(
                  db.materials.id, db.levelMaterials.materialId));

  $$LevelMaterialsTableProcessedTableManager get levelMaterialsRefs {
    final manager = $$LevelMaterialsTableTableManager($_db, $_db.levelMaterials)
        .filter((f) => f.materialId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_levelMaterialsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MaterialCategoriesTable, List<MaterialCategory>>
      _materialCategoriesRefsTable(_$SharedAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.materialCategories,
              aliasName: $_aliasNameGenerator(
                  db.materials.id, db.materialCategories.materialId));

  $$MaterialCategoriesTableProcessedTableManager get materialCategoriesRefs {
    final manager =
        $$MaterialCategoriesTableTableManager($_db, $_db.materialCategories)
            .filter((f) => f.materialId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_materialCategoriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$QuestMaterialsTable, List<QuestMaterial>>
      _questMaterialsRefsTable(_$SharedAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.questMaterials,
              aliasName: $_aliasNameGenerator(
                  db.materials.id, db.questMaterials.materialId));

  $$QuestMaterialsTableProcessedTableManager get questMaterialsRefs {
    final manager = $$QuestMaterialsTableTableManager($_db, $_db.questMaterials)
        .filter((f) => f.materialId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_questMaterialsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MaterialsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $MaterialsTable> {
  $$MaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get commonName => $composableBuilder(
      column: $table.commonName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iupacName => $composableBuilder(
      column: $table.iupacName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get experience => $composableBuilder(
      column: $table.experience, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get temporary => $composableBuilder(
      column: $table.temporary, builder: (column) => ColumnFilters(column));

  Expression<bool> questsRefs(
      Expression<bool> Function($$QuestsTableFilterComposer f) f) {
    final $$QuestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.objectiveMaterial,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableFilterComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> combinationMaterialsRefs(
      Expression<bool> Function($$CombinationMaterialsTableFilterComposer f)
          f) {
    final $$CombinationMaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.combinationMaterials,
        getReferencedColumn: (t) => t.materialId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CombinationMaterialsTableFilterComposer(
              $db: $db,
              $table: $db.combinationMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> levelMaterialsRefs(
      Expression<bool> Function($$LevelMaterialsTableFilterComposer f) f) {
    final $$LevelMaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.levelMaterials,
        getReferencedColumn: (t) => t.materialId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelMaterialsTableFilterComposer(
              $db: $db,
              $table: $db.levelMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> materialCategoriesRefs(
      Expression<bool> Function($$MaterialCategoriesTableFilterComposer f) f) {
    final $$MaterialCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.materialCategories,
        getReferencedColumn: (t) => t.materialId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.materialCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> questMaterialsRefs(
      Expression<bool> Function($$QuestMaterialsTableFilterComposer f) f) {
    final $$QuestMaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questMaterials,
        getReferencedColumn: (t) => t.materialId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestMaterialsTableFilterComposer(
              $db: $db,
              $table: $db.questMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MaterialsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $MaterialsTable> {
  $$MaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get commonName => $composableBuilder(
      column: $table.commonName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iupacName => $composableBuilder(
      column: $table.iupacName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get experience => $composableBuilder(
      column: $table.experience, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get temporary => $composableBuilder(
      column: $table.temporary, builder: (column) => ColumnOrderings(column));
}

class $$MaterialsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $MaterialsTable> {
  $$MaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get commonName => $composableBuilder(
      column: $table.commonName, builder: (column) => column);

  GeneratedColumn<String> get iupacName =>
      $composableBuilder(column: $table.iupacName, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get experience => $composableBuilder(
      column: $table.experience, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<bool> get temporary =>
      $composableBuilder(column: $table.temporary, builder: (column) => column);

  Expression<T> questsRefs<T extends Object>(
      Expression<T> Function($$QuestsTableAnnotationComposer a) f) {
    final $$QuestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.objectiveMaterial,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableAnnotationComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> combinationMaterialsRefs<T extends Object>(
      Expression<T> Function($$CombinationMaterialsTableAnnotationComposer a)
          f) {
    final $$CombinationMaterialsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.combinationMaterials,
            getReferencedColumn: (t) => t.materialId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CombinationMaterialsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.combinationMaterials,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> levelMaterialsRefs<T extends Object>(
      Expression<T> Function($$LevelMaterialsTableAnnotationComposer a) f) {
    final $$LevelMaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.levelMaterials,
        getReferencedColumn: (t) => t.materialId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelMaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.levelMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> materialCategoriesRefs<T extends Object>(
      Expression<T> Function($$MaterialCategoriesTableAnnotationComposer a) f) {
    final $$MaterialCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.materialCategories,
            getReferencedColumn: (t) => t.materialId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MaterialCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.materialCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> questMaterialsRefs<T extends Object>(
      Expression<T> Function($$QuestMaterialsTableAnnotationComposer a) f) {
    final $$QuestMaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questMaterials,
        getReferencedColumn: (t) => t.materialId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestMaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.questMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MaterialsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $MaterialsTable,
    Material,
    $$MaterialsTableFilterComposer,
    $$MaterialsTableOrderingComposer,
    $$MaterialsTableAnnotationComposer,
    $$MaterialsTableCreateCompanionBuilder,
    $$MaterialsTableUpdateCompanionBuilder,
    (Material, $$MaterialsTableReferences),
    Material,
    PrefetchHooks Function(
        {bool questsRefs,
        bool combinationMaterialsRefs,
        bool levelMaterialsRefs,
        bool materialCategoriesRefs,
        bool questMaterialsRefs})> {
  $$MaterialsTableTableManager(_$SharedAppDatabase db, $MaterialsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaterialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaterialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> commonName = const Value.absent(),
            Value<String?> iupacName = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<double> experience = const Value.absent(),
            Value<int?> level = const Value.absent(),
            Value<bool> temporary = const Value.absent(),
          }) =>
              MaterialsCompanion(
            id: id,
            commonName: commonName,
            iupacName: iupacName,
            image: image,
            description: description,
            price: price,
            experience: experience,
            level: level,
            temporary: temporary,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String commonName,
            Value<String?> iupacName = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<double> experience = const Value.absent(),
            Value<int?> level = const Value.absent(),
            Value<bool> temporary = const Value.absent(),
          }) =>
              MaterialsCompanion.insert(
            id: id,
            commonName: commonName,
            iupacName: iupacName,
            image: image,
            description: description,
            price: price,
            experience: experience,
            level: level,
            temporary: temporary,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MaterialsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {questsRefs = false,
              combinationMaterialsRefs = false,
              levelMaterialsRefs = false,
              materialCategoriesRefs = false,
              questMaterialsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (questsRefs) db.quests,
                if (combinationMaterialsRefs) db.combinationMaterials,
                if (levelMaterialsRefs) db.levelMaterials,
                if (materialCategoriesRefs) db.materialCategories,
                if (questMaterialsRefs) db.questMaterials
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (questsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$MaterialsTableReferences._questsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MaterialsTableReferences(db, table, p0)
                                .questsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.objectiveMaterial == item.id),
                        typedResults: items),
                  if (combinationMaterialsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MaterialsTableReferences
                            ._combinationMaterialsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MaterialsTableReferences(db, table, p0)
                                .combinationMaterialsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.materialId == item.id),
                        typedResults: items),
                  if (levelMaterialsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MaterialsTableReferences
                            ._levelMaterialsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MaterialsTableReferences(db, table, p0)
                                .levelMaterialsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.materialId == item.id),
                        typedResults: items),
                  if (materialCategoriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MaterialsTableReferences
                            ._materialCategoriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MaterialsTableReferences(db, table, p0)
                                .materialCategoriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.materialId == item.id),
                        typedResults: items),
                  if (questMaterialsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MaterialsTableReferences
                            ._questMaterialsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MaterialsTableReferences(db, table, p0)
                                .questMaterialsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.materialId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MaterialsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $MaterialsTable,
    Material,
    $$MaterialsTableFilterComposer,
    $$MaterialsTableOrderingComposer,
    $$MaterialsTableAnnotationComposer,
    $$MaterialsTableCreateCompanionBuilder,
    $$MaterialsTableUpdateCompanionBuilder,
    (Material, $$MaterialsTableReferences),
    Material,
    PrefetchHooks Function(
        {bool questsRefs,
        bool combinationMaterialsRefs,
        bool levelMaterialsRefs,
        bool materialCategoriesRefs,
        bool questMaterialsRefs})>;
typedef $$QuestsTableCreateCompanionBuilder = QuestsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  required String startingDialog,
  required String endingDialogSuccess,
  required String endingDialogFailure,
  Value<int?> minimumMoneyRequired,
  Value<int?> maximumMoneyRequired,
  Value<Uint8List?> image,
  Value<int?> levelWhenActive,
  Value<int?> characterIssuer,
  Value<int?> objectiveMaterial,
  Value<int?> experienceAdded,
  Value<int?> moneyAddedSuccess,
  Value<int?> moneyAddedFailure,
  Value<String> acceptButton,
  Value<String> declineButton,
  Value<int?> minimumLikeRequired,
  Value<int?> maximumLikeRequired,
  Value<int?> likeAddedSuccess,
  Value<int?> likeAddedFailure,
});
typedef $$QuestsTableUpdateCompanionBuilder = QuestsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<String> startingDialog,
  Value<String> endingDialogSuccess,
  Value<String> endingDialogFailure,
  Value<int?> minimumMoneyRequired,
  Value<int?> maximumMoneyRequired,
  Value<Uint8List?> image,
  Value<int?> levelWhenActive,
  Value<int?> characterIssuer,
  Value<int?> objectiveMaterial,
  Value<int?> experienceAdded,
  Value<int?> moneyAddedSuccess,
  Value<int?> moneyAddedFailure,
  Value<String> acceptButton,
  Value<String> declineButton,
  Value<int?> minimumLikeRequired,
  Value<int?> maximumLikeRequired,
  Value<int?> likeAddedSuccess,
  Value<int?> likeAddedFailure,
});

final class $$QuestsTableReferences
    extends BaseReferences<_$SharedAppDatabase, $QuestsTable, Quest> {
  $$QuestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CharactersTable _characterIssuerTable(_$SharedAppDatabase db) =>
      db.characters.createAlias(
          $_aliasNameGenerator(db.quests.characterIssuer, db.characters.id));

  $$CharactersTableProcessedTableManager? get characterIssuer {
    if ($_item.characterIssuer == null) return null;
    final manager = $$CharactersTableTableManager($_db, $_db.characters)
        .filter((f) => f.id($_item.characterIssuer!));
    final item = $_typedResult.readTableOrNull(_characterIssuerTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MaterialsTable _objectiveMaterialTable(_$SharedAppDatabase db) =>
      db.materials.createAlias(
          $_aliasNameGenerator(db.quests.objectiveMaterial, db.materials.id));

  $$MaterialsTableProcessedTableManager? get objectiveMaterial {
    if ($_item.objectiveMaterial == null) return null;
    final manager = $$MaterialsTableTableManager($_db, $_db.materials)
        .filter((f) => f.id($_item.objectiveMaterial!));
    final item = $_typedResult.readTableOrNull(_objectiveMaterialTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$LevelsTable, List<Level>> _levelsRefsTable(
          _$SharedAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.levels,
          aliasName:
              $_aliasNameGenerator(db.quests.id, db.levels.questRequired));

  $$LevelsTableProcessedTableManager get levelsRefs {
    final manager = $$LevelsTableTableManager($_db, $_db.levels)
        .filter((f) => f.questRequired.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_levelsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$QuestMaterialsTable, List<QuestMaterial>>
      _questMaterialsRefsTable(_$SharedAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.questMaterials,
              aliasName: $_aliasNameGenerator(
                  db.quests.id, db.questMaterials.questId));

  $$QuestMaterialsTableProcessedTableManager get questMaterialsRefs {
    final manager = $$QuestMaterialsTableTableManager($_db, $_db.questMaterials)
        .filter((f) => f.questId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_questMaterialsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$QuestsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $QuestsTable> {
  $$QuestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startingDialog => $composableBuilder(
      column: $table.startingDialog,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endingDialogSuccess => $composableBuilder(
      column: $table.endingDialogSuccess,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endingDialogFailure => $composableBuilder(
      column: $table.endingDialogFailure,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minimumMoneyRequired => $composableBuilder(
      column: $table.minimumMoneyRequired,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maximumMoneyRequired => $composableBuilder(
      column: $table.maximumMoneyRequired,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get levelWhenActive => $composableBuilder(
      column: $table.levelWhenActive,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get experienceAdded => $composableBuilder(
      column: $table.experienceAdded,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get moneyAddedSuccess => $composableBuilder(
      column: $table.moneyAddedSuccess,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get moneyAddedFailure => $composableBuilder(
      column: $table.moneyAddedFailure,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get acceptButton => $composableBuilder(
      column: $table.acceptButton, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get declineButton => $composableBuilder(
      column: $table.declineButton, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minimumLikeRequired => $composableBuilder(
      column: $table.minimumLikeRequired,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maximumLikeRequired => $composableBuilder(
      column: $table.maximumLikeRequired,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likeAddedSuccess => $composableBuilder(
      column: $table.likeAddedSuccess,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likeAddedFailure => $composableBuilder(
      column: $table.likeAddedFailure,
      builder: (column) => ColumnFilters(column));

  $$CharactersTableFilterComposer get characterIssuer {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.characterIssuer,
        referencedTable: $db.characters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CharactersTableFilterComposer(
              $db: $db,
              $table: $db.characters,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableFilterComposer get objectiveMaterial {
    final $$MaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveMaterial,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableFilterComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> levelsRefs(
      Expression<bool> Function($$LevelsTableFilterComposer f) f) {
    final $$LevelsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.questRequired,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableFilterComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> questMaterialsRefs(
      Expression<bool> Function($$QuestMaterialsTableFilterComposer f) f) {
    final $$QuestMaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questMaterials,
        getReferencedColumn: (t) => t.questId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestMaterialsTableFilterComposer(
              $db: $db,
              $table: $db.questMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $QuestsTable> {
  $$QuestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startingDialog => $composableBuilder(
      column: $table.startingDialog,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endingDialogSuccess => $composableBuilder(
      column: $table.endingDialogSuccess,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endingDialogFailure => $composableBuilder(
      column: $table.endingDialogFailure,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minimumMoneyRequired => $composableBuilder(
      column: $table.minimumMoneyRequired,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maximumMoneyRequired => $composableBuilder(
      column: $table.maximumMoneyRequired,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get levelWhenActive => $composableBuilder(
      column: $table.levelWhenActive,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get experienceAdded => $composableBuilder(
      column: $table.experienceAdded,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get moneyAddedSuccess => $composableBuilder(
      column: $table.moneyAddedSuccess,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get moneyAddedFailure => $composableBuilder(
      column: $table.moneyAddedFailure,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get acceptButton => $composableBuilder(
      column: $table.acceptButton,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get declineButton => $composableBuilder(
      column: $table.declineButton,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minimumLikeRequired => $composableBuilder(
      column: $table.minimumLikeRequired,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maximumLikeRequired => $composableBuilder(
      column: $table.maximumLikeRequired,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likeAddedSuccess => $composableBuilder(
      column: $table.likeAddedSuccess,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likeAddedFailure => $composableBuilder(
      column: $table.likeAddedFailure,
      builder: (column) => ColumnOrderings(column));

  $$CharactersTableOrderingComposer get characterIssuer {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.characterIssuer,
        referencedTable: $db.characters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CharactersTableOrderingComposer(
              $db: $db,
              $table: $db.characters,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableOrderingComposer get objectiveMaterial {
    final $$MaterialsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveMaterial,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableOrderingComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $QuestsTable> {
  $$QuestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get startingDialog => $composableBuilder(
      column: $table.startingDialog, builder: (column) => column);

  GeneratedColumn<String> get endingDialogSuccess => $composableBuilder(
      column: $table.endingDialogSuccess, builder: (column) => column);

  GeneratedColumn<String> get endingDialogFailure => $composableBuilder(
      column: $table.endingDialogFailure, builder: (column) => column);

  GeneratedColumn<int> get minimumMoneyRequired => $composableBuilder(
      column: $table.minimumMoneyRequired, builder: (column) => column);

  GeneratedColumn<int> get maximumMoneyRequired => $composableBuilder(
      column: $table.maximumMoneyRequired, builder: (column) => column);

  GeneratedColumn<Uint8List> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get levelWhenActive => $composableBuilder(
      column: $table.levelWhenActive, builder: (column) => column);

  GeneratedColumn<int> get experienceAdded => $composableBuilder(
      column: $table.experienceAdded, builder: (column) => column);

  GeneratedColumn<int> get moneyAddedSuccess => $composableBuilder(
      column: $table.moneyAddedSuccess, builder: (column) => column);

  GeneratedColumn<int> get moneyAddedFailure => $composableBuilder(
      column: $table.moneyAddedFailure, builder: (column) => column);

  GeneratedColumn<String> get acceptButton => $composableBuilder(
      column: $table.acceptButton, builder: (column) => column);

  GeneratedColumn<String> get declineButton => $composableBuilder(
      column: $table.declineButton, builder: (column) => column);

  GeneratedColumn<int> get minimumLikeRequired => $composableBuilder(
      column: $table.minimumLikeRequired, builder: (column) => column);

  GeneratedColumn<int> get maximumLikeRequired => $composableBuilder(
      column: $table.maximumLikeRequired, builder: (column) => column);

  GeneratedColumn<int> get likeAddedSuccess => $composableBuilder(
      column: $table.likeAddedSuccess, builder: (column) => column);

  GeneratedColumn<int> get likeAddedFailure => $composableBuilder(
      column: $table.likeAddedFailure, builder: (column) => column);

  $$CharactersTableAnnotationComposer get characterIssuer {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.characterIssuer,
        referencedTable: $db.characters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CharactersTableAnnotationComposer(
              $db: $db,
              $table: $db.characters,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableAnnotationComposer get objectiveMaterial {
    final $$MaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.objectiveMaterial,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> levelsRefs<T extends Object>(
      Expression<T> Function($$LevelsTableAnnotationComposer a) f) {
    final $$LevelsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.questRequired,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableAnnotationComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> questMaterialsRefs<T extends Object>(
      Expression<T> Function($$QuestMaterialsTableAnnotationComposer a) f) {
    final $$QuestMaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questMaterials,
        getReferencedColumn: (t) => t.questId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestMaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.questMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $QuestsTable,
    Quest,
    $$QuestsTableFilterComposer,
    $$QuestsTableOrderingComposer,
    $$QuestsTableAnnotationComposer,
    $$QuestsTableCreateCompanionBuilder,
    $$QuestsTableUpdateCompanionBuilder,
    (Quest, $$QuestsTableReferences),
    Quest,
    PrefetchHooks Function(
        {bool characterIssuer,
        bool objectiveMaterial,
        bool levelsRefs,
        bool questMaterialsRefs})> {
  $$QuestsTableTableManager(_$SharedAppDatabase db, $QuestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> startingDialog = const Value.absent(),
            Value<String> endingDialogSuccess = const Value.absent(),
            Value<String> endingDialogFailure = const Value.absent(),
            Value<int?> minimumMoneyRequired = const Value.absent(),
            Value<int?> maximumMoneyRequired = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
            Value<int?> levelWhenActive = const Value.absent(),
            Value<int?> characterIssuer = const Value.absent(),
            Value<int?> objectiveMaterial = const Value.absent(),
            Value<int?> experienceAdded = const Value.absent(),
            Value<int?> moneyAddedSuccess = const Value.absent(),
            Value<int?> moneyAddedFailure = const Value.absent(),
            Value<String> acceptButton = const Value.absent(),
            Value<String> declineButton = const Value.absent(),
            Value<int?> minimumLikeRequired = const Value.absent(),
            Value<int?> maximumLikeRequired = const Value.absent(),
            Value<int?> likeAddedSuccess = const Value.absent(),
            Value<int?> likeAddedFailure = const Value.absent(),
          }) =>
              QuestsCompanion(
            id: id,
            name: name,
            description: description,
            startingDialog: startingDialog,
            endingDialogSuccess: endingDialogSuccess,
            endingDialogFailure: endingDialogFailure,
            minimumMoneyRequired: minimumMoneyRequired,
            maximumMoneyRequired: maximumMoneyRequired,
            image: image,
            levelWhenActive: levelWhenActive,
            characterIssuer: characterIssuer,
            objectiveMaterial: objectiveMaterial,
            experienceAdded: experienceAdded,
            moneyAddedSuccess: moneyAddedSuccess,
            moneyAddedFailure: moneyAddedFailure,
            acceptButton: acceptButton,
            declineButton: declineButton,
            minimumLikeRequired: minimumLikeRequired,
            maximumLikeRequired: maximumLikeRequired,
            likeAddedSuccess: likeAddedSuccess,
            likeAddedFailure: likeAddedFailure,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            required String startingDialog,
            required String endingDialogSuccess,
            required String endingDialogFailure,
            Value<int?> minimumMoneyRequired = const Value.absent(),
            Value<int?> maximumMoneyRequired = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
            Value<int?> levelWhenActive = const Value.absent(),
            Value<int?> characterIssuer = const Value.absent(),
            Value<int?> objectiveMaterial = const Value.absent(),
            Value<int?> experienceAdded = const Value.absent(),
            Value<int?> moneyAddedSuccess = const Value.absent(),
            Value<int?> moneyAddedFailure = const Value.absent(),
            Value<String> acceptButton = const Value.absent(),
            Value<String> declineButton = const Value.absent(),
            Value<int?> minimumLikeRequired = const Value.absent(),
            Value<int?> maximumLikeRequired = const Value.absent(),
            Value<int?> likeAddedSuccess = const Value.absent(),
            Value<int?> likeAddedFailure = const Value.absent(),
          }) =>
              QuestsCompanion.insert(
            id: id,
            name: name,
            description: description,
            startingDialog: startingDialog,
            endingDialogSuccess: endingDialogSuccess,
            endingDialogFailure: endingDialogFailure,
            minimumMoneyRequired: minimumMoneyRequired,
            maximumMoneyRequired: maximumMoneyRequired,
            image: image,
            levelWhenActive: levelWhenActive,
            characterIssuer: characterIssuer,
            objectiveMaterial: objectiveMaterial,
            experienceAdded: experienceAdded,
            moneyAddedSuccess: moneyAddedSuccess,
            moneyAddedFailure: moneyAddedFailure,
            acceptButton: acceptButton,
            declineButton: declineButton,
            minimumLikeRequired: minimumLikeRequired,
            maximumLikeRequired: maximumLikeRequired,
            likeAddedSuccess: likeAddedSuccess,
            likeAddedFailure: likeAddedFailure,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$QuestsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {characterIssuer = false,
              objectiveMaterial = false,
              levelsRefs = false,
              questMaterialsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (levelsRefs) db.levels,
                if (questMaterialsRefs) db.questMaterials
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (characterIssuer) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.characterIssuer,
                    referencedTable:
                        $$QuestsTableReferences._characterIssuerTable(db),
                    referencedColumn:
                        $$QuestsTableReferences._characterIssuerTable(db).id,
                  ) as T;
                }
                if (objectiveMaterial) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.objectiveMaterial,
                    referencedTable:
                        $$QuestsTableReferences._objectiveMaterialTable(db),
                    referencedColumn:
                        $$QuestsTableReferences._objectiveMaterialTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (levelsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$QuestsTableReferences._levelsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuestsTableReferences(db, table, p0).levelsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.questRequired == item.id),
                        typedResults: items),
                  if (questMaterialsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$QuestsTableReferences
                            ._questMaterialsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuestsTableReferences(db, table, p0)
                                .questMaterialsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.questId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$QuestsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $QuestsTable,
    Quest,
    $$QuestsTableFilterComposer,
    $$QuestsTableOrderingComposer,
    $$QuestsTableAnnotationComposer,
    $$QuestsTableCreateCompanionBuilder,
    $$QuestsTableUpdateCompanionBuilder,
    (Quest, $$QuestsTableReferences),
    Quest,
    PrefetchHooks Function(
        {bool characterIssuer,
        bool objectiveMaterial,
        bool levelsRefs,
        bool questMaterialsRefs})>;
typedef $$LevelsTableCreateCompanionBuilder = LevelsCompanion Function({
  Value<int> id,
  required String levelName,
  Value<String?> description,
  required int requiredExperience,
  Value<int?> questRequired,
  Value<int> number,
});
typedef $$LevelsTableUpdateCompanionBuilder = LevelsCompanion Function({
  Value<int> id,
  Value<String> levelName,
  Value<String?> description,
  Value<int> requiredExperience,
  Value<int?> questRequired,
  Value<int> number,
});

final class $$LevelsTableReferences
    extends BaseReferences<_$SharedAppDatabase, $LevelsTable, Level> {
  $$LevelsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestsTable _questRequiredTable(_$SharedAppDatabase db) => db.quests
      .createAlias($_aliasNameGenerator(db.levels.questRequired, db.quests.id));

  $$QuestsTableProcessedTableManager? get questRequired {
    if ($_item.questRequired == null) return null;
    final manager = $$QuestsTableTableManager($_db, $_db.quests)
        .filter((f) => f.id($_item.questRequired!));
    final item = $_typedResult.readTableOrNull(_questRequiredTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$BlogsTable, List<Blog>> _blogsRefsTable(
          _$SharedAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.blogs,
          aliasName: $_aliasNameGenerator(db.levels.id, db.blogs.level));

  $$BlogsTableProcessedTableManager get blogsRefs {
    final manager = $$BlogsTableTableManager($_db, $_db.blogs)
        .filter((f) => f.level.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_blogsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CombinationsTable, List<Combination>>
      _combinationsRefsTable(_$SharedAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.combinations,
              aliasName:
                  $_aliasNameGenerator(db.levels.id, db.combinations.levelId));

  $$CombinationsTableProcessedTableManager get combinationsRefs {
    final manager = $$CombinationsTableTableManager($_db, $_db.combinations)
        .filter((f) => f.levelId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_combinationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LevelMaterialsTable, List<LevelMaterial>>
      _levelMaterialsRefsTable(_$SharedAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.levelMaterials,
              aliasName: $_aliasNameGenerator(
                  db.levels.id, db.levelMaterials.levelId));

  $$LevelMaterialsTableProcessedTableManager get levelMaterialsRefs {
    final manager = $$LevelMaterialsTableTableManager($_db, $_db.levelMaterials)
        .filter((f) => f.levelId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_levelMaterialsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$LevelsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $LevelsTable> {
  $$LevelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get levelName => $composableBuilder(
      column: $table.levelName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get requiredExperience => $composableBuilder(
      column: $table.requiredExperience,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  $$QuestsTableFilterComposer get questRequired {
    final $$QuestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questRequired,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableFilterComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> blogsRefs(
      Expression<bool> Function($$BlogsTableFilterComposer f) f) {
    final $$BlogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.blogs,
        getReferencedColumn: (t) => t.level,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BlogsTableFilterComposer(
              $db: $db,
              $table: $db.blogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> combinationsRefs(
      Expression<bool> Function($$CombinationsTableFilterComposer f) f) {
    final $$CombinationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.combinations,
        getReferencedColumn: (t) => t.levelId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CombinationsTableFilterComposer(
              $db: $db,
              $table: $db.combinations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> levelMaterialsRefs(
      Expression<bool> Function($$LevelMaterialsTableFilterComposer f) f) {
    final $$LevelMaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.levelMaterials,
        getReferencedColumn: (t) => t.levelId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelMaterialsTableFilterComposer(
              $db: $db,
              $table: $db.levelMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LevelsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $LevelsTable> {
  $$LevelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get levelName => $composableBuilder(
      column: $table.levelName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get requiredExperience => $composableBuilder(
      column: $table.requiredExperience,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  $$QuestsTableOrderingComposer get questRequired {
    final $$QuestsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questRequired,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableOrderingComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LevelsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $LevelsTable> {
  $$LevelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get levelName =>
      $composableBuilder(column: $table.levelName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get requiredExperience => $composableBuilder(
      column: $table.requiredExperience, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  $$QuestsTableAnnotationComposer get questRequired {
    final $$QuestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questRequired,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableAnnotationComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> blogsRefs<T extends Object>(
      Expression<T> Function($$BlogsTableAnnotationComposer a) f) {
    final $$BlogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.blogs,
        getReferencedColumn: (t) => t.level,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BlogsTableAnnotationComposer(
              $db: $db,
              $table: $db.blogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> combinationsRefs<T extends Object>(
      Expression<T> Function($$CombinationsTableAnnotationComposer a) f) {
    final $$CombinationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.combinations,
        getReferencedColumn: (t) => t.levelId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CombinationsTableAnnotationComposer(
              $db: $db,
              $table: $db.combinations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> levelMaterialsRefs<T extends Object>(
      Expression<T> Function($$LevelMaterialsTableAnnotationComposer a) f) {
    final $$LevelMaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.levelMaterials,
        getReferencedColumn: (t) => t.levelId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelMaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.levelMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LevelsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $LevelsTable,
    Level,
    $$LevelsTableFilterComposer,
    $$LevelsTableOrderingComposer,
    $$LevelsTableAnnotationComposer,
    $$LevelsTableCreateCompanionBuilder,
    $$LevelsTableUpdateCompanionBuilder,
    (Level, $$LevelsTableReferences),
    Level,
    PrefetchHooks Function(
        {bool questRequired,
        bool blogsRefs,
        bool combinationsRefs,
        bool levelMaterialsRefs})> {
  $$LevelsTableTableManager(_$SharedAppDatabase db, $LevelsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LevelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LevelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LevelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> levelName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> requiredExperience = const Value.absent(),
            Value<int?> questRequired = const Value.absent(),
            Value<int> number = const Value.absent(),
          }) =>
              LevelsCompanion(
            id: id,
            levelName: levelName,
            description: description,
            requiredExperience: requiredExperience,
            questRequired: questRequired,
            number: number,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String levelName,
            Value<String?> description = const Value.absent(),
            required int requiredExperience,
            Value<int?> questRequired = const Value.absent(),
            Value<int> number = const Value.absent(),
          }) =>
              LevelsCompanion.insert(
            id: id,
            levelName: levelName,
            description: description,
            requiredExperience: requiredExperience,
            questRequired: questRequired,
            number: number,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$LevelsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {questRequired = false,
              blogsRefs = false,
              combinationsRefs = false,
              levelMaterialsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (blogsRefs) db.blogs,
                if (combinationsRefs) db.combinations,
                if (levelMaterialsRefs) db.levelMaterials
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (questRequired) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questRequired,
                    referencedTable:
                        $$LevelsTableReferences._questRequiredTable(db),
                    referencedColumn:
                        $$LevelsTableReferences._questRequiredTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (blogsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$LevelsTableReferences._blogsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LevelsTableReferences(db, table, p0).blogsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.level == item.id),
                        typedResults: items),
                  if (combinationsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$LevelsTableReferences._combinationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LevelsTableReferences(db, table, p0)
                                .combinationsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.levelId == item.id),
                        typedResults: items),
                  if (levelMaterialsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$LevelsTableReferences
                            ._levelMaterialsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LevelsTableReferences(db, table, p0)
                                .levelMaterialsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.levelId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$LevelsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $LevelsTable,
    Level,
    $$LevelsTableFilterComposer,
    $$LevelsTableOrderingComposer,
    $$LevelsTableAnnotationComposer,
    $$LevelsTableCreateCompanionBuilder,
    $$LevelsTableUpdateCompanionBuilder,
    (Level, $$LevelsTableReferences),
    Level,
    PrefetchHooks Function(
        {bool questRequired,
        bool blogsRefs,
        bool combinationsRefs,
        bool levelMaterialsRefs})>;
typedef $$BlogsTableCreateCompanionBuilder = BlogsCompanion Function({
  Value<int> id,
  required int level,
  required String title,
  Value<String?> description,
  Value<Uint8List?> image,
});
typedef $$BlogsTableUpdateCompanionBuilder = BlogsCompanion Function({
  Value<int> id,
  Value<int> level,
  Value<String> title,
  Value<String?> description,
  Value<Uint8List?> image,
});

final class $$BlogsTableReferences
    extends BaseReferences<_$SharedAppDatabase, $BlogsTable, Blog> {
  $$BlogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LevelsTable _levelTable(_$SharedAppDatabase db) =>
      db.levels.createAlias($_aliasNameGenerator(db.blogs.level, db.levels.id));

  $$LevelsTableProcessedTableManager? get level {
    if ($_item.level == null) return null;
    final manager = $$LevelsTableTableManager($_db, $_db.levels)
        .filter((f) => f.id($_item.level!));
    final item = $_typedResult.readTableOrNull(_levelTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BlogsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $BlogsTable> {
  $$BlogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  $$LevelsTableFilterComposer get level {
    final $$LevelsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.level,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableFilterComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BlogsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $BlogsTable> {
  $$BlogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  $$LevelsTableOrderingComposer get level {
    final $$LevelsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.level,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableOrderingComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BlogsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $BlogsTable> {
  $$BlogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<Uint8List> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  $$LevelsTableAnnotationComposer get level {
    final $$LevelsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.level,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableAnnotationComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BlogsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $BlogsTable,
    Blog,
    $$BlogsTableFilterComposer,
    $$BlogsTableOrderingComposer,
    $$BlogsTableAnnotationComposer,
    $$BlogsTableCreateCompanionBuilder,
    $$BlogsTableUpdateCompanionBuilder,
    (Blog, $$BlogsTableReferences),
    Blog,
    PrefetchHooks Function({bool level})> {
  $$BlogsTableTableManager(_$SharedAppDatabase db, $BlogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
          }) =>
              BlogsCompanion(
            id: id,
            level: level,
            title: title,
            description: description,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int level,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
          }) =>
              BlogsCompanion.insert(
            id: id,
            level: level,
            title: title,
            description: description,
            image: image,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$BlogsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({level = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (level) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.level,
                    referencedTable: $$BlogsTableReferences._levelTable(db),
                    referencedColumn: $$BlogsTableReferences._levelTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BlogsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $BlogsTable,
    Blog,
    $$BlogsTableFilterComposer,
    $$BlogsTableOrderingComposer,
    $$BlogsTableAnnotationComposer,
    $$BlogsTableCreateCompanionBuilder,
    $$BlogsTableUpdateCompanionBuilder,
    (Blog, $$BlogsTableReferences),
    Blog,
    PrefetchHooks Function({bool level})>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> image,
  Value<int> purchasable,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> image,
  Value<int> purchasable,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$SharedAppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MaterialCategoriesTable, List<MaterialCategory>>
      _materialCategoriesRefsTable(_$SharedAppDatabase db) =>
          MultiTypedResultKey.fromTable(db.materialCategories,
              aliasName: $_aliasNameGenerator(
                  db.categories.id, db.materialCategories.categoryId));

  $$MaterialCategoriesTableProcessedTableManager get materialCategoriesRefs {
    final manager =
        $$MaterialCategoriesTableTableManager($_db, $_db.materialCategories)
            .filter((f) => f.categoryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_materialCategoriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$SharedAppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchasable => $composableBuilder(
      column: $table.purchasable, builder: (column) => ColumnFilters(column));

  Expression<bool> materialCategoriesRefs(
      Expression<bool> Function($$MaterialCategoriesTableFilterComposer f) f) {
    final $$MaterialCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.materialCategories,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.materialCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchasable => $composableBuilder(
      column: $table.purchasable, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get purchasable => $composableBuilder(
      column: $table.purchasable, builder: (column) => column);

  Expression<T> materialCategoriesRefs<T extends Object>(
      Expression<T> Function($$MaterialCategoriesTableAnnotationComposer a) f) {
    final $$MaterialCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.materialCategories,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MaterialCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.materialCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool materialCategoriesRefs})> {
  $$CategoriesTableTableManager(_$SharedAppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int> purchasable = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            description: description,
            image: image,
            purchasable: purchasable,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int> purchasable = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            description: description,
            image: image,
            purchasable: purchasable,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({materialCategoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (materialCategoriesRefs) db.materialCategories
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (materialCategoriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesTableReferences
                            ._materialCategoriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .materialCategoriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, $$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool materialCategoriesRefs})>;
typedef $$CombinationsTableCreateCompanionBuilder = CombinationsCompanion
    Function({
  Value<int> id,
  Value<String?> description,
  Value<int?> blogId,
  Value<int?> levelId,
});
typedef $$CombinationsTableUpdateCompanionBuilder = CombinationsCompanion
    Function({
  Value<int> id,
  Value<String?> description,
  Value<int?> blogId,
  Value<int?> levelId,
});

final class $$CombinationsTableReferences extends BaseReferences<
    _$SharedAppDatabase, $CombinationsTable, Combination> {
  $$CombinationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LevelsTable _levelIdTable(_$SharedAppDatabase db) => db.levels
      .createAlias($_aliasNameGenerator(db.combinations.levelId, db.levels.id));

  $$LevelsTableProcessedTableManager? get levelId {
    if ($_item.levelId == null) return null;
    final manager = $$LevelsTableTableManager($_db, $_db.levels)
        .filter((f) => f.id($_item.levelId!));
    final item = $_typedResult.readTableOrNull(_levelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CombinationMaterialsTable,
      List<CombinationMaterial>> _combinationMaterialsRefsTable(
          _$SharedAppDatabase db) =>
      MultiTypedResultKey.fromTable(db.combinationMaterials,
          aliasName: $_aliasNameGenerator(
              db.combinations.id, db.combinationMaterials.combinationId));

  $$CombinationMaterialsTableProcessedTableManager
      get combinationMaterialsRefs {
    final manager =
        $$CombinationMaterialsTableTableManager($_db, $_db.combinationMaterials)
            .filter((f) => f.combinationId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_combinationMaterialsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CombinationsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $CombinationsTable> {
  $$CombinationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => ColumnFilters(column));

  $$LevelsTableFilterComposer get levelId {
    final $$LevelsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.levelId,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableFilterComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> combinationMaterialsRefs(
      Expression<bool> Function($$CombinationMaterialsTableFilterComposer f)
          f) {
    final $$CombinationMaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.combinationMaterials,
        getReferencedColumn: (t) => t.combinationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CombinationMaterialsTableFilterComposer(
              $db: $db,
              $table: $db.combinationMaterials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CombinationsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $CombinationsTable> {
  $$CombinationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get blogId => $composableBuilder(
      column: $table.blogId, builder: (column) => ColumnOrderings(column));

  $$LevelsTableOrderingComposer get levelId {
    final $$LevelsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.levelId,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableOrderingComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CombinationsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $CombinationsTable> {
  $$CombinationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get blogId =>
      $composableBuilder(column: $table.blogId, builder: (column) => column);

  $$LevelsTableAnnotationComposer get levelId {
    final $$LevelsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.levelId,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableAnnotationComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> combinationMaterialsRefs<T extends Object>(
      Expression<T> Function($$CombinationMaterialsTableAnnotationComposer a)
          f) {
    final $$CombinationMaterialsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.combinationMaterials,
            getReferencedColumn: (t) => t.combinationId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CombinationMaterialsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.combinationMaterials,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CombinationsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $CombinationsTable,
    Combination,
    $$CombinationsTableFilterComposer,
    $$CombinationsTableOrderingComposer,
    $$CombinationsTableAnnotationComposer,
    $$CombinationsTableCreateCompanionBuilder,
    $$CombinationsTableUpdateCompanionBuilder,
    (Combination, $$CombinationsTableReferences),
    Combination,
    PrefetchHooks Function({bool levelId, bool combinationMaterialsRefs})> {
  $$CombinationsTableTableManager(
      _$SharedAppDatabase db, $CombinationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CombinationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CombinationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CombinationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> blogId = const Value.absent(),
            Value<int?> levelId = const Value.absent(),
          }) =>
              CombinationsCompanion(
            id: id,
            description: description,
            blogId: blogId,
            levelId: levelId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> blogId = const Value.absent(),
            Value<int?> levelId = const Value.absent(),
          }) =>
              CombinationsCompanion.insert(
            id: id,
            description: description,
            blogId: blogId,
            levelId: levelId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CombinationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {levelId = false, combinationMaterialsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (combinationMaterialsRefs) db.combinationMaterials
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (levelId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.levelId,
                    referencedTable:
                        $$CombinationsTableReferences._levelIdTable(db),
                    referencedColumn:
                        $$CombinationsTableReferences._levelIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (combinationMaterialsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CombinationsTableReferences
                            ._combinationMaterialsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CombinationsTableReferences(db, table, p0)
                                .combinationMaterialsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.combinationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CombinationsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $CombinationsTable,
    Combination,
    $$CombinationsTableFilterComposer,
    $$CombinationsTableOrderingComposer,
    $$CombinationsTableAnnotationComposer,
    $$CombinationsTableCreateCompanionBuilder,
    $$CombinationsTableUpdateCompanionBuilder,
    (Combination, $$CombinationsTableReferences),
    Combination,
    PrefetchHooks Function({bool levelId, bool combinationMaterialsRefs})>;
typedef $$CombinationMaterialsTableCreateCompanionBuilder
    = CombinationMaterialsCompanion Function({
  required int combinationId,
  required int materialId,
  Value<bool> product,
  Value<int> rowid,
});
typedef $$CombinationMaterialsTableUpdateCompanionBuilder
    = CombinationMaterialsCompanion Function({
  Value<int> combinationId,
  Value<int> materialId,
  Value<bool> product,
  Value<int> rowid,
});

final class $$CombinationMaterialsTableReferences extends BaseReferences<
    _$SharedAppDatabase, $CombinationMaterialsTable, CombinationMaterial> {
  $$CombinationMaterialsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CombinationsTable _combinationIdTable(_$SharedAppDatabase db) =>
      db.combinations.createAlias($_aliasNameGenerator(
          db.combinationMaterials.combinationId, db.combinations.id));

  $$CombinationsTableProcessedTableManager? get combinationId {
    if ($_item.combinationId == null) return null;
    final manager = $$CombinationsTableTableManager($_db, $_db.combinations)
        .filter((f) => f.id($_item.combinationId!));
    final item = $_typedResult.readTableOrNull(_combinationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MaterialsTable _materialIdTable(_$SharedAppDatabase db) =>
      db.materials.createAlias($_aliasNameGenerator(
          db.combinationMaterials.materialId, db.materials.id));

  $$MaterialsTableProcessedTableManager? get materialId {
    if ($_item.materialId == null) return null;
    final manager = $$MaterialsTableTableManager($_db, $_db.materials)
        .filter((f) => f.id($_item.materialId!));
    final item = $_typedResult.readTableOrNull(_materialIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CombinationMaterialsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $CombinationMaterialsTable> {
  $$CombinationMaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnFilters(column));

  $$CombinationsTableFilterComposer get combinationId {
    final $$CombinationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.combinationId,
        referencedTable: $db.combinations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CombinationsTableFilterComposer(
              $db: $db,
              $table: $db.combinations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableFilterComposer get materialId {
    final $$MaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableFilterComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CombinationMaterialsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $CombinationMaterialsTable> {
  $$CombinationMaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get product => $composableBuilder(
      column: $table.product, builder: (column) => ColumnOrderings(column));

  $$CombinationsTableOrderingComposer get combinationId {
    final $$CombinationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.combinationId,
        referencedTable: $db.combinations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CombinationsTableOrderingComposer(
              $db: $db,
              $table: $db.combinations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableOrderingComposer get materialId {
    final $$MaterialsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableOrderingComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CombinationMaterialsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $CombinationMaterialsTable> {
  $$CombinationMaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  $$CombinationsTableAnnotationComposer get combinationId {
    final $$CombinationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.combinationId,
        referencedTable: $db.combinations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CombinationsTableAnnotationComposer(
              $db: $db,
              $table: $db.combinations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableAnnotationComposer get materialId {
    final $$MaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CombinationMaterialsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $CombinationMaterialsTable,
    CombinationMaterial,
    $$CombinationMaterialsTableFilterComposer,
    $$CombinationMaterialsTableOrderingComposer,
    $$CombinationMaterialsTableAnnotationComposer,
    $$CombinationMaterialsTableCreateCompanionBuilder,
    $$CombinationMaterialsTableUpdateCompanionBuilder,
    (CombinationMaterial, $$CombinationMaterialsTableReferences),
    CombinationMaterial,
    PrefetchHooks Function({bool combinationId, bool materialId})> {
  $$CombinationMaterialsTableTableManager(
      _$SharedAppDatabase db, $CombinationMaterialsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CombinationMaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CombinationMaterialsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CombinationMaterialsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> combinationId = const Value.absent(),
            Value<int> materialId = const Value.absent(),
            Value<bool> product = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CombinationMaterialsCompanion(
            combinationId: combinationId,
            materialId: materialId,
            product: product,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int combinationId,
            required int materialId,
            Value<bool> product = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CombinationMaterialsCompanion.insert(
            combinationId: combinationId,
            materialId: materialId,
            product: product,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CombinationMaterialsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({combinationId = false, materialId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (combinationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.combinationId,
                    referencedTable: $$CombinationMaterialsTableReferences
                        ._combinationIdTable(db),
                    referencedColumn: $$CombinationMaterialsTableReferences
                        ._combinationIdTable(db)
                        .id,
                  ) as T;
                }
                if (materialId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.materialId,
                    referencedTable: $$CombinationMaterialsTableReferences
                        ._materialIdTable(db),
                    referencedColumn: $$CombinationMaterialsTableReferences
                        ._materialIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CombinationMaterialsTableProcessedTableManager
    = ProcessedTableManager<
        _$SharedAppDatabase,
        $CombinationMaterialsTable,
        CombinationMaterial,
        $$CombinationMaterialsTableFilterComposer,
        $$CombinationMaterialsTableOrderingComposer,
        $$CombinationMaterialsTableAnnotationComposer,
        $$CombinationMaterialsTableCreateCompanionBuilder,
        $$CombinationMaterialsTableUpdateCompanionBuilder,
        (CombinationMaterial, $$CombinationMaterialsTableReferences),
        CombinationMaterial,
        PrefetchHooks Function({bool combinationId, bool materialId})>;
typedef $$FunFactsTableCreateCompanionBuilder = FunFactsCompanion Function({
  Value<int> id,
  required String fact,
  required String title,
});
typedef $$FunFactsTableUpdateCompanionBuilder = FunFactsCompanion Function({
  Value<int> id,
  Value<String> fact,
  Value<String> title,
});

class $$FunFactsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $FunFactsTable> {
  $$FunFactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fact => $composableBuilder(
      column: $table.fact, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));
}

class $$FunFactsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $FunFactsTable> {
  $$FunFactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fact => $composableBuilder(
      column: $table.fact, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$FunFactsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $FunFactsTable> {
  $$FunFactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fact =>
      $composableBuilder(column: $table.fact, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$FunFactsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $FunFactsTable,
    FunFact,
    $$FunFactsTableFilterComposer,
    $$FunFactsTableOrderingComposer,
    $$FunFactsTableAnnotationComposer,
    $$FunFactsTableCreateCompanionBuilder,
    $$FunFactsTableUpdateCompanionBuilder,
    (FunFact, BaseReferences<_$SharedAppDatabase, $FunFactsTable, FunFact>),
    FunFact,
    PrefetchHooks Function()> {
  $$FunFactsTableTableManager(_$SharedAppDatabase db, $FunFactsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FunFactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FunFactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FunFactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> fact = const Value.absent(),
            Value<String> title = const Value.absent(),
          }) =>
              FunFactsCompanion(
            id: id,
            fact: fact,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String fact,
            required String title,
          }) =>
              FunFactsCompanion.insert(
            id: id,
            fact: fact,
            title: title,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FunFactsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $FunFactsTable,
    FunFact,
    $$FunFactsTableFilterComposer,
    $$FunFactsTableOrderingComposer,
    $$FunFactsTableAnnotationComposer,
    $$FunFactsTableCreateCompanionBuilder,
    $$FunFactsTableUpdateCompanionBuilder,
    (FunFact, BaseReferences<_$SharedAppDatabase, $FunFactsTable, FunFact>),
    FunFact,
    PrefetchHooks Function()>;
typedef $$LevelMaterialsTableCreateCompanionBuilder = LevelMaterialsCompanion
    Function({
  required int levelId,
  required int materialId,
  Value<int> rowid,
});
typedef $$LevelMaterialsTableUpdateCompanionBuilder = LevelMaterialsCompanion
    Function({
  Value<int> levelId,
  Value<int> materialId,
  Value<int> rowid,
});

final class $$LevelMaterialsTableReferences extends BaseReferences<
    _$SharedAppDatabase, $LevelMaterialsTable, LevelMaterial> {
  $$LevelMaterialsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $LevelsTable _levelIdTable(_$SharedAppDatabase db) =>
      db.levels.createAlias(
          $_aliasNameGenerator(db.levelMaterials.levelId, db.levels.id));

  $$LevelsTableProcessedTableManager? get levelId {
    if ($_item.levelId == null) return null;
    final manager = $$LevelsTableTableManager($_db, $_db.levels)
        .filter((f) => f.id($_item.levelId!));
    final item = $_typedResult.readTableOrNull(_levelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MaterialsTable _materialIdTable(_$SharedAppDatabase db) =>
      db.materials.createAlias(
          $_aliasNameGenerator(db.levelMaterials.materialId, db.materials.id));

  $$MaterialsTableProcessedTableManager? get materialId {
    if ($_item.materialId == null) return null;
    final manager = $$MaterialsTableTableManager($_db, $_db.materials)
        .filter((f) => f.id($_item.materialId!));
    final item = $_typedResult.readTableOrNull(_materialIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LevelMaterialsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $LevelMaterialsTable> {
  $$LevelMaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LevelsTableFilterComposer get levelId {
    final $$LevelsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.levelId,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableFilterComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableFilterComposer get materialId {
    final $$MaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableFilterComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LevelMaterialsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $LevelMaterialsTable> {
  $$LevelMaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LevelsTableOrderingComposer get levelId {
    final $$LevelsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.levelId,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableOrderingComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableOrderingComposer get materialId {
    final $$MaterialsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableOrderingComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LevelMaterialsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $LevelMaterialsTable> {
  $$LevelMaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LevelsTableAnnotationComposer get levelId {
    final $$LevelsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.levelId,
        referencedTable: $db.levels,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LevelsTableAnnotationComposer(
              $db: $db,
              $table: $db.levels,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableAnnotationComposer get materialId {
    final $$MaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LevelMaterialsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $LevelMaterialsTable,
    LevelMaterial,
    $$LevelMaterialsTableFilterComposer,
    $$LevelMaterialsTableOrderingComposer,
    $$LevelMaterialsTableAnnotationComposer,
    $$LevelMaterialsTableCreateCompanionBuilder,
    $$LevelMaterialsTableUpdateCompanionBuilder,
    (LevelMaterial, $$LevelMaterialsTableReferences),
    LevelMaterial,
    PrefetchHooks Function({bool levelId, bool materialId})> {
  $$LevelMaterialsTableTableManager(
      _$SharedAppDatabase db, $LevelMaterialsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LevelMaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LevelMaterialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LevelMaterialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> levelId = const Value.absent(),
            Value<int> materialId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LevelMaterialsCompanion(
            levelId: levelId,
            materialId: materialId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int levelId,
            required int materialId,
            Value<int> rowid = const Value.absent(),
          }) =>
              LevelMaterialsCompanion.insert(
            levelId: levelId,
            materialId: materialId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LevelMaterialsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({levelId = false, materialId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (levelId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.levelId,
                    referencedTable:
                        $$LevelMaterialsTableReferences._levelIdTable(db),
                    referencedColumn:
                        $$LevelMaterialsTableReferences._levelIdTable(db).id,
                  ) as T;
                }
                if (materialId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.materialId,
                    referencedTable:
                        $$LevelMaterialsTableReferences._materialIdTable(db),
                    referencedColumn:
                        $$LevelMaterialsTableReferences._materialIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LevelMaterialsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $LevelMaterialsTable,
    LevelMaterial,
    $$LevelMaterialsTableFilterComposer,
    $$LevelMaterialsTableOrderingComposer,
    $$LevelMaterialsTableAnnotationComposer,
    $$LevelMaterialsTableCreateCompanionBuilder,
    $$LevelMaterialsTableUpdateCompanionBuilder,
    (LevelMaterial, $$LevelMaterialsTableReferences),
    LevelMaterial,
    PrefetchHooks Function({bool levelId, bool materialId})>;
typedef $$MaterialCategoriesTableCreateCompanionBuilder
    = MaterialCategoriesCompanion Function({
  required int materialId,
  required int categoryId,
  Value<int> rowid,
});
typedef $$MaterialCategoriesTableUpdateCompanionBuilder
    = MaterialCategoriesCompanion Function({
  Value<int> materialId,
  Value<int> categoryId,
  Value<int> rowid,
});

final class $$MaterialCategoriesTableReferences extends BaseReferences<
    _$SharedAppDatabase, $MaterialCategoriesTable, MaterialCategory> {
  $$MaterialCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $MaterialsTable _materialIdTable(_$SharedAppDatabase db) =>
      db.materials.createAlias($_aliasNameGenerator(
          db.materialCategories.materialId, db.materials.id));

  $$MaterialsTableProcessedTableManager? get materialId {
    if ($_item.materialId == null) return null;
    final manager = $$MaterialsTableTableManager($_db, $_db.materials)
        .filter((f) => f.id($_item.materialId!));
    final item = $_typedResult.readTableOrNull(_materialIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CategoriesTable _categoryIdTable(_$SharedAppDatabase db) =>
      db.categories.createAlias($_aliasNameGenerator(
          db.materialCategories.categoryId, db.categories.id));

  $$CategoriesTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MaterialCategoriesTableFilterComposer
    extends Composer<_$SharedAppDatabase, $MaterialCategoriesTable> {
  $$MaterialCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MaterialsTableFilterComposer get materialId {
    final $$MaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableFilterComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaterialCategoriesTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $MaterialCategoriesTable> {
  $$MaterialCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MaterialsTableOrderingComposer get materialId {
    final $$MaterialsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableOrderingComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaterialCategoriesTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $MaterialCategoriesTable> {
  $$MaterialCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MaterialsTableAnnotationComposer get materialId {
    final $$MaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaterialCategoriesTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $MaterialCategoriesTable,
    MaterialCategory,
    $$MaterialCategoriesTableFilterComposer,
    $$MaterialCategoriesTableOrderingComposer,
    $$MaterialCategoriesTableAnnotationComposer,
    $$MaterialCategoriesTableCreateCompanionBuilder,
    $$MaterialCategoriesTableUpdateCompanionBuilder,
    (MaterialCategory, $$MaterialCategoriesTableReferences),
    MaterialCategory,
    PrefetchHooks Function({bool materialId, bool categoryId})> {
  $$MaterialCategoriesTableTableManager(
      _$SharedAppDatabase db, $MaterialCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaterialCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaterialCategoriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> materialId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MaterialCategoriesCompanion(
            materialId: materialId,
            categoryId: categoryId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int materialId,
            required int categoryId,
            Value<int> rowid = const Value.absent(),
          }) =>
              MaterialCategoriesCompanion.insert(
            materialId: materialId,
            categoryId: categoryId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MaterialCategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({materialId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (materialId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.materialId,
                    referencedTable: $$MaterialCategoriesTableReferences
                        ._materialIdTable(db),
                    referencedColumn: $$MaterialCategoriesTableReferences
                        ._materialIdTable(db)
                        .id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable: $$MaterialCategoriesTableReferences
                        ._categoryIdTable(db),
                    referencedColumn: $$MaterialCategoriesTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MaterialCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $MaterialCategoriesTable,
    MaterialCategory,
    $$MaterialCategoriesTableFilterComposer,
    $$MaterialCategoriesTableOrderingComposer,
    $$MaterialCategoriesTableAnnotationComposer,
    $$MaterialCategoriesTableCreateCompanionBuilder,
    $$MaterialCategoriesTableUpdateCompanionBuilder,
    (MaterialCategory, $$MaterialCategoriesTableReferences),
    MaterialCategory,
    PrefetchHooks Function({bool materialId, bool categoryId})>;
typedef $$QuestMaterialsTableCreateCompanionBuilder = QuestMaterialsCompanion
    Function({
  required int questId,
  required int materialId,
  Value<int> success,
  Value<int> rowid,
});
typedef $$QuestMaterialsTableUpdateCompanionBuilder = QuestMaterialsCompanion
    Function({
  Value<int> questId,
  Value<int> materialId,
  Value<int> success,
  Value<int> rowid,
});

final class $$QuestMaterialsTableReferences extends BaseReferences<
    _$SharedAppDatabase, $QuestMaterialsTable, QuestMaterial> {
  $$QuestMaterialsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $QuestsTable _questIdTable(_$SharedAppDatabase db) =>
      db.quests.createAlias(
          $_aliasNameGenerator(db.questMaterials.questId, db.quests.id));

  $$QuestsTableProcessedTableManager? get questId {
    if ($_item.questId == null) return null;
    final manager = $$QuestsTableTableManager($_db, $_db.quests)
        .filter((f) => f.id($_item.questId!));
    final item = $_typedResult.readTableOrNull(_questIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MaterialsTable _materialIdTable(_$SharedAppDatabase db) =>
      db.materials.createAlias(
          $_aliasNameGenerator(db.questMaterials.materialId, db.materials.id));

  $$MaterialsTableProcessedTableManager? get materialId {
    if ($_item.materialId == null) return null;
    final manager = $$MaterialsTableTableManager($_db, $_db.materials)
        .filter((f) => f.id($_item.materialId!));
    final item = $_typedResult.readTableOrNull(_materialIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$QuestMaterialsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $QuestMaterialsTable> {
  $$QuestMaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get success => $composableBuilder(
      column: $table.success, builder: (column) => ColumnFilters(column));

  $$QuestsTableFilterComposer get questId {
    final $$QuestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questId,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableFilterComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableFilterComposer get materialId {
    final $$MaterialsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableFilterComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestMaterialsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $QuestMaterialsTable> {
  $$QuestMaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get success => $composableBuilder(
      column: $table.success, builder: (column) => ColumnOrderings(column));

  $$QuestsTableOrderingComposer get questId {
    final $$QuestsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questId,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableOrderingComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableOrderingComposer get materialId {
    final $$MaterialsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableOrderingComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestMaterialsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $QuestMaterialsTable> {
  $$QuestMaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get success =>
      $composableBuilder(column: $table.success, builder: (column) => column);

  $$QuestsTableAnnotationComposer get questId {
    final $$QuestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questId,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableAnnotationComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MaterialsTableAnnotationComposer get materialId {
    final $$MaterialsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.materialId,
        referencedTable: $db.materials,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaterialsTableAnnotationComposer(
              $db: $db,
              $table: $db.materials,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestMaterialsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $QuestMaterialsTable,
    QuestMaterial,
    $$QuestMaterialsTableFilterComposer,
    $$QuestMaterialsTableOrderingComposer,
    $$QuestMaterialsTableAnnotationComposer,
    $$QuestMaterialsTableCreateCompanionBuilder,
    $$QuestMaterialsTableUpdateCompanionBuilder,
    (QuestMaterial, $$QuestMaterialsTableReferences),
    QuestMaterial,
    PrefetchHooks Function({bool questId, bool materialId})> {
  $$QuestMaterialsTableTableManager(
      _$SharedAppDatabase db, $QuestMaterialsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestMaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestMaterialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestMaterialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> questId = const Value.absent(),
            Value<int> materialId = const Value.absent(),
            Value<int> success = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestMaterialsCompanion(
            questId: questId,
            materialId: materialId,
            success: success,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int questId,
            required int materialId,
            Value<int> success = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestMaterialsCompanion.insert(
            questId: questId,
            materialId: materialId,
            success: success,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuestMaterialsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({questId = false, materialId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (questId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questId,
                    referencedTable:
                        $$QuestMaterialsTableReferences._questIdTable(db),
                    referencedColumn:
                        $$QuestMaterialsTableReferences._questIdTable(db).id,
                  ) as T;
                }
                if (materialId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.materialId,
                    referencedTable:
                        $$QuestMaterialsTableReferences._materialIdTable(db),
                    referencedColumn:
                        $$QuestMaterialsTableReferences._materialIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$QuestMaterialsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $QuestMaterialsTable,
    QuestMaterial,
    $$QuestMaterialsTableFilterComposer,
    $$QuestMaterialsTableOrderingComposer,
    $$QuestMaterialsTableAnnotationComposer,
    $$QuestMaterialsTableCreateCompanionBuilder,
    $$QuestMaterialsTableUpdateCompanionBuilder,
    (QuestMaterial, $$QuestMaterialsTableReferences),
    QuestMaterial,
    PrefetchHooks Function({bool questId, bool materialId})>;
typedef $$QuestQuestsTableCreateCompanionBuilder = QuestQuestsCompanion
    Function({
  required int questActive,
  required int questRequired,
  Value<int> succeeded,
  Value<int> rowid,
});
typedef $$QuestQuestsTableUpdateCompanionBuilder = QuestQuestsCompanion
    Function({
  Value<int> questActive,
  Value<int> questRequired,
  Value<int> succeeded,
  Value<int> rowid,
});

final class $$QuestQuestsTableReferences
    extends BaseReferences<_$SharedAppDatabase, $QuestQuestsTable, QuestQuest> {
  $$QuestQuestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestsTable _questActiveTable(_$SharedAppDatabase db) =>
      db.quests.createAlias(
          $_aliasNameGenerator(db.questQuests.questActive, db.quests.id));

  $$QuestsTableProcessedTableManager? get questActive {
    if ($_item.questActive == null) return null;
    final manager = $$QuestsTableTableManager($_db, $_db.quests)
        .filter((f) => f.id($_item.questActive!));
    final item = $_typedResult.readTableOrNull(_questActiveTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $QuestsTable _questRequiredTable(_$SharedAppDatabase db) =>
      db.quests.createAlias(
          $_aliasNameGenerator(db.questQuests.questRequired, db.quests.id));

  $$QuestsTableProcessedTableManager? get questRequired {
    if ($_item.questRequired == null) return null;
    final manager = $$QuestsTableTableManager($_db, $_db.quests)
        .filter((f) => f.id($_item.questRequired!));
    final item = $_typedResult.readTableOrNull(_questRequiredTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$QuestQuestsTableFilterComposer
    extends Composer<_$SharedAppDatabase, $QuestQuestsTable> {
  $$QuestQuestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get succeeded => $composableBuilder(
      column: $table.succeeded, builder: (column) => ColumnFilters(column));

  $$QuestsTableFilterComposer get questActive {
    final $$QuestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questActive,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableFilterComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$QuestsTableFilterComposer get questRequired {
    final $$QuestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questRequired,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableFilterComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestQuestsTableOrderingComposer
    extends Composer<_$SharedAppDatabase, $QuestQuestsTable> {
  $$QuestQuestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get succeeded => $composableBuilder(
      column: $table.succeeded, builder: (column) => ColumnOrderings(column));

  $$QuestsTableOrderingComposer get questActive {
    final $$QuestsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questActive,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableOrderingComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$QuestsTableOrderingComposer get questRequired {
    final $$QuestsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questRequired,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableOrderingComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestQuestsTableAnnotationComposer
    extends Composer<_$SharedAppDatabase, $QuestQuestsTable> {
  $$QuestQuestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get succeeded =>
      $composableBuilder(column: $table.succeeded, builder: (column) => column);

  $$QuestsTableAnnotationComposer get questActive {
    final $$QuestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questActive,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableAnnotationComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$QuestsTableAnnotationComposer get questRequired {
    final $$QuestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questRequired,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableAnnotationComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestQuestsTableTableManager extends RootTableManager<
    _$SharedAppDatabase,
    $QuestQuestsTable,
    QuestQuest,
    $$QuestQuestsTableFilterComposer,
    $$QuestQuestsTableOrderingComposer,
    $$QuestQuestsTableAnnotationComposer,
    $$QuestQuestsTableCreateCompanionBuilder,
    $$QuestQuestsTableUpdateCompanionBuilder,
    (QuestQuest, $$QuestQuestsTableReferences),
    QuestQuest,
    PrefetchHooks Function({bool questActive, bool questRequired})> {
  $$QuestQuestsTableTableManager(
      _$SharedAppDatabase db, $QuestQuestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestQuestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestQuestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestQuestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> questActive = const Value.absent(),
            Value<int> questRequired = const Value.absent(),
            Value<int> succeeded = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestQuestsCompanion(
            questActive: questActive,
            questRequired: questRequired,
            succeeded: succeeded,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int questActive,
            required int questRequired,
            Value<int> succeeded = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestQuestsCompanion.insert(
            questActive: questActive,
            questRequired: questRequired,
            succeeded: succeeded,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuestQuestsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {questActive = false, questRequired = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (questActive) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questActive,
                    referencedTable:
                        $$QuestQuestsTableReferences._questActiveTable(db),
                    referencedColumn:
                        $$QuestQuestsTableReferences._questActiveTable(db).id,
                  ) as T;
                }
                if (questRequired) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questRequired,
                    referencedTable:
                        $$QuestQuestsTableReferences._questRequiredTable(db),
                    referencedColumn:
                        $$QuestQuestsTableReferences._questRequiredTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$QuestQuestsTableProcessedTableManager = ProcessedTableManager<
    _$SharedAppDatabase,
    $QuestQuestsTable,
    QuestQuest,
    $$QuestQuestsTableFilterComposer,
    $$QuestQuestsTableOrderingComposer,
    $$QuestQuestsTableAnnotationComposer,
    $$QuestQuestsTableCreateCompanionBuilder,
    $$QuestQuestsTableUpdateCompanionBuilder,
    (QuestQuest, $$QuestQuestsTableReferences),
    QuestQuest,
    PrefetchHooks Function({bool questActive, bool questRequired})>;

class $SharedAppDatabaseManager {
  final _$SharedAppDatabase _db;
  $SharedAppDatabaseManager(this._db);
  $$CreditsTableTableManager get credits =>
      $$CreditsTableTableManager(_db, _db.credits);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$MaterialsTableTableManager get materials =>
      $$MaterialsTableTableManager(_db, _db.materials);
  $$QuestsTableTableManager get quests =>
      $$QuestsTableTableManager(_db, _db.quests);
  $$LevelsTableTableManager get levels =>
      $$LevelsTableTableManager(_db, _db.levels);
  $$BlogsTableTableManager get blogs =>
      $$BlogsTableTableManager(_db, _db.blogs);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$CombinationsTableTableManager get combinations =>
      $$CombinationsTableTableManager(_db, _db.combinations);
  $$CombinationMaterialsTableTableManager get combinationMaterials =>
      $$CombinationMaterialsTableTableManager(_db, _db.combinationMaterials);
  $$FunFactsTableTableManager get funFacts =>
      $$FunFactsTableTableManager(_db, _db.funFacts);
  $$LevelMaterialsTableTableManager get levelMaterials =>
      $$LevelMaterialsTableTableManager(_db, _db.levelMaterials);
  $$MaterialCategoriesTableTableManager get materialCategories =>
      $$MaterialCategoriesTableTableManager(_db, _db.materialCategories);
  $$QuestMaterialsTableTableManager get questMaterials =>
      $$QuestMaterialsTableTableManager(_db, _db.questMaterials);
  $$QuestQuestsTableTableManager get questQuests =>
      $$QuestQuestsTableTableManager(_db, _db.questQuests);
}
