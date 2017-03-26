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
Post.swift

Class to handle POST requests
****************************************************************************/
public class Post {
    /************************************************************************
     addUser
     
     Adds a user account to the accounts dictionary and returns a JSON object
     indicating success
    ************************************************************************/    
    class func addUser(request: HTTPRequest, _ response: HTTPResponse) {
        if let newUser = request.param(name: "username"),
           let newEmail = request.param(name: "email"),
           let newPass = request.param(name: "password")
        {

           if (Validator.testRegexMatch(regexFor: "username", text: newUser)) {
                var found = false
                for i in 0..<names["accounts"]!.count {
                    if (newUser == names["accounts"]![i]["username"]){
                        found = true
                        break
                    }
                }
                if (!found && Validator.testRegexMatch(regexFor: "email", text: newEmail) && Validator.testRegexMatch(regexFor: "password", text: newPass)) {
                    names["accounts"]?.append(["username":newUser, "email":newEmail, "password":newPass])
                    ResponseMaker.resultTrue(response: response)
                }
                else {
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
