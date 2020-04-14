package profesion

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
@Secured(['ROLE_ADMIN'])
class ProfesionController {

    ProfesionService profesionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond profesionService.list(params), model:[profesionCount: profesionService.count()]
    }

    def show(Long id) {
        respond profesionService.get(id)
    }

    def create() {
        respond new Profesion(params)
    }

    def save(Profesion profesion) {
        if (profesion == null) {
            notFound()
            return
        }

        try {
            profesionService.save(profesion)
        } catch (ValidationException e) {
            respond profesion.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'profesion.label', default: 'Profesion'), profesion.id])
                redirect profesion
            }
            '*' { respond profesion, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond profesionService.get(id)
    }

    def update(Profesion profesion) {
        if (profesion == null) {
            notFound()
            return
        }

        try {
            profesionService.save(profesion)
        } catch (ValidationException e) {
            respond profesion.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'profesion.label', default: 'Profesion'), profesion.id])
                redirect profesion
            }
            '*'{ respond profesion, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        profesionService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'profesion.label', default: 'Profesion'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesion.label', default: 'Profesion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
