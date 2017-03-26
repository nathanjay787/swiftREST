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
Delete.swift

Class to handle DELETE requests
****************************************************************************/
public class Delete {
    /************************************************************************
     deleteAccount
     
     Deletes an account from the accounts dictionary and returns a JSON
     object indicating success
    ************************************************************************/
    class func deleteAccount (request: HTTPRequest, _ response: HTTPResponse) {
        if let badUser = request.urlVariables["username"]
        {
            if (Validator.testRegexMatch(regexFor: "username", text: badUser)) {
                var found = false
                for i in 0..<names["accounts"]!.count {
                    if (badUser == names["accounts"]![i]["username"]){
                        found = true
                        names["accounts"]!.remove(at: i)
                        ResponseMaker.resultTrue(response: response)
                        break
                    }
                }
                if (!found) {
                    ResponseMaker.resultFalse(response: response)
                }
            }
            else {
                ResponseMaker.resultFalse(response: response)
            }
        }
        else {
            ResponseMaker.resultBad(response: response)
        }
    }
}
