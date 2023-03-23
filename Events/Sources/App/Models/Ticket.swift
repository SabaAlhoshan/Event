//
//  File.swift
//
//
//  Created by saba on 23/08/1444 AH.
//

import Foundation
import Fluent
import Vapor
import FluentPostgresDriver
//singular
final class Ticket : Model, Content{
   
    
 
    static let schema = "tickets"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "event")
    var event: String
    
    @Field(key: "date")
    var date: String
    
    
    @Field(key: "price")
    var price: String
    
    
    @Parent(key: "person_id")
    var person_id : Person
    
//    
//    @Field(key : "ticketid")
//    var ticketid : Int
//    
    init() {}
    
   
     
    init(id: UUID? = nil , event: String , date: String , price: String ,person_id : UUID) {
        self.id = id
        self.event = event
        self.date = date
        self.price = price
        self.person_id.id = person_id
//        self.ticketid = ticketid
    
    }
}
