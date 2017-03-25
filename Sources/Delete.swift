import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

public class Delete {
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
    
    class func deleteAccount (request: HTTPRequest, _ response: HTTPResponse) {
        let userRegex = "^[a-z0-9]{1,64}$"
        let badUser = request.urlVariables["username"]!

        if (testMatch(regex: userRegex, text: badUser)) {
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
}
