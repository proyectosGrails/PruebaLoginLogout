<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
                <ul class="nav navbar-nav navegador">
                    <g:pageProperty name="page.nav" />
                    <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_USER">
                            <li><a >Hola <sec:username /></a></li>
                        </sec:ifAllGranted>

                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li><a class="text-center" href="/user/show/1">Hola <sec:username /></a></li>
                            <li class="dropdown opciones">
                                <a class="dropdown-toggle" data-toggle="dropdown" role="button" >Administrar<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/user/create">Crear Usuario</a></li>
                                    <li><a href="/user/index">Lista Usuarios</a></li>
                                    <li><a href="/role/create">Crear Rol</a></li>
                                    <li><a href="/role/index">Lista Roles</a></li>
                                </ul>
                            </li>
                        </sec:ifAllGranted>
                        <li class="opciones"><a href="/emailSend/index">Enviar Email</a></li>


                        <li class="log"> <g:link controller='logout'>Logout</g:link></li>


                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <li class="log"><a href="/login/auth">Sign Up</a></li>
                    </sec:ifNotLoggedIn>

                </ul>
            </div>
        </div>
    </div>

    <g:layoutBody/>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
