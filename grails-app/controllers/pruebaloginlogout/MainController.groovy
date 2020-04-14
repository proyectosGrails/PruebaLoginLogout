package pruebaloginlogout

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class MainController {

    def index() {
        def username = "santiago"
        [user: username]
        render view: "index"
    }
}
