<%--
  Created by IntelliJ IDEA.
  User: robertoperezalcolea
  Date: 27/10/11
  Time: 09:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Simple GSP page</title>
      <meta name="layout" content="main"/>
  </head>

  <body>
  <div class="body">
      <div class="dialog">


  <table><tr><td>
      <g:link controller="twitter4jtest" action="messages" params="['tipo':'recibidos']">Recibidos</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="messages" params="['tipo':'enviados']">Enviados</g:link>

  </td></tr></table>
          <br><br>
       <g:form controller="twitter4jtest" action="sendMessage" method="POST">
    <p>Enviar un mensaje:</p>
    <label for="usuario">Usuario:</label><g:textField name="usuario"/><br/>
    <g:textArea name="text" rows="2" cols="80"></g:textArea><br/>
    <g:submitButton name="submit" value="Enviar mensaje"/>
</g:form>
  <br><br>
     <center>  <h1>${tipoMensajes}</h1>
</center>
          <table>

  <g:each in="${mensajes}" var="mensaje">
     <tr>
         <td>
            <img src="${mensaje.sender.profileImageUrl}">
         </td>
         <td>
             ${mensaje.sender.screenName} <br>
             ${mensaje.sender.name}<br>
             Mensaje: ${mensaje.text}<br>
             Fecha: ${mensaje.createdAt}

         </td>
     </tr>
  </g:each>
  </table>

  </div>
  </div>

  </body>
</html>