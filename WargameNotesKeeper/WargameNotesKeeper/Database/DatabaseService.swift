//
//  DatabaseService.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 19/08/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseService {
    
    static let shared = DatabaseService()
    
    private var dataBase: Realm?
    
    init() {
        
        var config = Realm.Configuration()
        let userName = "defaultUser"
        
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(userName.lowercased()).realm")
        
        // Set this as the configuration used for the default Realm
        do {
            dataBase = try Realm(configuration: config)
            guard let path = dataBase?.configuration.fileURL?.path else {
                return
            }
            print("------------\nREALM Created:" + path + "\n------------")
            
        } catch let error as NSError {
            logError(error)
            dataBase = nil
        }
    }
    
    func findObjects<Element: Object>(_ type: Element.Type) -> [Object]? {
        
        guard let elements = dataBase?.objects(type) else {
            return nil
        }
        
        return elements.map{$0}
    }
    
    func saveObject(_ object: Object) {
        
        do {
            try dataBase?.write {
                
                dataBase?.add(object)
                
            }
        } catch let error as NSError {
            logError(error)
        }
        
        
    }
    
    func deleteObject(_ object: Object) {
        
        do {
            try dataBase?.write {
                
                dataBase?.delete(object)
                
            }
        } catch let error as NSError {
            logError(error)
        }
    }
    
    func changeObject(_ block: () -> Void) {
        do {
            try dataBase?.write {
                
                block()
                
            }
        } catch let error as NSError {
            logError(error)
        }
    }
    
    private func logError(_ error: NSError) {
        print("------------\nREALM ERROR:" + error.localizedDescription + "\n------------")
    }
}

extension ServiceAssembly {
    
    static func databaseService() -> DatabaseService {
        
        return DatabaseService.shared
    }
}
