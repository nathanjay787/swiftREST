import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

public class Get {
    init(){}
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
}
