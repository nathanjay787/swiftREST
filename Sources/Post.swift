import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

public class Post {
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
    
    class func addUser(request: HTTPRequest, _ response: HTTPResponse) {
        let newUser = request.param(name: "username")!
        let newEmail = request.param(name: "email")!
        let newPass = request.param(name: "password")!

        let userRegex = "^[a-z0-9]{1,64}$"
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let passRegex = "^.{8,32}$"

        if (testMatch(regex: userRegex, text: newUser)) {
            var found = false
            for i in 0..<names["accounts"]!.count {
                if (newUser == names["accounts"]![i]["username"]){
                    found = true
                    break
                }
            }
            if (!found && testMatch(regex: emailRegex, text: newEmail) && testMatch(regex: passRegex, text: newPass)) {
            
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
}
