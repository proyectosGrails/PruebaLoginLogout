<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Email Sender</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <script src="https://cdn.ckeditor.com/4.6.0/full-all/ckeditor.js"></script>
</head>
<body>
<div id="content" role="main">
    <section class="row colset-2-its">
        <g:if test="${flash.message}">
            <div class="message" role="alert">
                ${flash.message}
            </div>
        </g:if>
        <h2>Formulario Envio de correo electronico</h2>
        <g:form controller="emailSend" action="send" enctype="multipart/form-data">
            <div class="fieldcontain">
                <g:textField name="address" placeholder="tuemail@servidor.com" required="" />
            </div>
            <div class="fieldcontain">
                <g:textField name="subject" placeholder="Asunto" required="" />
            </div>

            <div class="fieldcontain">
                <g:textArea name="body" required="" />
            </div>
            <input type="file" name="attachment" />
            <fieldset>
                <g:submitButton name="send" value="Enviar" />
            </fieldset>

        </g:form>
        <a href="/">Volver al Inicio</a>
    </section>

</div>

<script>
    CKEDITOR.replace('body', {
        extraPlugins: 'codesnippet'
    });
</script>
</body>
</html>