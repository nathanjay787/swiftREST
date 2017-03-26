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
Put.swift

Class to handle PUT requests
****************************************************************************/
public class Put {
    /************************************************************************
     changeInfo
     
     Updates an account with new information (username, password, email)
     Uses a variable name for the route
     Returns a JSON object indicating success
    ************************************************************************/
    class func changeInfo(request: HTTPRequest, _ response: HTTPResponse) {
        if let theUser = request.param(name: "username"),
           let newInfo = request.param(name: "newinfo"),
           let theChange = request.urlVariables["put_operation"]
        {
            var fieldToChange = ""
        
            switch theChange {
                case "change_password":
                    fieldToChange = "password"
                case "change_username":
                    fieldToChange = "username"
                case "change_email":
                    fieldToChange = "email"
                default:
                    print ("Bad URL")
                    return
            }
            if (Validator.testRegexMatch(regexFor: fieldToChange, text: newInfo) && Validator.testRegexMatch(regexFor: "username", text: theUser)){
                var found = false
                for i in 0..<names["accounts"]!.count {
                    if (theUser == names["accounts"]![i]["username"]){
                        found = true
                        names["accounts"]![i][fieldToChange] = newInfo
                        ResponseMaker.resultTrue(response: response)
                        break
                    }
                }
                if (!found) {
                    ResponseMaker.resultFalse(response: response)
                }
            }
        }
        else {
            ResponseMaker.resultBad(response: response)
        }
    }
}
