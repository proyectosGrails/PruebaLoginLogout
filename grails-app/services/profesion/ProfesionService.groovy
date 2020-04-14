package profesion

import grails.gorm.services.Service

@Service(Profesion)
interface ProfesionService {

    Profesion get(Serializable id)

    List<Profesion> list(Map args)

    Long count()

    void delete(Serializable id)

    Profesion save(Profesion profesion)

}