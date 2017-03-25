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
        ResponseMaker.resultCustom(response: response, theDictionary: names)
    }

    class func getUser(request: HTTPRequest, _ response: HTTPResponse) {
        if let targetUser = request.urlVariables["username"]{
            var accountFound = false
            for i in 0..<names["accounts"]!.count {
                if (targetUser == names["accounts"]![i]["username"]!) {
                    let toReturn = ["accounts": names["accounts"]![i]]
                    ResponseMaker.resultCustom(response: response, theDictionary: toReturn)
                    accountFound = true
                    break
                }
            }
            if (!accountFound) {
                ResponseMaker.resultCustom(response: response, theDictionary: ["result": "no account"])
            }
        }
    }

    class func getUserPassword(request: HTTPRequest, _ response: HTTPResponse) {
        if let targetUser = request.urlVariables["username"], let targetPassword = request.urlVariables["password"]{
            for i in 0..<names["accounts"]!.count {
                if (targetUser == names["accounts"]![i]["username"]!) {
                    if (targetPassword == names["accounts"]![i]["password"]!) {
                        ResponseMaker.resultTrue(response: response)
                    }
                    else {
                        ResponseMaker.resultFalse(response: response)
                    }
                    break
                }
            }
        }
    }
}
