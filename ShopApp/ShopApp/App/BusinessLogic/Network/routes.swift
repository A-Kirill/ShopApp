/*
import Vapor

func routes(_ app: Application) throws {
    
    //Auth
    app.get("login") { req -> String in
        return "{\"result\": 1,\"user\": {\"id_user\": 111,\"user_login\": \"Somebody\",\"user_name\": \"Kirill\",\"user_lastname\": \"Anisimov\"}}"
    }
    //Logout
    app.get("logout") { req -> String in
        return "{ \"result\": 1 }"
    }
    
    //SignUp
    app.get("registerUser") { req -> String in
        return "{ \"result\": 1, \"userMessage\": \"Регистрация прошла успешно!\" }"
    }
    
    //ProfileChange
    app.get("changeUserData") { req -> String in
        return "{ \"result\": 1 }"
    }
    
    //Catalog
    app.get("catalogData") { req -> String in
        return "[{\"id_product\": 123,\"product_name\": \"Ноутбук\",\"price\": 45600},{\"id_product\": 456,\"product_name\": \"Мышка\",\"price\": 1000},{\"id_product\": 222,\"product_name\": \"MacBook\",\"price\": 129000}]"
    }
    
    //Product
    app.get("getGoodById") { req -> String in
        return "{ \"result\": 1, \"product_name\": \"Ноутбук\", \"product_price\": 45600, \"product_description\": \"Мощный игровой ноутбук\"}"
    }
    
    //examp with params, http://127.0.0.1:8080/hello/Name
    app.get("hello", ":name") { req -> String in
        let name = req.parameters.get("name")!
        return "Hello, \(name)!"
    }
}
*/
