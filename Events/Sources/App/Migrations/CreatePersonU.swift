//
//  File.swift
//
//
//  Created by saba on 24/08/1444 AH.
//


import Foundation
import Fluent
import FluentPostgresDriver


struct CreatePersonU: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>{
        
        database.schema("persons")
          
            .field("person_id" , .int , .references("person", "id"))
            .update()
        
        //columns
        
    }
    //undo
    func revert(on database: Database) -> EventLoopFuture<Void>{
        database.schema("persons").delete()
    }
}
