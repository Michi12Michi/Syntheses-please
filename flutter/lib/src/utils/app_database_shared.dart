import 'package:drift/drift.dart';

part 'app_database_shared.g.dart';

// Tabella blog
@DataClassName('Blog')
class Blogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get level => integer().customConstraint('NOT NULL REFERENCES levels(id) ON DELETE RESTRICT ON UPDATE CASCADE')();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  BlobColumn get image => blob().nullable()();
}

// Tabella categories
@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
  IntColumn get purchasable => integer().withDefault(Constant(0))();
}

// Tabella characters
@DataClassName('Character')
class Characters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  BlobColumn get image => blob().nullable()();
  TextColumn get description => text().nullable()();
}

// Tabella combination_material
@DataClassName('CombinationMaterial')
class CombinationMaterials extends Table {
  IntColumn get combinationId => integer().customConstraint('REFERENCES combinations(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  IntColumn get materialId => integer().customConstraint('REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  BoolColumn get product => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {combinationId, materialId};
}

// Tabella combinations
@DataClassName('Combination')
class Combinations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().nullable()();
  IntColumn get blogId => integer().nullable().customConstraint('REFERENCES blog(id) ON DELETE SET NULL ON UPDATE CASCADE')();
  IntColumn get levelId => integer().nullable().customConstraint('REFERENCES levels(id) ON DELETE SET NULL ON UPDATE CASCADE')();
}

// Tabella credits
@DataClassName('Credit')
class Credits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get number => integer()();
  TextColumn get credit => text().withLength(min: 1, max: 500)();
}

// Tabella fun_facts
@DataClassName('FunFact')
class FunFacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fact => text().withLength(min: 1, max: 500)();
  TextColumn get title => text().withLength(min: 1, max: 255)();
}

// Tabella level_material
@DataClassName('LevelMaterial')
class LevelMaterials extends Table {
  IntColumn get levelId => integer().customConstraint('REFERENCES levels(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  IntColumn get materialId => integer().customConstraint('REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE')();

  @override
  Set<Column> get primaryKey => {levelId, materialId};
}

// Tabella levels
@DataClassName('Level')
class Levels extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get levelName => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  IntColumn get requiredExperience => integer()();
  IntColumn get questRequired => integer().nullable().customConstraint('REFERENCES quests(id) ON DELETE SET NULL ON UPDATE CASCADE')();
  IntColumn get number => integer().withDefault(Constant(0))();
}

// Tabella material_category
@DataClassName('MaterialCategory')
class MaterialCategories extends Table {
  IntColumn get materialId => integer().customConstraint('REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  IntColumn get categoryId => integer().customConstraint('REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE')();

  @override
  Set<Column> get primaryKey => {materialId, categoryId};
}

// Tabella materials
@DataClassName('Material')
class Materials extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get commonName => text().withLength(min: 1, max: 255)();
  TextColumn get iupacName => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get description => text().nullable()();
  RealColumn get price => real().nullable()();
  IntColumn get experience => integer().withDefault(Constant(0))();
  IntColumn get level => integer().nullable()();
  BoolColumn get temporary => boolean().withDefault(Constant(false))();
}

// Tabella quest_material
@DataClassName('QuestMaterial')
class QuestMaterials extends Table {
  IntColumn get questId => integer().customConstraint('REFERENCES quests(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  IntColumn get materialId => integer().customConstraint('REFERENCES materials(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  IntColumn get success => integer().withDefault(Constant(1))();

  @override
  Set<Column> get primaryKey => {questId, materialId};
}

// Tabella quest_quest
@DataClassName('QuestQuest')
class QuestQuests extends Table {
  IntColumn get questActive => integer().customConstraint('REFERENCES quests(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  IntColumn get questRequired => integer().customConstraint('REFERENCES quests(id) ON DELETE CASCADE ON UPDATE CASCADE')();
  IntColumn get succeeded => integer().withDefault(Constant(1))();

  @override
  Set<Column> get primaryKey => {questActive, questRequired};
}

// Tabella quests
@DataClassName('Quest')
class Quests extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().withLength(min: 1, max: 500)();
  TextColumn get startingDialog => text().withLength(min: 1, max: 500)();
  TextColumn get endingDialogSuccess => text().withLength(min: 1, max: 500)();
  TextColumn get endingDialogFailure => text().withLength(min: 1, max: 500)();
  IntColumn get minimumMoneyRequired => integer().nullable()();
  IntColumn get maximumMoneyRequired => integer().nullable()();
  BlobColumn get image => blob().nullable()();
  IntColumn get levelWhenActive => integer().nullable().customConstraint('REFERENCES levels(id) ON DELETE SET NULL ON UPDATE CASCADE')();
  IntColumn get characterIssuer => integer().nullable().customConstraint('REFERENCES characters(id) ON DELETE SET NULL ON UPDATE CASCADE')();
  IntColumn get objectiveMaterial => integer().nullable().customConstraint('REFERENCES materials(id) ON DELETE SET NULL ON UPDATE CASCADE')();
  IntColumn get experienceAdded => integer().nullable()();
  IntColumn get moneyAddedSuccess => integer().nullable()();
  IntColumn get moneyAddedFailure => integer().nullable()();
  TextColumn get acceptButton => text().withDefault(Constant('Accetta'))();
  TextColumn get declineButton => text().withDefault(Constant('Rifiuta'))();
  IntColumn get minimumLikeRequired => integer().nullable()();
  IntColumn get maximumLikeRequired => integer().nullable()();
  IntColumn get likeAddedSuccess => integer().nullable()();
  IntColumn get likeAddedFailure => integer().nullable()();
}

@DriftDatabase(tables: [
  Credits,
  Blogs,
  Categories,
  Characters,
  CombinationMaterials,
  Combinations,
  FunFacts,
  LevelMaterials,
  Levels,
  MaterialCategories,
  Materials,
  QuestMaterials,
  QuestQuests,
  Quests,
])
abstract class SharedAppDatabase extends _$SharedAppDatabase {
  SharedAppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  // QUI VANNO TUTTE LE QUERY

  // CREDITS
  Future<List<Credit>> getAllCredits() => select(credits).get();

  // CHARACTERS
  Future<Character> getCharacterByQuestId(int idQuest) {
    return (customSelect(
      'SELECT characters.id, characters.name, characters.description '
      'FROM characters '
      'JOIN quests ON characters.id = quests.character_issuer '
      'WHERE quests.id = $idQuest ',
      readsFrom: {characters, quests},
    ).map((row) => Character(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          description: row.read<String>('description'),
        )).getSingle());
  }

  Future<List<Character>> getCharactersByQuests(List<Quest> listaQuest) {
    // Estrae solo le chiavi dalla mappa e le unisce in una stringa separata da virgole
    String idQuest = "";
    bool prima = true;

    if (listaQuest.isNotEmpty) {
      for (var quest in listaQuest) {
        if (prima) {
          idQuest += quest.id.toString();
        } else {
          idQuest += ", ${quest.id}";
        }
        
        prima = false;
      }
    } else {
      idQuest = "0";
    }
    
    return (customSelect(
      'SELECT characters.id, characters.name, characters.description '
      'FROM characters '
      'JOIN quests ON characters.id = quests.character_issuer '
      'WHERE quests.id IN ($idQuest) ',
      readsFrom: {characters, quests},
    ).map((row) => Character(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          description: row.read<String>('description'),
        )).get());
  }

  // BLOG
  Future<Blog> getBlogPage(int blogId) {
    return (customSelect(
      'SELECT id, level, title, description '
      'FROM blog '
      'WHERE id = $blogId ',
      readsFrom: {blogs},
    ).map((row) => Blog(
          id: row.read<int>('id'),
          level: row.read<int>('level'),
          title: row.read<String>('title'),
          description: row.read<String?>('description'),
        )).getSingle());
  }

  Future<Blog> getNextBlogPage(int blogId, String direzione) {
    String select = 'SELECT id, level, title, description '
                    'FROM blog '
                    'WHERE id < $blogId '
                    'ORDER BY id DESC '
                    'LIMIT 1 ';
    final selectDestra = 'SELECT id, level, title, description '
                    'FROM blog '
                    'WHERE id > $blogId '
                    'ORDER BY id ASC '
                    'LIMIT 1 ';

    if (direzione == "destra") {
      select = selectDestra;
    }

    return (customSelect(
      select,
      readsFrom: {blogs},
    ).map((row) => Blog(
          id: row.read<int>('id'),
          level: row.read<int>('level'),
          title: row.read<String>('title'),
          description: row.read<String?>('description'),
        )).getSingle());
  }

  // MATERIALS
  Future<List<Material>> getSelectedMaterials(List<dynamic> listaIdMateriali) {
    final listaIdMaterialiInt = listaIdMateriali.cast<int>();
    return (customSelect(
      'SELECT * '
      'FROM materials '
      'WHERE id IN (${listaIdMaterialiInt.join(", ")})',
      readsFrom: {materials},
    ).map((row) => Material(
          id: row.read<int>('id'),
          image: row.read<String?>('image'),
          description: row.read<String?>('description'),
          commonName: row.read<String>('common_name'),
          iupacName: row.read<String?>('iupac_name'),
          experience: row.read<int>('experience'),
          price: row.read<double?>('price'),
          temporary: row.read<bool>('temporary'),
        )).get());
  }

  Future<List<int>> getMaterialsIdByLevelNumber(int primoLivello) {
    return customSelect(
      'SELECT materials.id as mid '
      'FROM materials '
      'LEFT JOIN levels ON materials.level = levels.id '
      'WHERE levels.number <= $primoLivello ',
      readsFrom: {materials, levels},
    ).map((row) => row.read<int>('mid')).get();
  }

  Future<List<Material>> getAllMaterialsPurchasable() {
    return (customSelect(
      'SELECT m.* '
      'FROM materials AS m '
      'JOIN material_category ON m.id = material_id '
      'JOIN categories ON categories.id = category_id '
      'WHERE categories.purchasable = 1 ',
      readsFrom: {materials, materialCategories, categories},
    ).map((row) => Material(
          id: row.read<int>('id'),
          image: row.read<String?>('image'),
          description: row.read<String?>('description'),
          commonName: row.read<String>('common_name'),
          iupacName: row.read<String?>('iupac_name'),
          experience: row.read<int>('experience'),
          price: row.read<double?>('price'),
          temporary: row.read<bool>('temporary'),
        )).get());
  }

  Future<List<Material>> getMaterialsByCategory(int idCategoria, List<dynamic> listaIdMateriali) {
    final listaIdMaterialiInt = listaIdMateriali.cast<int>();
    return (customSelect(
      'SELECT * '
      'FROM materials '
      'JOIN material_category ON materials.id = material_id '
      'WHERE id IN (${listaIdMaterialiInt.join(", ")}) AND category_id = $idCategoria ',
      readsFrom: {materials, materialCategories},
    ).map((row) => Material(
          id: row.read<int>('id'),
          image: row.read<String?>('image'),
          description: row.read<String?>('description'),
          commonName: row.read<String>('common_name'),
          iupacName: row.read<String?>('iupac_name'),
          experience: row.read<int>('experience'),
          price: row.read<double?>('price'),
          temporary: row.read<bool>('temporary'),
        )).get());
  }

  Future<List<Material>> getCombinationProducts(dynamic numeroLivello, List<Material> listaMateriali) {
    // final intNumeroLivello = numeroLivello as int;
    final intNumeroLivello = 100000000; // WARN: considerare se effettuare controllo o meno
    final materialIds = listaMateriali.map((material) => material.id).toList();

    // serve che questa query restituisca materiali con product = 1 solo se la select dei materiali con product = 0 che appartengono a una stessa combinazione sono esattamente quelli passati come argomento della funzione, ad es.: alla funzione arrivano i materiali con id 1, 3 e 5; se c'è una combinazione con materiali 1,3,5 e 7, la select non doeve restituire i prodotti! Deve funzionare solo se i materiali di partenza sono esattamente quelli necessari per ottenere la combinazione. Forse da spezzettare
    return (customSelect(
      '''
      SELECT m.* 
      FROM materials AS m
      JOIN combination_material AS cm ON cm.material_id = m.id AND cm.product = 1
      JOIN combinations AS c ON c.id = cm.combination_id
      LEFT JOIN levels AS l ON c.level_id = l.id
      WHERE c.id IN (
        SELECT c.id
        FROM combinations AS c
        JOIN combination_material AS cm ON c.id = cm.combination_id
        WHERE cm.material_id IN (${materialIds.join(',')}) AND cm.product = 0
        GROUP BY c.id
        HAVING COUNT(DISTINCT cm.material_id) = ${materialIds.length} AND COUNT(cm.material_id) = ${materialIds.length}
      )
      AND (l.number <= ? OR c.level_id IS NULL)
      AND NOT EXISTS (
        SELECT 1
        FROM combinations AS c2
        JOIN combination_material AS cm2 ON c2.id = cm2.combination_id
        WHERE c2.id = c.id AND cm2.material_id NOT IN (${materialIds.join(',')}) AND cm2.product = 0
      )
      ''',
      variables: [Variable.withInt(intNumeroLivello)],
      readsFrom: {combinations, materials, levels, combinationMaterials},
    ).map((row) => Material(
      id: row.read<int>('id'),
      image: row.read<String?>('image'),
      description: row.read<String?>('description'),
      commonName: row.read<String>('common_name'),
      iupacName: row.read<String?>('iupac_name'),
      experience: row.read<int>('experience'),
      price: row.read<double?>('price'),
      temporary: row.read<bool>('temporary'),
    )).get());
  }

  // CATEGORIES
  Future<List<Category>> getConnectedCategories(List<dynamic> listaIdMateriali) {
    final listaIdMaterialiInt = listaIdMateriali.cast<int>();
    return (customSelect(
      'SELECT DISTINCT c.id, c.description, c.name, c.image, c.purchasable ' 
      'FROM categories c '
      'JOIN material_category mc ON c.id = mc.category_id '
      'WHERE mc.material_id IN (${listaIdMaterialiInt.join(", ")}) '
      'ORDER BY c.name',
      readsFrom: {categories, materialCategories},
    ).map((row) => Category(
          id: row.read<int>('id'),
          image: row.read<String?>('image'),
          description: row.read<String?>('description'),
          name: row.read<String>('name'),
          purchasable: row.read<int>('purchasable'),
        )).get());
  } 

  // QUESTS
  Future<List<Quest>> getAllQuestsUntilLevel(dynamic numeroLivello) {
    // Estrae solo le chiavi dalla mappa e le unisce in una stringa separata da virgole
    final intNumeroLivello = numeroLivello as int;
    
    return (customSelect(
      'SELECT quests.id, quests.name, quests.description, quests.starting_dialog, '
      'quests.ending_dialog_success, quests.ending_dialog_failure, quests.minimum_money_required, '
      'quests.maximum_money_required, quests.level_when_active, quests.character_issuer, '
      'quests.objective_material, quests.experience_added, quests.money_added_success, '
      'quests.money_added_failure, quests.accept_button, quests.decline_button, '
      'quests.minimum_like_required, quests.maximum_like_required, quests.like_added_success, '
      'quests.like_added_failure '
      'FROM quests '
      'JOIN levels ON quests.level_when_active = levels.id '
      'WHERE levels.number <= ? ',
      variables: [Variable.withInt(intNumeroLivello)],
      readsFrom: {quests, levels},
    ).map((row) => Quest(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          description: row.read<String>('description'),
          startingDialog: row.read<String>('starting_dialog'),
          endingDialogSuccess: row.read<String>('ending_dialog_success'),
          endingDialogFailure: row.read<String>('ending_dialog_failure'),
          minimumMoneyRequired: row.read<int?>('minimum_money_required'),
          maximumMoneyRequired: row.read<int?>('maximum_money_required'),
          levelWhenActive: row.read<int?>('level_when_active'),
          characterIssuer: row.read<int?>('character_issuer'),
          objectiveMaterial: row.read<int?>('objective_material'),
          experienceAdded: row.read<int?>('experience_added'),
          moneyAddedSuccess: row.read<int?>('money_added_success'),
          moneyAddedFailure: row.read<int?>('money_added_failure'),
          acceptButton: row.read<String>('accept_button'),
          declineButton: row.read<String>('decline_button'),
          minimumLikeRequired: row.read<int?>('minimum_like_required'),
          maximumLikeRequired: row.read<int?>('maximum_like_required'),
          likeAddedSuccess: row.read<int?>('like_added_success'),
          likeAddedFailure: row.read<int?>('like_added_failure'),
        )).get());
  }

  Future<List<Quest>> getDoableQuests(dynamic numeroLivello, Map<dynamic, dynamic> listaIdQuestSvolte) {
    // Estrae solo le chiavi dalla mappa e le unisce in una stringa separata da virgole
    final intNumeroLivello = numeroLivello as int;
    final questSvolte = listaIdQuestSvolte.isEmpty ? '0' : listaIdQuestSvolte.keys.join(", ");
    
    return (customSelect(
      'SELECT quests.id as qid, quests.name, quests.description, quests.starting_dialog, '
      'quests.ending_dialog_success, quests.ending_dialog_failure, quests.minimum_money_required, '
      'quests.maximum_money_required, quests.level_when_active, quests.character_issuer, '
      'quests.objective_material, quests.experience_added, quests.money_added_success, '
      'quests.money_added_failure, quests.accept_button, quests.decline_button, '
      'quests.minimum_like_required, quests.maximum_like_required, quests.like_added_success, '
      'quests.like_added_failure '
      'FROM quests '
      'JOIN levels ON quests.level_when_active = levels.number '
      'WHERE levels.number = ? AND quests.id NOT IN ($questSvolte) ',
      variables: [Variable.withInt(intNumeroLivello)],
      readsFrom: {quests, levels},
    ).map((row) => Quest(
          id: row.read<int>('qid'),
          name: row.read<String>('name'),
          description: row.read<String>('description'),
          startingDialog: row.read<String>('starting_dialog'),
          endingDialogSuccess: row.read<String>('ending_dialog_success'),
          endingDialogFailure: row.read<String>('ending_dialog_failure'),
          minimumMoneyRequired: row.read<int?>('minimum_money_required'),
          maximumMoneyRequired: row.read<int?>('maximum_money_required'),
          levelWhenActive: row.read<int?>('level_when_active'),
          characterIssuer: row.read<int?>('character_issuer'),
          objectiveMaterial: row.read<int?>('objective_material'),
          experienceAdded: row.read<int?>('experience_added'),
          moneyAddedSuccess: row.read<int?>('money_added_success'),
          moneyAddedFailure: row.read<int?>('money_added_failure'),
          acceptButton: row.read<String>('accept_button'),
          declineButton: row.read<String>('decline_button'),
          minimumLikeRequired: row.read<int?>('minimum_like_required'),
          maximumLikeRequired: row.read<int?>('maximum_like_required'),
          likeAddedSuccess: row.read<int?>('like_added_success'),
          likeAddedFailure: row.read<int?>('like_added_failure'),
        )).get());
  }

  // ottiene la quest singola correlata
  Future<Quest> getQuestById(int questId) {
    return customSelect(
      'SELECT quests.id as qid, quests.name, quests.description, quests.starting_dialog, '
      'quests.ending_dialog_success, quests.ending_dialog_failure, quests.minimum_money_required, '
      'quests.maximum_money_required, quests.level_when_active, quests.character_issuer, '
      'quests.objective_material, quests.experience_added, quests.money_added_success, '
      'quests.money_added_failure, quests.accept_button, quests.decline_button, '
      'quests.minimum_like_required, quests.maximum_like_required, quests.like_added_success, '
      'quests.like_added_failure '
      'FROM quests '
      'WHERE id = ? ',
      variables: [Variable.withInt(questId)],
      readsFrom: {quests},
    ).map((row) => Quest(
      id: row.read<int>('qid'),
      name: row.read<String>('name'),
      description: row.read<String>('description'),
      startingDialog: row.read<String>('starting_dialog'),
      endingDialogSuccess: row.read<String>('ending_dialog_success'),
      endingDialogFailure: row.read<String>('ending_dialog_failure'),
      minimumMoneyRequired: row.read<int?>('minimum_money_required'),
      maximumMoneyRequired: row.read<int?>('maximum_money_required'),
      levelWhenActive: row.read<int?>('level_when_active'),
      characterIssuer: row.read<int?>('character_issuer'),
      objectiveMaterial: row.read<int?>('objective_material'),
      experienceAdded: row.read<int?>('experience_added'),
      moneyAddedSuccess: row.read<int?>('money_added_success'),
      moneyAddedFailure: row.read<int?>('money_added_failure'),
      acceptButton: row.read<String>('accept_button'),
      declineButton: row.read<String>('decline_button'),
      minimumLikeRequired: row.read<int?>('minimum_like_required'),
      maximumLikeRequired: row.read<int?>('maximum_like_required'),
      likeAddedSuccess: row.read<int?>('like_added_success'),
      likeAddedFailure: row.read<int?>('like_added_failure'),
    )).getSingle();
  }

}