/****************************************************************************
Nathan Jasiukajc
swift JSON API server
2017-03-25
****************************************************************************/

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

/****************************************************************************
ResponseMaker.swift

Class to handle creating JSON objects for various requests
****************************************************************************/
public class ResponseMaker {
    /************************************************************************
     responceError
     
     Returns a JSON object indicating an error handling a response
    ************************************************************************/
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

    /************************************************************************
     resultTrue

     Returns a JSON object stating a request was successfully processed
    ************************************************************************/
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

    /************************************************************************
     resultFalse

     Sends a JSON object stating a request was not successfully processed
    ************************************************************************/
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
    
    /************************************************************************
     resultCustom

     This method has 3 overloads. The intent is to be able to create any
     JSON object fromusing any Dictionary. An earlier version atempted to use
     a single resultCustom method using some form of generic Collection in
     place of explicitly declaring the type that is passed. For now, this
     works, but it would be better to find a proper fix.
    ************************************************************************/
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

    /************************************************************************
     resultBad

     Returns a JSON object stating an invalid request was made
    ************************************************************************/
    class func resultBad(response: HTTPResponse){
        do {
            try response.setBody(json: ["result": "bad_request"])
            response.setHeader(.contentType, value: "application/json")
            response.completed()
        }
        catch {
            responseError(response: response)
        }
    }
}
