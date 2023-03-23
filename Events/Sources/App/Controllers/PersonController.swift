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
//struct PersonController: RouteCollection {
//    func boot(routes: Vapor.RoutesBuilder) throws {
//
//        // allows us to get data
//        let persons = routes.grouped("persons")
//        persons.get(use: index)
//        persons.post(use: create)
//        persons.put(use: update)
//        persons.delete(":id", use: delete)
//
//    }
//    //this is the get
//    // ----- /event route
//    func index(req: Request) throws -> EventLoopFuture<[person]> {
//        return person.query(on: req.db).all()
//    }
//
//    //this is the post
//    // func allows us to add data
//    //this is the post / person route
//
//    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        let persons = try req.content.decode(person.self)
//        return persons.save(on:req.db).transform(to: .ok)
//    }
//
//
//
//    func update(req: Request) async throws -> HTTPStatus {
//        let new_p = try req.content.decode(person.self)
//        guard let person = try await person.find(new_p.id, on: req.db) else {
//            throw Abort(.notFound)
//        }
//        person.name = new_p.name
//        try await person.save(on: req.db)
//
//        return .ok
//
//            }
//
//
//    // delete request /person /id route
//    func delete(req: Request) async throws -> HTTPStatus{
//        guard let person = try await person.find(req.parameters.get("id"), on: req.db)else{
//            throw Abort(.notFound)
//
//        }
//        try await person.delete(on: req.db)
//        return .ok
//}
//
//
//    }
//
    
    

//put request / person route
// this is update func
//    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        let new_p = try req.content.decode(person.self)
//
//        return person.find(new_p.id,  on: req.db)
//            .unwrap(or: Abort(.notFound)) // unwrap or not found the data
//            .flatMap {
//                old_p in
//                return new_p.update(on: req.db).transform(to: .ok)
//            } // abdullah func for update
//    }

    
    






//////////////////////////////////////////////////////
//    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        let persons = try req.content.decode(person.self)
//        return person.find (persons.id, on: req.db)
//            .unwrap (or: Abort (.notFound) )
//            .flatMap {
//        $0.name = persons.name
//        return $0.update(on: req.db).transform(to: .ok)
//
//            }
//    }
//





import Fluent
import Vapor
import FluentPostgresDriver

struct PersonController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        // crud opreations
        let persons = routes.grouped("persons")
        persons.get(use: index)
        persons.post(use: create)
        persons.put(use: update)
        persons.delete(":id", use: delete)
        
    }
    //this is the get
    // ----- /event route
    func index(req: Request) throws -> EventLoopFuture<[Person]> {
        return Person.query(on: req.db).all()
    }
    
    //this is the post
    // func allows us to add data
    //this is the post / person route
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let persons = try req.content.decode(Person.self)
        return persons.save(on:req.db).transform(to: .ok)
    }
    
    

    
   //  this is update func (name)
        func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
            let new_p = try req.content.decode(Person.self)
            return Person.find(new_p.id,  on: req.db)
                .unwrap(or: Abort(.notFound)) // unwrap or not found the data
                .flatMap {
//                    old_e in
                    $0.name = new_p.name
                    $0.email = new_p.email
                    $0.phone = new_p.phone
                    
                    return $0.update(on: req.db).transform(to: .ok)
                } // abd func for update
        }

    // delete request /person /id route
    func delete(req: Request) async throws -> HTTPStatus{
        guard let person = try await Person.find(req.parameters.get(":id"), on: req.db)else{
            throw Abort(.notFound)
            
        }
        try await person.delete(on: req.db)
        return .ok
}

    
    }
    
