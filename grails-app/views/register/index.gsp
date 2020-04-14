
<%@ page import="com.app.auth.Role" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>Register</title>
</head>

<body>
<div class="row" style="display: flex; justify-content: center; margin-top: 6em">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">Registrese aquí</h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="register" method="POST" id="loginForm" autocomplete="off">
                    <div class="form-group">
                        <label for="role">Role</label>
                        <g:select class="form-control" name="role.id"
                                  from="${com.app.auth.Role.list()}"
                                  optionKey="id" value="${params['role.id']}"/>
                    </div>

                    <div class="form-group">
                        <label for="username">Nombre de usuario</label>
                        <input type="text" placeholder="Tu Nombre de usuario" class="form-control" name="username" value="${params.username}" id="username" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Contraseña</label>
                        <input type="password" placeholder="Your password" class="form-control" name="password" id="password"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Comfirmar contraseña</label>
                        <input type="password" placeholder="Re-enter password" class="form-control" name="repassword" id="repassword"/>
                    </div>

                    <div class="form-group">
                        <label for="email">Correo Electronico</label>
                        <input type="text" placeholder="Tu Correo" class="form-control" name="email" value="${params.email}" id="email" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="firstname">Nombre</label>
                        <input type="text" placeholder="Tu Nombre" class="form-control" name="firstName" value="${params.firstName}" id="firstname" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="lastname">Apellido</label>
                        <input type="text" placeholder="Tu apellido" class="form-control" name="lastName" value="${params.lastName}" id="lastname" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="profesion">Profesion</label>
                        <g:select class="form-control" name="profesion.id"
                                  from="${profesion.Profesion.list()}"
                                  optionKey="id" value="${params['profesion.id']}"/>

                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Registrarse</button>
                    <hr class="my-4">
                    <p>¿Ya tienes una cuenta? <g:link controller="login" action="auth">Iniciar Sesión</g:link></p>


                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['username'].focus();
    });
</script>
</body>
</html>