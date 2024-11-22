// Usa un import condizionale per scegliere tra la versione mobile/desktop e quella web
export 'app_database_mobile.dart' 
    if (dart.library.html) 'app_database_web.dart';