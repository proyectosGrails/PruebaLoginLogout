package profesion

import com.app.auth.User

class Profesion {

    String nombre

    static hasMany = [users: User]

    static constraints = {
        nombre(nullable:false, blank:false)
    }

    String toString(){
        nombre
    }


}
