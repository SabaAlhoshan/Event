//
//  File.swift
//  
//
//  Created by saba on 24/08/1444 AH.
//


import Foundation
import Fluent
import FluentPostgresDriver


struct CreatePerson: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>{
        
        database.schema("persons")
            .id()
            .field("name", .string)
            .field("email", .string)
            .field("phone", .int)
        
            .create()
        
        //columns
     

    }
    //undo
    func revert(on database: Database) -> EventLoopFuture<Void>{
        database.schema("persons").delete()
    }
}
