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
        let createSecondTableString = """
    CREATE TABLE IF NOT EXISTS Sports_info(
      current_quantity INTEGER,
      inserting_date TEXT,
      sport_id INTEGER,
      FOREIGN KEY(sport_id) REFERENCES Sport_type(sport_type_id)
    );
"""
        let createThirdTableString = """

    CREATE TABLE IF NOT EXISTS Sport_types(
      sport_type_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      sport_type_name VARCHAR(200) NOT NULL,
      UNIQUE(sport_type_name)
    );
"""

        let createQueries: [String] = [createSecondTableString, createThirdTableString]
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
        initialInsert()
    }
    
    private func createDatabase()-> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(path)
        print(filePath)
        var db: OpaquePointer? = nil
        print(filePath)
        if sqlite3_open(filePath.path, &db) != SQLITE_OK{
            print("An error occured")
            return nil
        }else{
            print("Database's been created: \(path)")
            return db
        }
    }
    
    private func initialInsert(){
        var insertStatement: OpaquePointer?
        let SQLQueryString =
        """
        INSERT OR IGNORE INTO Sport_types (sport_type_id, sport_type_name) VALUES
            (0, 'Push-ups'),
            (1, 'Sit-ups'),
            (2, 'Abs'),
            (3, 'Lunges'),
            (4, 'Pull-ups'),
            (5, 'Burpee')
        ;
        """
        if sqlite3_prepare_v2(database, SQLQueryString, -1, &insertStatement, nil) == SQLITE_OK{
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("Sucessfully inserted row")
            }
        }
        sqlite3_finalize(insertStatement)
    }
    
    public func fetchTodayData(ofSport: String) -> Int {
        //https://www.simpleswiftguide.com/how-to-return-multiple-values-from-function-in-swift/
        let currentDate = String(Date().ISO8601Format().prefix(10))
        var amountAccomplished = 0
        let sqlQuery: String =
        """
        SELECT SUM(current_quantity) FROM Sports_info WHERE sport_id =
        (SELECT sport_type_id from Sport_types WHERE sport_type_name = '\(ofSport)' AND inserting_date == '\(currentDate)');
        """
        var queryStatement: OpaquePointer?
        if sqlite3_prepare_v2(database, sqlQuery, -1, &queryStatement, nil) == SQLITE_OK{
            while(sqlite3_step(queryStatement) == SQLITE_ROW){
                amountAccomplished = Int(sqlite3_column_int(queryStatement, 0))
            }
        }
        sqlite3_finalize(queryStatement)
        return amountAccomplished
    }
    
    public func updateDatabase(amountAccomplished: Int, ofType: String, stringOfDate: String){
        var insertStatement: OpaquePointer?
        let sqlQueryString =
        """
        INSERT INTO Sports_info (current_quantity, inserting_date, sport_id) VALUES
        (
            \(amountAccomplished),
            '\(stringOfDate)',
            (SELECT sport_type_id FROM Sport_types WHERE sport_type_name == '\(ofType)')
        );
        """
        if sqlite3_prepare_v2(database, sqlQueryString, -1, &insertStatement, nil) == SQLITE_OK{
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("Sucessfully inserted row")
            }
        }else{
            print("ERROR")
        }
        sqlite3_finalize(insertStatement)
    }
    
    public func getActivityDuringWeek(ofType: String, datesArray: [String]) -> [Int]{
        var activityOfWeek: [Int] = []
        var queryStatement: OpaquePointer?
        for date in datesArray{
            var isZero = false
            var sqlQuueryString =
            """
            SELECT COUNT(current_quantity) FROM Sports_info WHERE sport_id =
            (SELECT sport_type_id from Sport_types WHERE sport_type_name = '\(ofType)'
            AND inserting_date == '\(date)');
            """
            if sqlite3_prepare_v2(database, sqlQuueryString, -1, &queryStatement, nil) == SQLITE_OK{
                while(sqlite3_step(queryStatement) == SQLITE_ROW){
                    let countOfRows = Int(sqlite3_column_int(queryStatement, 0))
                    if countOfRows == 0{
                        isZero = true
                    }
                }
            }
            if isZero{
                activityOfWeek.append(0)
            }else{
                sqlQuueryString =
                """
                SELECT SUM(current_quantity) FROM Sports_info WHERE sport_id =
                (SELECT sport_type_id from Sport_types WHERE sport_type_name ='\(ofType)'
                AND inserting_date == '\(date)');
                """
                if sqlite3_prepare_v2(database, sqlQuueryString, -1, &queryStatement, nil) == SQLITE_OK{
                    while(sqlite3_step(queryStatement) == SQLITE_ROW){
                        let amountOfAccomplished = Int(sqlite3_column_int(queryStatement, 0))
                        activityOfWeek.append(amountOfAccomplished)
                    }
                }
            }
        }
        sqlite3_finalize(queryStatement)
        
        return activityOfWeek
    }
    
    public func getActivity(ofDate: String) -> [SportDTO]{
        var dayActivity: [SportDTO] = []
        var queryStatement: OpaquePointer?
        let sqlQueryString: String =
        """
        SELECT current_quantity, inserting_date, sport_type_name
        FROM Sports_info, Sport_types WHERE inserting_date == '\(ofDate)' AND
        Sports_info.sport_id = Sport_types.sport_type_id;
        """
        if sqlite3_prepare_v2(database, sqlQueryString, -1, &queryStatement, nil) == SQLITE_OK{
            while(sqlite3_step(queryStatement) == SQLITE_ROW){
                let activity = Int(sqlite3_column_int(queryStatement,0))
                let date = String(cString: sqlite3_column_text(queryStatement, 1))
                let sportType = String(cString: sqlite3_column_text(queryStatement, 2))
                dayActivity.append(SportDTO(sportType: sportType, currentQuantity: activity, currentDate: date))
            }
        }
        return dayActivity
    }
}
