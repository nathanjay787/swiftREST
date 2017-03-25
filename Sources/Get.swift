import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

public class Get {
    //init(){}
    //let names = ["accounts":
    //    [
    //        ["username":"cbcdiver", "email":"c@d.com", "password":"pencil99"],
    //        ["username":"dogs", "email":"a@b.com", "password":"pencil99"]
    //    ]
    //]
    class func getAll(request: HTTPRequest, _ response: HTTPResponse) {
        do {
            try response.setBody(json: names)
                response.setHeader(.contentType, value: "application/json")
                response.completed()
        
        } 
        catch {
            response.setBody(string: "Error handling request: \(error)")
            response.completed()
        }
    }

    class func getUser(request: HTTPRequest, _ response: HTTPResponse) {
        if let targetUser = request.urlVariables["username"]{
            for i in 0..<names["accounts"]!.count {
                if (targetUser == names["accounts"]![i]["username"]!) {
                    var toReturn = ["accounts": names["accounts"]![i]]
                    do {
                        try response.setBody(json: toReturn)
                        response.setHeader(.contentType, value: "application/json")
                        response.completed()
                    }
                    catch {
                        response.setBody(string: "Error handling request: \(error)")
                        response.completed()
                    }
                    break
                }
            }
        }
    }

    class func getUserPassword(request: HTTPRequest, _ response: HTTPResponse) {
        if let targetUser = request.urlVariables["username"], let targetPassword = request.urlVariables["password"]{
            for i in 0..<names["accounts"]!.count {
                if (targetUser == names["accounts"]![i]["username"]!) {
                    var toReturn = ["result": "false"]
                    if (targetPassword == names["accounts"]![i]["password"]!){
                        toReturn = ["result": "true"]
                    }
                    do {
                        try response.setBody(json: toReturn)
                        response.setHeader(.contentType, value: "application/json")
                        response.completed()
                    }
                    catch {
                        response.setBody(string: "Error handling request: \(error)")
                        response.completed()
                    }
                    break
                }
            }
        }
    }
}
