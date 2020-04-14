<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation" style="margin-top: 2em; margin-left: 2em; ">
    <ul>
        <li><a href="/">Regresar al Inicio</a></li>
        <li><a href="/user/index">Lista de usuarios</a></li>
    </ul>
</div>

<div id="create-user" class="content scaffold-create" role="main" style="display: flex ; margin-top: 4em">
    <h1 style="color: #122b40; font-size: 2em;border-bottom: none; margin-left: 5em; margin-top: 1em; margin-bottom: 1em "><i><b>Crear Usuario</b></i></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <form action="/user/save" method="post" style="border: 0.1em dashed; display: flex; flex-wrap: wrap; margin-left: 7em; justify-content: center">
        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="password">Contraseña
                    <span class="required-indicator">*</span>
                </label>
                <input type="password" name="password" required="" value="" id="password" style="border: 1px solid green; color: #1b6d85">
            </div>

            <div class="fieldcontain required">
                <label for="username">Nombre de usuario
                    <span class="required-indicator">*</span>
                </label>
                <input type="text" name="username" value="" required="" id="username" style="border: 1px solid green; color: #1b6d85">
            </div>

            <div class="fieldcontain required">
                <label for="firstName">Nombre
                    <span class="required-indicator">*</span>
                </label>
                <input type="text" name="firstName" value="" required="" id="firstName" style="border: 1px solid green; color: #1b6d85">
            </div>

            <div class="fieldcontain">
                <label for="passwordExpired">Password Expired</label><input type="hidden" name="_passwordExpired">
                <input type="checkbox" name="passwordExpired" id="passwordExpired">
            </div>

            <div class="fieldcontain">
                <label for="accountLocked">Account Locked</label><input type="hidden" name="_accountLocked">
                <input type="checkbox" name="accountLocked" id="accountLocked">
            </div>

            <div class="fieldcontain">
                <label for="accountExpired">Account Expired</label><input type="hidden" name="_accountExpired"><input
                    type="checkbox" name="accountExpired" id="accountExpired">
            </div>

            <div class="fieldcontain required">
                <label for="lastName">Apellido
                    <span class="required-indicator">*</span>
                </label>
                <input type="text" name="lastName" value="" required="" id="lastName" style="border: 1px solid green; color: #1b6d85">
            </div>

            <div class="fieldcontain required">
                <label for="email">Correo Electronico
                    <span class="required-indicator">*</span>
                </label>
                <input type="text" name="email" value="" required="" id="email" style="border: 1px solid green; color: #1b6d85">
            </div>

            <f:field property="profesion" bean="user"/>

            <div class="fieldcontain">
                <label for="enabled">Habilitar</label>
                <input type="hidden" name="_enabled"><input type="checkbox" name="enabled" checked="checked" id="enabled">
            </div>

        </fieldset>

            <input type="submit" name="create" value="Crear Usuario" style="margin-left: auto; margin-right: auto;font-size: 1.5em; margin-bottom: 1em ;border-radius: 0.3em ;color: white; background-color: gray; width: 40%">

    </form>
</div>
</body>
</html>
