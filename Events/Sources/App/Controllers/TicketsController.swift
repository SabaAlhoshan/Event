//
//  File.swift
//  
//
//  Created by saba on 24/08/1444 AH.
//
//
//import Fluent
//import Vapor
//import FluentPostgresDriver
//
//struct TicketsController: RouteCollection {
//func boot(routes: Vapor.RoutesBuilder) throws {
//
//let tickets = routes.grouped("tickets")
//    tickets.get(use: index)
//    tickets.post(use: create)
//}
//// ----- /event route
//func index(req: Request) throws -> EventLoopFuture<[ticket]> {
//return ticket.query(on: req.db).all()
//}
//
//    // func allows us to add data
//   //this is the post / person route
//
//    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        let tickets = try req.content.decode(ticket.self)
//        return tickets.save(on:req.db).transform(to: .ok)
//    }
//
//}
//




import Fluent
import Vapor
import FluentPostgresDriver

struct TicketsController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        // allows us to get data
        let tickets = routes.grouped("tickets")
        tickets.get(use: index)
        tickets.post(use: create)
        tickets.put(use: update)
        tickets.delete(":id", use: delete)
        
    }
    //this is the get
    // ----- /event route
    func index(req: Request) throws -> EventLoopFuture<[Ticket]> {
        return Ticket.query(on: req.db).all()
    }
    
    //this is the post
    // func allows us to add data
    //this is the post / person route
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let tickets = try req.content.decode(Ticket.self)
        return tickets.save(on:req.db).transform(to: .ok)
    }
    
    
 
//    func update(req: Request) async throws -> HTTPStatus {
//        let new_e = try req.content.decode(event.self)
//        guard let event = try await event.find(new_e.id, on: req.db) else {
//            throw Abort(.notFound)
//        }
//        event.name = new_e.name
//        try await event.save(on: req.db)
//
//        return .ok
//
//            }
//
    
   //  this is update func
        func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
            let new_t = try req.content.decode(Ticket.self)
    
            return Ticket.find(new_t.id,  on: req.db)
                .unwrap(or: Abort(.notFound)) // unwrap or not found the data
                .flatMap {
//                    old_e in
                    $0.event = new_t.event
                    $0.date = new_t.date
                    $0.price = new_t.price
                    $0.person_id = new_t.person_id
                    return $0.update(on: req.db).transform(to: .ok)
                } // abdullah func for update
        }
    
    // delete request /person /id route
    func delete(req: Request) async throws -> HTTPStatus{
        guard let ticket = try await Ticket.find(req.parameters.get(":id"), on: req.db)else{
            throw Abort(.notFound)
            
        }
        try await ticket.delete(on: req.db)
        return .ok
}

    
    }
    
