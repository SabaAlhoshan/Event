import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "" ,database: "eve"), as: .psql)

    
    
    

    app.migrations.add(CreatePerson())

    app.migrations.add(CreateTicket())


    // register routes
    try app.autoMigrate().wait()
    
    
    //register routs
    try routes(app)
   
}
