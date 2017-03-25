import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

class RouteMaker {
    class func makeAllRoutes(theRoutes : inout Routes) {
        theRoutes.add(method: .get, uri: "/json/all", handler: Get.getAll)
        theRoutes.add(method: .get, uri: "/json/username/{username}", handler: Get.getUser)
        theRoutes.add(method: .get, uri: "/json/login/{username}/{password}", handler: Get.getUserPassword)
        theRoutes.add(method: .post, uri: "json/add", handler: Post.addUser)
        theRoutes.add(method: .put, uri: "json/{put_operation}", handler: Put.changeInfo)
    }
}
