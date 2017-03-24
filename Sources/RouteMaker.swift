import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

class RouteMaker {
    class func makeAllRoutes(theRoutes : inout Routes) {
        theRoutes.add(method: .get, uri: "/json/all", handler: Get.getAll)
    }
}
