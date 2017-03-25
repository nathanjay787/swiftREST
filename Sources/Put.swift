import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

public class Put {
    //init(){}
    //let names = ["accounts":
    //    [
    //        ["username":"cbcdiver", "email":"c@d.com", "password":"pencil99"],
    //        ["username":"dogs", "email":"a@b.com", "password":"pencil99"]
    //    ]
    //]
    class func testMatch(regex: String, text: String) -> Bool {
        do {
            let regex = try RegularExpression(pattern: regex, options: [])
            let nsString = NSString(string: text)
            let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: nsString.length))
            return results.count > 0
        }
        catch {
            return false
        }
    }
    
    class func changeInfo(request: HTTPRequest, _ response: HTTPResponse) {
        let theUser = request.param(name: "username")!
        let newInfo = request.param(name: "newinfo")!
        let theChange = request.urlVariables["put_operation"]!

        let userRegex = "^[a-z0-9]{1,64}$"
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let passRegex = "^.{8,32}$"

        var regexToTest = ""
        var fieldToChange = ""
        
        switch theChange {
            case "change_password":
                regexToTest = passRegex
                fieldToChange = "password"
            case "change_username":
                regexToTest = userRegex
                fieldToChange = "username"
            case "change_email":
                regexToTest = emailRegex
                fieldToChange = "email"
            default:
                print ("Bad URL")
                return
        }

        if (testMatch(regex: regexToTest, text: newInfo) && testMatch(regex: userRegex, text: theUser)) {
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
        else {
            ResponseMaker.resultFalse(response: response)
        }
    }
}
