package profesion

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ProfesionServiceSpec extends Specification {

    ProfesionService profesionService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Profesion(...).save(flush: true, failOnError: true)
        //new Profesion(...).save(flush: true, failOnError: true)
        //Profesion profesion = new Profesion(...).save(flush: true, failOnError: true)
        //new Profesion(...).save(flush: true, failOnError: true)
        //new Profesion(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //profesion.id
    }

    void "test get"() {
        setupData()

        expect:
        profesionService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Profesion> profesionList = profesionService.list(max: 2, offset: 2)

        then:
        profesionList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        profesionService.count() == 5
    }

    void "test delete"() {
        Long profesionId = setupData()

        expect:
        profesionService.count() == 5

        when:
        profesionService.delete(profesionId)
        sessionFactory.currentSession.flush()

        then:
        profesionService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Profesion profesion = new Profesion()
        profesionService.save(profesion)

        then:
        profesion.id != null
    }
}
