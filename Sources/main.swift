/****************************************************************************
Nathan Jasiukajc
swift JSON API server
2017-03-25
****************************************************************************/

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

var names = ["accounts":[
    ["username":"cbcdiver", "email":"c@d.com", "password":"pencil99"],
    ["username":"dogs", "email":"a@b.com", "password":"pencil99"]
]]

let server = HTTPServer()
server.serverPort = 8080
server.documentRoot = "webroot"

var routes = Routes()

RouteMaker.makeAllRoutes(theRoutes: &routes)

server.addRoutes(routes)

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
