import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

class RouteMaker {
    var getDepot = Get()
    static func makeAllRoutes(routes: inout Routes) {
        routes.add(method: .get, uri: "/json/all", handler: getDepot.getAll)
    }
}
