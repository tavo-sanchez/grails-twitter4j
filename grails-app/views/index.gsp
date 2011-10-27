<html>
<head>
    <title>Welcome to Grails</title>
    <meta name="layout" content="main"/>
    <style type="text/css" media="screen">

    #nav {
        margin-top: 20px;
        margin-left: 30px;
        width: 228px;
        float: left;

    }

    .homePagePanel * {
        margin: 0px;
    }

    .homePagePanel .panelBody ul {
        list-style-type: none;
        margin-bottom: 10px;
    }

    .homePagePanel .panelBody h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin-bottom: 10px;
    }

    .homePagePanel .panelBody {
        background: url(images/leftnav_midstretch.png) repeat-y top;
        margin: 0px;
        padding: 15px;
    }

    .homePagePanel .panelBtm {
        background: url(images/leftnav_btm.png) no-repeat top;
        height: 20px;
        margin: 0px;
    }

    .homePagePanel .panelTop {
        background: url(images/leftnav_top.png) no-repeat top;
        height: 11px;
        margin: 0px;
    }

    h2 {
        margin-top: 15px;
        margin-bottom: 15px;
        font-size: 1.2em;
    }

    #pageBody {
        margin-left: 280px;
        margin-right: 20px;
    }
    </style>
</head>

<body>
<div id="nav">
    <div class="homePagePanel">
        <div class="panelTop"></div>

        <div class="panelBody">
            <h1>Application Status</h1>
            <ul>
                <li>App version: <g:meta name="app.version"></g:meta></li>
                <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                <li>JVM version: ${System.getProperty('java.version')}</li>
                <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
            </ul>

            <h1>Installed Plugins</h1>
            <ul>
                <g:set var="pluginManager"
                       value="${applicationContext.getBean('pluginManager')}"></g:set>

                <g:each var="plugin" in="${pluginManager.allPlugins}">
                    <li>${plugin.name} - ${plugin.version}</li>
                </g:each>

            </ul>
        </div>

        <div class="panelBtm"></div>
    </div>
</div>

<div id="pageBody">
    <h1>Prueba de Concepto Plugin Twitter4j</h1>

    <p>El plug-in se basa en la blblioteca Twitter4j. <g:link url="http://twitter4j.org/en/index.jsp">http://twitter4j.org/</g:link>

        <br>
        <br><b>Pasos previos:</b> <br><br>
    <ul>
        <li>
            Ingresar al sitio web de Twitter. <a href="http://www.twitter.com">http://www.twitter.com</a>
        </li>
        <li>
            Autenticarse como usuario de Twitter
        </li>
        <li>
            Ingresar al link <a
                href="https://dev.twitter.com/apps/new">https://dev.twitter.com/apps/new</a> para registrar la aplicación
            <br><b>Nota:</b> Anotar el Consumer Key y Consumer Secret
        </li>

    </ul>

    <br><br>
    <b>Configuración de la aplicación</b><br><br>
    <ol>
        <li>
            Configurar la aplicación utilizando las pantallas de la misma.
            <br><br>
            <ul>
                <li>Ejecutar la aplicación e ingresar al controlador twitter4j<br>
                    <g:link controller="twitter4j"><g:createLink controller="twitter4j" absolute="true"/></g:link>
                </li>
                <li>
                    Ingresar las claves Consumer Key y Consumer Secret obtenidas y dar clic en el botón 'Request Pin'.
                </li>
                <li>
                    Dar clic en el link que se genera para autorizar la aplicación y copiar el pin obtenido.
                </li>
                <li>
                    Pegar el pin en la aplicación y dar clic en el botón 'Verify pin'.
                </li>
                <li>
                    A continuación se generará un bloque de código que se debe pegar en el archivo 'Config.groovy'. <br><br>
                    twitter {  <br>
                    &nbsp;&nbsp;&nbsp;disableTwitter4jController = false  // To avoid intruders to use controller alltogether. <br>
                    &nbsp;&nbsp;&nbsp;   'default' {   <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      debugEnabled = false <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthConsumerKey = 'C8jUVEdFANkjj0P9VgLA' <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthConsumerSecret = 'SDAP8yBKp6s8QS4yi7a5tjV2RNwsfeZaDX1mishUrY' <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthAccessToken = '73244856-lYDyVDVMT1RiFwi4GTjFSzWCCO6wjMVjCXBdPOYdX'  <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthAccessTokenSecret = '4EzvaV5KzK84N3C5gIk37Q77kZUNevLP49uJaUWhNck' <br>
                    &nbsp;&nbsp;&nbsp;      }  <br>
                    } <br><br>

                </li>
            </ul>
        </li>
        <li>
            Configurar la aplicación directamente en el 'Config.groovy'.
            <br><br>
            <ul>
                <li>Ingresar al sitio web de apps de developers de Twitter y autenticarse. <a
                        href="http://dev.twitter.com/apps">http://dev.twitter.com/apps</a></li>
                <li>En la configuración de la aplicación, anotar los valores de los siguientes campos:<br><br>
                    <ul><li>Consumer Key</li>
                        <li>Consumer Secret</li>
                        <li>Access Token</li>
                        <li>Access Token Secret</li></ul>
                    <br><br>
                    <img src="${resource(dir: 'images', file: 'app-config.png')}" alt="App twitter config" border="0"/>
                </li>
                <li>Ingresar el siguiente bloque de código en el archivo 'Config.groovy'.<br><br>
                    twitter {  <br>
                    &nbsp;&nbsp;&nbsp;disableTwitter4jController = false  // To avoid intruders to use controller alltogether. <br>
                    &nbsp;&nbsp;&nbsp;   'default' {   <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      debugEnabled = false <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthConsumerKey = 'C8jUVEdFANkjj0P9VgLA' <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthConsumerSecret = 'SDAP8yBKp6s8QS4yi7a5tjV2RNwsfeZaDX1mishUrY' <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthAccessToken = '73244856-lYDyVDVMT1RiFwi4GTjFSzWCCO6wjMVjCXBdPOYdX'  <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      OAuthAccessTokenSecret = '4EzvaV5KzK84N3C5gIk37Q77kZUNevLP49uJaUWhNck' <br>
                    &nbsp;&nbsp;&nbsp;      }  <br>
                    } <br><br></li>
            </ul>
        </li>
    </ol>        <br>
    <b>Ejemplos:</b><br><br>
    <ol>
        <li>Actualizar status de twitter (tweet)
            <br><br>
            <ul>
                <li>Ejecutar la aplicación.</li>
                <li>Ingresar al siguiente link: <g:link controller="twitter4j" action="status"><g:createLink
                        controller="twitter4j" action="status" absolute="true"/></g:link></li>
                <li>Ingresar un mensaje de prueba: 'Probando aplicación grails con conexión a twitter'. y dar clic en el botón 'Update Status'.</li>
                <li>Ingresar al sitio web de Twitter con la cuenta de usuario configurada para la aplicación y verificar que se ha realizado el tweet.<br><br>
                    <img src="${resource(dir: 'images', file: 'twitter-status-update.png')}" alt="App twitter config"
                         border="0"/>

                </li>
            </ul>
            <br>

        </li>
        <li>Obtener tweets (timeline)
            <br><br>
            <ul>
                <li>Ejecutar la aplicación.</li>
                <li>Ingresar a alguno de los siguientes links para probar la funcionalidad de obtener el time line:<br><br>
                    <ul><li>
                        <g:link controller="twitter4jtest" action="timeline"
                                params="['tipo':'home']">Home Time Line</g:link></li>
                        <li><g:link controller="twitter4jtest" action="timeline"
                                    params="['tipo':'user']">User Time Line</g:link></li>
                        <li><g:link controller="twitter4jtest" action="timeline"
                                    params="['tipo':'friends']">Friends Time Line</g:link></li>
                        <li><g:link controller="twitter4jtest" action="timeline"
                                    params="['tipo':'public']">Public Time Line</g:link></li>
                        <li><g:link controller="twitter4jtest" action="timeline"
                                    params="['tipo':'mentions']">Mentions Time Line</g:link>

                        </li></ul>

                </li>
            </ul>
            <br>

        </li>

        <li>Obtener Friends y Followers
            <br><br>
            <ul>
                <li>Ejecutar la aplicación.</li>
                <li>Ingresar a alguno de los siguientes links para probar la funcionalidad de obtener los Friends y Followers:<br><br>
                    <ul><li>
                        <g:link controller="twitter4jtest" action="profiles"
                                params="['tipo':'friends']">Friends</g:link></li>
                        <li><g:link controller="twitter4jtest" action="profiles"
                                    params="['tipo':'followers']">Followers</g:link></li>
                </ul>

                </li>
            </ul>
            <br>

        </li>

<li>Mensajes directos
            <br><br>
            <ul>
                <li>Ejecutar la aplicación.</li>
                <li>Ingresar a alguno de los siguientes links para probar de obtener mensajes directos recibidos y enviados:<br><br>
                    <ul><li>
                        <g:link controller="twitter4jtest" action="messages"
                                params="['tipo':'recibidos']">Recibidos</g:link></li>
                        <li><g:link controller="twitter4jtest" action="messages"
                                    params="['tipo':'enviados']">Enviados</g:link></li>
                </ul>

                </li>
            </ul>
            <br>

        </li>


        <li>Obtener Retweets y Favorites
            <br><br>
            <ul>
                <li>Ejecutar la aplicación.</li>
                <li>Ingresar a alguno de los siguientes links para probar la funcionalidad de obtener los retweets y favorites:<br><br>
                    <ul><li>
                        <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'rtbyme']">RTs by me</g:link></li>
                              <li> <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'rttofme']">RTs to me</g:link></li>
                              <li> <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'rtofme']">RTs of me</g:link></li>
                              <li> <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'favorites']">Favorites</g:link>  </li>

                        </ul>

                </li>
            </ul>
            <br>

        </li>
    </ol>

</div>
</body>
</html>
