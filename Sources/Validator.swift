/****************************************************************************
Nathan Jasiukajc
swift JSON API server
2017-03-25
****************************************************************************/
import Foundation

/****************************************************************************
Validator.swift

Class to handle input validation
****************************************************************************/
class Validator {
    //Dictionary to define regexes for different types of input
    static let regexRepository = [
      "email": "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}",
      "username": "^[a-z0-9]{1,64}$",
      "password": "^.{8,32}$"
    ]

    /************************************************************************
     testRegexMatch
     
     Method to test if a given string matches a pre-made regular expression
     as defined in regexRepository

     regexRepository could probably be better as an enum but, ehh...
    ************************************************************************/
    class func testRegexMatch(regexFor: String, text: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regexRepository[regexFor]!, options: [])
            let nsString = NSString(string: text)
            let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: nsString.length))
            return results.count > 0
        }
        catch {
            return false
        }
    }
}
