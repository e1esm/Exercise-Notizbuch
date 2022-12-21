//
//  DBManager.swift
//  SwiftExerciseTracker
//
//  Created by Егор Михайлов on 18.12.2022.
//

import Foundation
import SQLite3

class DBManager{
    static let instance = DBManager()
    var database: OpaquePointer?
    var path = "myDb.sqlite"
    
    
    init(){
        self.database = createDatabase()
        createTables()
    }
    
    private func createTables(){
        let createFirstTableString = """
    CREATE TABLE IF NOT EXISTS User_info(
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    profileImage BLOB);
    """
        let createSecondTableString = """
    CREATE TABLE IF NOT EXISTS Sports_info(
      user_id INTEGER NOT NULL,
      current_quantity_progress INTEGER,
      current_steps_progress INTEGER,
      inserting_date TEXT,
      sport_type_id INTEGER NOT NULL,
      FOREIGN KEY(sport_type_id) REFERENCES Sport_types(sport_type_id),
      FOREIGN KEY(user_id) REFERENCES User_info(user_id)
    );
"""
        let createThirdTableString = """

    CREATE TABLE IF NOT EXISTS Sport_types(
      sport_type_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      sport_type_name VARCHAR(200) NOT NULL,
      UNIQUE(sport_type_name)
    );
"""
        let createFourthTableString = """
    CREATE TABLE IF NOT EXISTS Goals_info(
  user_id INTEGER NOT NULL,
  sport_type_id INTEGER NOT NULL,
  quantity_goal INTEGER,
  FOREIGN KEY(user_id) REFERENCES User_info(user_id)
);

"""
        let createQueries: [String] = [createFirstTableString, createSecondTableString, createThirdTableString, createFourthTableString]
        var createTableStatement: OpaquePointer? = nil
        
        for query in createQueries{
            if sqlite3_prepare_v2(database, query, -1, &createTableStatement, nil) == SQLITE_OK{
                if sqlite3_step(createTableStatement) == SQLITE_DONE{
                    print("table's created")
                }else{
                    print("table can't be created")
                }
            }else{
                print("statement can't be prepared")
            }
        }
        sqlite3_finalize(createTableStatement)
    }
    
    private func createDatabase()-> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        print(filePath)
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK{
            print("An error occured")
            return nil
        }else{
            print("Database's been created: \(path)")
            return db
        }
    }
}
