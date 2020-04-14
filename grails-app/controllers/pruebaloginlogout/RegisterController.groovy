package pruebaloginlogout

import com.app.auth.Role
import com.app.auth.User
import com.app.auth.UserRole

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import profesion.Profesion

@Transactional
@Secured('permitAll')
class RegisterController {

    static allowedMethods = [register: "POST"]

    def index() { }

    def register() {
        println params
        if(!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "index"
            return
        } else {
            def user = new User(username: params.username, password: params.password, firstName: params.firstName, lastName: params.lastName, email: params.email, profesion: params.profesion)
            def role = Role.get(params['role.id'])
            def profesion = Profesion.get(params['profesion.id'])
            try {
                if (!user.save()) {
                    user.errors.each {
                        println it
                    }
                }
                println user
                println role
                if(user && role) {
                    user.save()
                    UserRole.create user, role, profesion

                    UserRole.withSession {
                        it.flush()
                        it.clear()
                    }

                    flash.message = "You have registered successfully. Please login."
                    redirect controller: "login", action: "auth"
                } else {
                    println "No encuentro rol"
                    flash.message = "Register failed"
                    render view: "index"
                    return
                }
            } catch (ValidationException e) {
                flash.message = "Register Failed"
                redirect action: "index"
                return
            }
        }
    }
}
