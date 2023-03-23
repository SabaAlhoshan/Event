import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    
//    app.get { req async in
//        "It works!"
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }

   
  
     
    //route name
    app.post("person"){ req -> EventLoopFuture<Person> in
                                              //model
    let eve = try req.content.decode(Person.self)
    return eve.create(on: req.db).map {eve}
    }
//    try app.register(collection: PersonController())

//    
    app.post("tickets"){ req -> EventLoopFuture<Ticket> in
                                              //model
    let eve = try req.content.decode(Ticket.self)
    return eve.create(on: req.db).map {eve}
    }
    
    func readAllt (req:Request) throws -> EventLoopFuture<[Ticket]>{
        Ticket.query(on: req.db).all()
    }
    func readAllp (req:Request) throws -> EventLoopFuture<[Person]>{
        Person.query(on: req.db).all()
    }

    try app.register(collection: TicketsController())
 
    try app.register(collection: PersonController())
}
    


