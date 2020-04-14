package pruebaloginlogout

import com.app.auth.Role
import com.app.auth.User
import com.app.auth.UserRole

class BootStrap {

    static String ADMIN_USERNAME = "admin"

    def init = { servletContext ->

        def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
        def userRole = Role.findOrSaveWhere(authority: 'ROLE_USER')

//        def admin = User.findOrSaveWhere(username: 'admin', password: 'admin123', firstName: 'admin', lastName: 'ad', email: 'admin@admin.com')
//        def user = User.findOrSaveWhere(username: 'pepe', password: 'pepe123', firstName: 'pepe', lastName: 'daniel', email: 'pepe@user.com')

//        if(!admin.authorities.contains(adminRole)){
//            UserRole.create(admin,adminRole,true)
//        }
//
//        if(!user.authorities.contains(adminRole)){
//            UserRole.create(user,userRole,true)
//        }

        if (!User.findByUsername(ADMIN_USERNAME)) {
            def admin = new User(username: ADMIN_USERNAME, password: 'admin123', firstName: 'admin', lastName: 'ad', email: 'admin@admin.com')

            if (!admin.save()) {
                admin.errors.each {
                    println it
                }
            }

            UserRole.create(admin, adminRole, true)
        }

        if (!User.findByUsername("mans")) {
            def mans = new User(username: "mans", password: '123456', firstName: 'mans', lastName: 'ad', email: 'mans@mail.com')

            if (!mans.save()) {
                mans.errors.each {
                    println it
                }
            }

            UserRole.create(mans, userRole, true)
        }
//        def user = new User(username: 'pepe', password: 'pepe123', firstName: 'pepe', lastName: 'daniel', email: 'pepe@user.com')
    }
    def destroy = {
    }
}
