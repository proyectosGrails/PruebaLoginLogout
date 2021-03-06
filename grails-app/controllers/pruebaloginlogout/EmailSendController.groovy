package pruebaloginlogout

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class EmailSendController {

    def index() { }

    def send() {
        def multipartFile = request.getFile('attachment')

        sendMail {
            multipart true
            to params.address
            subject params.subject
            html params.body
            if(multipartFile && !multipartFile.empty) {
                File tmpFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + multipartFile.getOriginalFilename());
                multipartFile.transferTo(tmpFile);
                attach tmpFile
            }
        }

        flash.message = "Message sent at "+new Date()
        redirect action:"index"
    }
}
