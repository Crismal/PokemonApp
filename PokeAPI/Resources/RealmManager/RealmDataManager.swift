//
//  RealmDataManager.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 25/5/23.
//

import Foundation
import RealmSwift

class RealmDataManager {
    
    private let realmConfiguration: Realm.Configuration
    
    init() {
        
        let fileURL = Realm.Configuration.defaultConfiguration.fileURL
        let config = Realm.Configuration(fileURL: fileURL, schemaVersion: 3)
        
        realmConfiguration = config
    }
    
    // MARK: - Get Realm Instance
    
    private func getRealmInstance() -> Realm? {
        do {
            // Attempt to open the Realm using the stored configuration
            let realm = try Realm(configuration: realmConfiguration)
            return realm
        } catch {
            // Handle error
            print("Failed to open Realm: \(error)")
            return nil
        }
    }
    
    // MARK: - Save Data
    
    func saveObject<T: Object>(_ object: T) {
        guard let realm = getRealmInstance() else { return }
        
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch {
            // Handle error
            print("Failed to save object: \(error)")
        }
    }
    
    // MARK: - Get Data
    
    func getObject<T: Object>(_ objectType: T.Type, primaryKey: String) -> T? {
        guard let realm = getRealmInstance() else { return nil }
        return realm.object(ofType: objectType, forPrimaryKey: primaryKey)
    }
    
    func getAllObjects<T: Object>(_ objectType: T.Type) -> Results<T>? {
        guard let realm = getRealmInstance() else { return nil }
        return realm.objects(objectType)
    }
}
