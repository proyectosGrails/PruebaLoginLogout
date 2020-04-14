package com.app.auth

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic
import org.hibernate.annotations.Cascade
import profesion.Profesion

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    static belongsTo = [profesion: Profesion]
    String username
    String password
    String firstName
    String lastName
    String email

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        profesion nullable: true
    }

    static mapping = {
	    password column: '`password`'
    }

    String toString() {
        username
    }
}
