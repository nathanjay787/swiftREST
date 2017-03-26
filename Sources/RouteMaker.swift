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
RouteMaker.swift

Class to add routes to the webserver
****************************************************************************/
class RouteMaker {
    /************************************************************************
     makeAllRoutes
     
     Adds all routes
    ************************************************************************/
    class func makeAllRoutes(theRoutes : inout Routes) {
        theRoutes.add(method: .get, uri: "/json/all", handler: Get.getAll)
        theRoutes.add(method: .get, uri: "/json/username/{username}", handler: Get.getUser)
        theRoutes.add(method: .get, uri: "/json/login/{username}/{password}", handler: Get.getUserPassword)
        theRoutes.add(method: .post, uri: "json/add", handler: Post.addUser)
        theRoutes.add(method: .put, uri: "json/{put_operation}", handler: Put.changeInfo)
        theRoutes.add(method: .delete, uri: "json/delete/{username}", handler: Delete.deleteAccount)
    }
}
