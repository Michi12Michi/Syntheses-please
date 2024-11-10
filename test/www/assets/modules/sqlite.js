/**
 * Minified by jsDelivr using Terser v5.19.2.
 * Original file: /npm/@capacitor-community/sqlite@6.0.2/dist/plugin.cjs.js
 *
 * Do NOT use SRI with dynamically generated files! More information: https://www.jsdelivr.com/using-sri-with-dynamic-files
 */
"use strict";Object.defineProperty(exports,"__esModule",{value:!0});var core=require("@capacitor/core");class SQLiteConnection{constructor(e){this.sqlite=e,this._connectionDict=new Map}async initWebStore(){try{return await this.sqlite.initWebStore(),Promise.resolve()}catch(e){return Promise.reject(e)}}async saveToStore(e){try{return await this.sqlite.saveToStore({database:e}),Promise.resolve()}catch(e){return Promise.reject(e)}}async saveToLocalDisk(e){try{return await this.sqlite.saveToLocalDisk({database:e}),Promise.resolve()}catch(e){return Promise.reject(e)}}async getFromLocalDiskToStore(e){const t=null==e||e;try{return await this.sqlite.getFromLocalDiskToStore({overwrite:t}),Promise.resolve()}catch(e){return Promise.reject(e)}}async echo(e){try{const t=await this.sqlite.echo({value:e});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async isSecretStored(){try{const e=await this.sqlite.isSecretStored();return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async setEncryptionSecret(e){try{return await this.sqlite.setEncryptionSecret({passphrase:e}),Promise.resolve()}catch(e){return Promise.reject(e)}}async changeEncryptionSecret(e,t){try{return await this.sqlite.changeEncryptionSecret({passphrase:e,oldpassphrase:t}),Promise.resolve()}catch(e){return Promise.reject(e)}}async clearEncryptionSecret(){try{return await this.sqlite.clearEncryptionSecret(),Promise.resolve()}catch(e){return Promise.reject(e)}}async checkEncryptionSecret(e){try{const t=await this.sqlite.checkEncryptionSecret({passphrase:e});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async addUpgradeStatement(e,t){try{return e.endsWith(".db")&&(e=e.slice(0,-3)),await this.sqlite.addUpgradeStatement({database:e,upgrade:t}),Promise.resolve()}catch(e){return Promise.reject(e)}}async createConnection(e,t,s,r,n){try{e.endsWith(".db")&&(e=e.slice(0,-3)),await this.sqlite.createConnection({database:e,encrypted:t,mode:s,version:r,readonly:n});const i=new SQLiteDBConnection(e,n,this.sqlite),a=n?`RO_${e}`:`RW_${e}`;return this._connectionDict.set(a,i),Promise.resolve(i)}catch(e){return Promise.reject(e)}}async closeConnection(e,t){try{e.endsWith(".db")&&(e=e.slice(0,-3)),await this.sqlite.closeConnection({database:e,readonly:t});const s=t?`RO_${e}`:`RW_${e}`;return this._connectionDict.delete(s),Promise.resolve()}catch(e){return Promise.reject(e)}}async isConnection(e,t){const s={};e.endsWith(".db")&&(e=e.slice(0,-3));const r=t?`RO_${e}`:`RW_${e}`;return s.result=this._connectionDict.has(r),Promise.resolve(s)}async retrieveConnection(e,t){e.endsWith(".db")&&(e=e.slice(0,-3));const s=t?`RO_${e}`:`RW_${e}`;if(this._connectionDict.has(s)){const t=this._connectionDict.get(s);return void 0!==t?Promise.resolve(t):Promise.reject(`Connection ${e} is undefined`)}return Promise.reject(`Connection ${e} does not exist`)}async getNCDatabasePath(e,t){try{const s=await this.sqlite.getNCDatabasePath({path:e,database:t});return Promise.resolve(s)}catch(e){return Promise.reject(e)}}async createNCConnection(e,t){try{await this.sqlite.createNCConnection({databasePath:e,version:t});const s=new SQLiteDBConnection(e,!0,this.sqlite),r=`RO_${e})`;return this._connectionDict.set(r,s),Promise.resolve(s)}catch(e){return Promise.reject(e)}}async closeNCConnection(e){try{await this.sqlite.closeNCConnection({databasePath:e});const t=`RO_${e})`;return this._connectionDict.delete(t),Promise.resolve()}catch(e){return Promise.reject(e)}}async isNCConnection(e){const t={},s=`RO_${e})`;return t.result=this._connectionDict.has(s),Promise.resolve(t)}async retrieveNCConnection(e){if(this._connectionDict.has(e)){const t=`RO_${e})`,s=this._connectionDict.get(t);return void 0!==s?Promise.resolve(s):Promise.reject(`Connection ${e} is undefined`)}return Promise.reject(`Connection ${e} does not exist`)}async isNCDatabase(e){try{const t=await this.sqlite.isNCDatabase({databasePath:e});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async retrieveAllConnections(){return this._connectionDict}async closeAllConnections(){const e=new Map;try{for(const t of this._connectionDict.keys()){const s=t.substring(3),r="RO_"===t.substring(0,3);await this.sqlite.closeConnection({database:s,readonly:r}),e.set(t,null)}for(const t of e.keys())this._connectionDict.delete(t);return Promise.resolve()}catch(e){return Promise.reject(e)}}async checkConnectionsConsistency(){try{const e=[...this._connectionDict.keys()],t=[],s=[];for(const r of e)t.push(r.substring(0,2)),s.push(r.substring(3));const r=await this.sqlite.checkConnectionsConsistency({dbNames:s,openModes:t});return r.result||(this._connectionDict=new Map),Promise.resolve(r)}catch(e){return this._connectionDict=new Map,Promise.reject(e)}}async importFromJson(e){try{const t=await this.sqlite.importFromJson({jsonstring:e});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async isJsonValid(e){try{const t=await this.sqlite.isJsonValid({jsonstring:e});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async copyFromAssets(e){const t=null==e||e;try{return await this.sqlite.copyFromAssets({overwrite:t}),Promise.resolve()}catch(e){return Promise.reject(e)}}async getFromHTTPRequest(e,t){const s=null==t||t;try{return await this.sqlite.getFromHTTPRequest({url:e,overwrite:s}),Promise.resolve()}catch(e){return Promise.reject(e)}}async isDatabaseEncrypted(e){e.endsWith(".db")&&(e=e.slice(0,-3));try{const t=await this.sqlite.isDatabaseEncrypted({database:e});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async isInConfigEncryption(){try{const e=await this.sqlite.isInConfigEncryption();return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async isInConfigBiometricAuth(){try{const e=await this.sqlite.isInConfigBiometricAuth();return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async isDatabase(e){e.endsWith(".db")&&(e=e.slice(0,-3));try{const t=await this.sqlite.isDatabase({database:e});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async getDatabaseList(){try{const e=(await this.sqlite.getDatabaseList()).values;e.sort();const t={values:e};return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async getMigratableDbList(e){const t=e||"default";try{const e=await this.sqlite.getMigratableDbList({folderPath:t});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async addSQLiteSuffix(e,t){const s=e||"default",r=t||[];try{const e=await this.sqlite.addSQLiteSuffix({folderPath:s,dbNameList:r});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async deleteOldDatabases(e,t){const s=e||"default",r=t||[];try{const e=await this.sqlite.deleteOldDatabases({folderPath:s,dbNameList:r});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async moveDatabasesAndAddSuffix(e,t){const s=e||"default",r=t||[];return this.sqlite.moveDatabasesAndAddSuffix({folderPath:s,dbNameList:r})}}class SQLiteDBConnection{constructor(e,t,s){this.dbName=e,this.readonly=t,this.sqlite=s}getConnectionDBName(){return this.dbName}getConnectionReadOnly(){return this.readonly}async open(){try{return await this.sqlite.open({database:this.dbName,readonly:this.readonly}),Promise.resolve()}catch(e){return Promise.reject(e)}}async close(){try{return await this.sqlite.close({database:this.dbName,readonly:this.readonly}),Promise.resolve()}catch(e){return Promise.reject(e)}}async beginTransaction(){try{const e=await this.sqlite.beginTransaction({database:this.dbName});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async commitTransaction(){try{const e=await this.sqlite.commitTransaction({database:this.dbName});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async rollbackTransaction(){try{const e=await this.sqlite.rollbackTransaction({database:this.dbName});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async isTransactionActive(){try{const e=await this.sqlite.isTransactionActive({database:this.dbName});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async loadExtension(e){try{return await this.sqlite.loadExtension({database:this.dbName,path:e,readonly:this.readonly}),Promise.resolve()}catch(e){return Promise.reject(e)}}async enableLoadExtension(e){try{return await this.sqlite.enableLoadExtension({database:this.dbName,toggle:e,readonly:this.readonly}),Promise.resolve()}catch(e){return Promise.reject(e)}}async getUrl(){try{const e=await this.sqlite.getUrl({database:this.dbName,readonly:this.readonly});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async getVersion(){try{const e=await this.sqlite.getVersion({database:this.dbName,readonly:this.readonly});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async getTableList(){try{const e=await this.sqlite.getTableList({database:this.dbName,readonly:this.readonly});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async execute(e,t=!0,s=!0){try{if(this.readonly)return Promise.reject("not allowed in read-only mode");{const r=await this.sqlite.execute({database:this.dbName,statements:e,transaction:t,readonly:!1,isSQL92:s});return Promise.resolve(r)}}catch(e){return Promise.reject(e)}}async query(e,t,s=!0){let r;try{return r=t&&t.length>0?await this.sqlite.query({database:this.dbName,statement:e,values:t,readonly:this.readonly,isSQL92:!0}):await this.sqlite.query({database:this.dbName,statement:e,values:[],readonly:this.readonly,isSQL92:s}),r=await this.reorderRows(r),Promise.resolve(r)}catch(e){return Promise.reject(e)}}async run(e,t,s=!0,r="no",n=!0){let i;try{return this.readonly?Promise.reject("not allowed in read-only mode"):(i=t&&t.length>0?await this.sqlite.run({database:this.dbName,statement:e,values:t,transaction:s,readonly:!1,returnMode:r,isSQL92:!0}):await this.sqlite.run({database:this.dbName,statement:e,values:[],transaction:s,readonly:!1,returnMode:r,isSQL92:n}),i.changes=await this.reorderRows(i.changes),Promise.resolve(i))}catch(e){return Promise.reject(e)}}async executeSet(e,t=!0,s="no",r=!0){let n;try{return this.readonly?Promise.reject("not allowed in read-only mode"):(n=await this.sqlite.executeSet({database:this.dbName,set:e,transaction:t,readonly:!1,returnMode:s,isSQL92:r}),n.changes=await this.reorderRows(n.changes),Promise.resolve(n))}catch(e){return Promise.reject(e)}}async isExists(){try{const e=await this.sqlite.isDBExists({database:this.dbName,readonly:this.readonly});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async isTable(e){try{const t=await this.sqlite.isTableExists({database:this.dbName,table:e,readonly:this.readonly});return Promise.resolve(t)}catch(e){return Promise.reject(e)}}async isDBOpen(){try{const e=await this.sqlite.isDBOpen({database:this.dbName,readonly:this.readonly});return Promise.resolve(e)}catch(e){return Promise.reject(e)}}async delete(){try{return this.readonly?Promise.reject("not allowed in read-only mode"):(await this.sqlite.deleteDatabase({database:this.dbName,readonly:!1}),Promise.resolve())}catch(e){return Promise.reject(e)}}async createSyncTable(){try{if(this.readonly)return Promise.reject("not allowed in read-only mode");{const e=await this.sqlite.createSyncTable({database:this.dbName,readonly:!1});return Promise.resolve(e)}}catch(e){return Promise.reject(e)}}async setSyncDate(e){try{return this.readonly?Promise.reject("not allowed in read-only mode"):(await this.sqlite.setSyncDate({database:this.dbName,syncdate:e,readonly:!1}),Promise.resolve())}catch(e){return Promise.reject(e)}}async getSyncDate(){try{const e=await this.sqlite.getSyncDate({database:this.dbName,readonly:this.readonly});let t="";return e.syncDate>0&&(t=new Date(1e3*e.syncDate).toISOString()),Promise.resolve(t)}catch(e){return Promise.reject(e)}}async exportToJson(e,t=!1){try{const s=await this.sqlite.exportToJson({database:this.dbName,jsonexportmode:e,readonly:this.readonly,encrypted:t});return Promise.resolve(s)}catch(e){return Promise.reject(e)}}async deleteExportedRows(){try{return this.readonly?Promise.reject("not allowed in read-only mode"):(await this.sqlite.deleteExportedRows({database:this.dbName,readonly:!1}),Promise.resolve())}catch(e){return Promise.reject(e)}}async executeTransaction(e,t=!0){let s=0,r=!1;if(this.readonly)return Promise.reject("not allowed in read-only mode");if(await this.sqlite.beginTransaction({database:this.dbName}),r=await this.sqlite.isTransactionActive({database:this.dbName}),!r)return Promise.reject("After Begin Transaction, no transaction active");try{for(const r of e){if("object"!=typeof r||!("statement"in r))throw new Error("Error a task.statement must be provided");if("values"in r&&r.values&&r.values.length>0){const e=r.statement.toUpperCase().includes("RETURNING")?"all":"no",n=await this.sqlite.run({database:this.dbName,statement:r.statement,values:r.values,transaction:!1,readonly:!1,returnMode:e,isSQL92:t});if(n.changes.changes<0)throw new Error("Error in transaction method run ");s+=n.changes.changes}else{const e=await this.sqlite.execute({database:this.dbName,statements:r.statement,transaction:!1,readonly:!1});if(e.changes.changes<0)throw new Error("Error in transaction method execute ");s+=e.changes.changes}}s+=(await this.sqlite.commitTransaction({database:this.dbName})).changes.changes;const r={changes:{changes:s}};return Promise.resolve(r)}catch(e){const t=e.message?e.message:e;return await this.sqlite.rollbackTransaction({database:this.dbName}),Promise.reject(t)}}async reorderRows(e){const t=e;if(e?.values&&"object"==typeof e.values[0]&&Object.keys(e.values[0]).includes("ios_columns")){const s=e.values[0].ios_columns,r=[];for(let t=1;t<e.values.length;t++){const n=e.values[t],i={};for(const e of s)i[e]=n[e];r.push(i)}t.values=r}return Promise.resolve(t)}}const CapacitorSQLite=core.registerPlugin("CapacitorSQLite",{web:()=>Promise.resolve().then((function(){return web})).then((e=>new e.CapacitorSQLiteWeb)),electron:()=>window.CapacitorCustomPlatform.plugins.CapacitorSQLite});class CapacitorSQLiteWeb extends core.WebPlugin{constructor(){super(...arguments),this.jeepSqliteElement=null,this.isWebStoreOpen=!1}async initWebStore(){await customElements.whenDefined("jeep-sqlite"),this.jeepSqliteElement=document.querySelector("jeep-sqlite"),this.ensureJeepSqliteIsAvailable(),this.jeepSqliteElement.addEventListener("jeepSqliteImportProgress",(e=>{this.notifyListeners("sqliteImportProgressEvent",e.detail)})),this.jeepSqliteElement.addEventListener("jeepSqliteExportProgress",(e=>{this.notifyListeners("sqliteExportProgressEvent",e.detail)})),this.jeepSqliteElement.addEventListener("jeepSqliteHTTPRequestEnded",(e=>{this.notifyListeners("sqliteHTTPRequestEndedEvent",e.detail)})),this.jeepSqliteElement.addEventListener("jeepSqlitePickDatabaseEnded",(e=>{this.notifyListeners("sqlitePickDatabaseEndedEvent",e.detail)})),this.jeepSqliteElement.addEventListener("jeepSqliteSaveDatabaseToDisk",(e=>{this.notifyListeners("sqliteSaveDatabaseToDiskEvent",e.detail)})),this.isWebStoreOpen||(this.isWebStoreOpen=await this.jeepSqliteElement.isStoreOpen())}async saveToStore(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.saveToStore(e)}catch(e){throw new Error(`${e}`)}}async getFromLocalDiskToStore(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.getFromLocalDiskToStore(e)}catch(e){throw new Error(`${e}`)}}async saveToLocalDisk(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.saveToLocalDisk(e)}catch(e){throw new Error(`${e}`)}}async echo(e){this.ensureJeepSqliteIsAvailable();return await this.jeepSqliteElement.echo(e)}async createConnection(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.createConnection(e)}catch(e){throw new Error(`${e}`)}}async open(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.open(e)}catch(e){throw new Error(`${e}`)}}async closeConnection(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.closeConnection(e)}catch(e){throw new Error(`${e}`)}}async getVersion(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.getVersion(e)}catch(e){throw new Error(`${e}`)}}async checkConnectionsConsistency(e){this.ensureJeepSqliteIsAvailable();try{return await this.jeepSqliteElement.checkConnectionsConsistency(e)}catch(e){throw new Error(`${e}`)}}async close(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.close(e)}catch(e){throw new Error(`${e}`)}}async beginTransaction(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.beginTransaction(e)}catch(e){throw new Error(`${e}`)}}async commitTransaction(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.commitTransaction(e)}catch(e){throw new Error(`${e}`)}}async rollbackTransaction(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.rollbackTransaction(e)}catch(e){throw new Error(`${e}`)}}async isTransactionActive(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.isTransactionActive(e)}catch(e){throw new Error(`${e}`)}}async getTableList(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.getTableList(e)}catch(e){throw new Error(`${e}`)}}async execute(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.execute(e)}catch(e){throw new Error(`${e}`)}}async executeSet(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.executeSet(e)}catch(e){throw new Error(`${e}`)}}async run(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.run(e)}catch(e){throw new Error(`${e}`)}}async query(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.query(e)}catch(e){throw new Error(`${e}`)}}async isDBExists(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.isDBExists(e)}catch(e){throw new Error(`${e}`)}}async isDBOpen(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.isDBOpen(e)}catch(e){throw new Error(`${e}`)}}async isDatabase(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.isDatabase(e)}catch(e){throw new Error(`${e}`)}}async isTableExists(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.isTableExists(e)}catch(e){throw new Error(`${e}`)}}async deleteDatabase(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.deleteDatabase(e)}catch(e){throw new Error(`${e}`)}}async isJsonValid(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.isJsonValid(e)}catch(e){throw new Error(`${e}`)}}async importFromJson(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.importFromJson(e)}catch(e){throw new Error(`${e}`)}}async exportToJson(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.exportToJson(e)}catch(e){throw new Error(`${e}`)}}async createSyncTable(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.createSyncTable(e)}catch(e){throw new Error(`${e}`)}}async setSyncDate(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.setSyncDate(e)}catch(e){throw new Error(`${e}`)}}async getSyncDate(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.getSyncDate(e)}catch(e){throw new Error(`${e}`)}}async deleteExportedRows(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.deleteExportedRows(e)}catch(e){throw new Error(`${e}`)}}async addUpgradeStatement(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.addUpgradeStatement(e)}catch(e){throw new Error(`${e}`)}}async copyFromAssets(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.copyFromAssets(e)}catch(e){throw new Error(`${e}`)}}async getFromHTTPRequest(e){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return void await this.jeepSqliteElement.getFromHTTPRequest(e)}catch(e){throw new Error(`${e}`)}}async getDatabaseList(){this.ensureJeepSqliteIsAvailable(),this.ensureWebstoreIsOpen();try{return await this.jeepSqliteElement.getDatabaseList()}catch(e){throw new Error(`${e}`)}}ensureJeepSqliteIsAvailable(){if(null===this.jeepSqliteElement)throw new Error("The jeep-sqlite element is not present in the DOM! Please check the @capacitor-community/sqlite documentation for instructions regarding the web platform.")}ensureWebstoreIsOpen(){if(!this.isWebStoreOpen)throw new Error('WebStore is not open yet. You have to call "initWebStore()" first.')}async getUrl(){throw this.unimplemented("Not implemented on web.")}async getMigratableDbList(e){throw console.log("getMigratableDbList",e),this.unimplemented("Not implemented on web.")}async addSQLiteSuffix(e){throw console.log("addSQLiteSuffix",e),this.unimplemented("Not implemented on web.")}async deleteOldDatabases(e){throw console.log("deleteOldDatabases",e),this.unimplemented("Not implemented on web.")}async moveDatabasesAndAddSuffix(e){throw console.log("moveDatabasesAndAddSuffix",e),this.unimplemented("Not implemented on web.")}async isSecretStored(){throw this.unimplemented("Not implemented on web.")}async setEncryptionSecret(e){throw console.log("setEncryptionSecret",e),this.unimplemented("Not implemented on web.")}async changeEncryptionSecret(e){throw console.log("changeEncryptionSecret",e),this.unimplemented("Not implemented on web.")}async clearEncryptionSecret(){throw console.log("clearEncryptionSecret"),this.unimplemented("Not implemented on web.")}async checkEncryptionSecret(e){throw console.log("checkEncryptionPassPhrase",e),this.unimplemented("Not implemented on web.")}async getNCDatabasePath(e){throw console.log("getNCDatabasePath",e),this.unimplemented("Not implemented on web.")}async createNCConnection(e){throw console.log("createNCConnection",e),this.unimplemented("Not implemented on web.")}async closeNCConnection(e){throw console.log("closeNCConnection",e),this.unimplemented("Not implemented on web.")}async isNCDatabase(e){throw console.log("isNCDatabase",e),this.unimplemented("Not implemented on web.")}async isDatabaseEncrypted(e){throw console.log("isDatabaseEncrypted",e),this.unimplemented("Not implemented on web.")}async isInConfigEncryption(){throw this.unimplemented("Not implemented on web.")}async isInConfigBiometricAuth(){throw this.unimplemented("Not implemented on web.")}async loadExtension(e){throw console.log("loadExtension",e),this.unimplemented("Not implemented on web.")}async enableLoadExtension(e){throw console.log("enableLoadExtension",e),this.unimplemented("Not implemented on web.")}}var web=Object.freeze({__proto__:null,CapacitorSQLiteWeb:CapacitorSQLiteWeb});exports.CapacitorSQLite=CapacitorSQLite,exports.SQLiteConnection=SQLiteConnection,exports.SQLiteDBConnection=SQLiteDBConnection;
//# sourceMappingURL=/sm/19789118d927477e0a4fca0d6101cc05efc6ee560b1eb33240f9f20c6c8aedad.map