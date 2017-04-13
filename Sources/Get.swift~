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
Get.swift

Class to handle GET requests
****************************************************************************/
public class Get {
    /************************************************************************
     getAll
     
     Returns a JSON object with all information for every account
    ************************************************************************/
    class func getAll(request: HTTPRequest, _ response: HTTPResponse) {
        ResponseMaker.resultCustom(response: response, theDictionary: names)
    }

    /************************************************************************
     getUser
     
     Returns a JSON object with all information for 1 account
    ************************************************************************/
    class func getUser(request: HTTPRequest, _ response: HTTPResponse) {
        if let targetUser = request.urlVariables["username"]
        {
            var accountFound = false
            for i in 0..<names["accounts"]!.count {
                if (targetUser == names["accounts"]![i]["username"]!) {
                    let toReturn = ["accounts": names["accounts"]![i]]
                    ResponseMaker.resultCustom(response: response, theDictionary: toReturn)
                    accountFound = true
                    break
                }
                if (!accountFound) {
                    ResponseMaker.resultCustom(response: response, theDictionary: ["result": "no account"])
                }
            }
        }
        else {
            ResponseMaker.resultBad(response: response)
        }
    }

    /************************************************************************
     getUserPassword
     
     Returns a JSON object indicating if a correct username and password was
     submitted
    ************************************************************************/
    class func getUserPassword(request: HTTPRequest, _ response: HTTPResponse) {
        if let targetUser = request.urlVariables["username"],
           let targetPassword = request.urlVariables["password"]
        {
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
         else {
            ResponseMaker.resultBad(response: response)
        }
    }
}
