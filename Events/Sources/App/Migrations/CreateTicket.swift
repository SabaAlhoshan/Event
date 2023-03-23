//
//  File.swift
//  
//
//  Created by saba on 24/08/1444 AH.
//


import Foundation
import Fluent
import FluentPostgresDriver


struct CreateTicket: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>{
        
        database.schema("tickets")
            .id()
            .field("event", .string)
            .field("date", .string)
            .field("price", .string)
            .field("person_id" , .uuid , .references("persons", "id"))
//            .field("ticket_id" , .int)
            .create()
        
        //columns
        
    }
    //undo
    func revert(on database: Database) -> EventLoopFuture<Void>{
        database.schema("tickets").delete()
    }
}

