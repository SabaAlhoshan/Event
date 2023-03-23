//
//  File.swift
//  
//
//  Created by saba on 24/08/1444 AH.
//



import Foundation
import Fluent
import Vapor
import FluentPostgresDriver


//singular

final class Person : Model, Content{
   

 
    static let schema = "persons" 
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "phone")
    var phone: Int
    
    @Children(for: \.$person_id)
    var ticketaa : [Ticket]
    
    init() {}
     
    
    init(id: UUID? = nil , name: String , email: String , phone: Int) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        
    }
}



