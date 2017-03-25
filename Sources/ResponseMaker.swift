import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

public class ResponseMaker {
    class func responseError(response: HTTPResponse) {

        do {
            try response.setBody(json: ["result": "Error"])
            response.setHeader(.contentType, value: "application/json")
            response.completed()
        }
        catch {
            response.setBody(string: "Error handling request: \(error)")
            response.completed()
        }
    }
    
    class func resultTrue(response: HTTPResponse) {
        
        do {
            try response.setBody(json: ["result": "true"])
            response.setHeader(.contentType, value: "application/json")
            response.completed()
        }
        catch {
            responseError(response: response)
        }
    }

    class func resultFalse(response: HTTPResponse) {
        
        do {
            try response.setBody(json: ["result": "false"])
            response.setHeader(.contentType, value: "application/json")
            response.completed()
        }
        catch {
            responseError(response: response)
        }
    }

    class func resultCustom(response: HTTPResponse, theDictionary: Dictionary<String, Array<Dictionary<String, String>>>) {
        do {
            try response.setBody(json: theDictionary)
                response.setHeader(.contentType, value: "application/json")
                response.completed()
        
        } 
        catch {
            responseError(response: response)
        }
    }

    class func resultCustom(response: HTTPResponse, theDictionary: Dictionary<String, Dictionary<String, String>>) {
        do {
            try response.setBody(json: theDictionary)
                response.setHeader(.contentType, value: "application/json")
                response.completed()
        
        } 
        catch {
            responseError(response: response)
        }
    }

    class func resultCustom(response: HTTPResponse, theDictionary: Dictionary<String, String>) {
        do {
            try response.setBody(json: theDictionary)
                response.setHeader(.contentType, value: "application/json")
                response.completed()
        
        } 
        catch {
            responseError(response: response)
        }
    }
}
