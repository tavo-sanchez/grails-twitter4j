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
      <g:link controller="twitter4jtest" action="timeline" params="['tipo':'home']">Home Time Line</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="timeline" params="['tipo':'user']">User Time Line</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="timeline" params="['tipo':'friends']">Friends Time Line</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="timeline" params="['tipo':'public']">Public Time Line</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="timeline" params="['tipo':'mentions']">Mentions Time Line</g:link>

  </td></tr></table>
      <br><br>
          <g:form controller="twitter4jtest" action="search" name="search">
    <g:textField name="query"/><br/>
    <g:submitButton name="submit" value="Buscar"/>
</g:form>
  <br><br>
     <center>  <h1>${tipoTimeLine}</h1>
</center>
          <table>

  <g:each in="${timeline}" var="tweet">
     <tr>
         <td>
             <g:if test="${tipoTimeLine != 'Búsqueda'}">
                 <img src="${tweet.user.profileImageUrl}">

             </g:if>
             <g:else>
                 <img src="${tweet.profileImageUrl}">

             </g:else>
         </td>
         <td>
      <g:if test="${tipoTimeLine != 'Búsqueda'}">

             ${tweet.user.screenName} "${tweet.user.name}"<br>
             ${tweet.text}<br>
             Creado en: ${tweet.createdAt}
            </g:if>
             <g:else>
                 ${tweet.fromUser}<br>
                 ${tweet.text}<br>
                 ${tweet.createdAt}
                 <g:link controller="twitter4jtest" action="follow" params="['user':tweet.fromUser]">Follow</g:link>
             </g:else>
         </td>
     </tr>

  </g:each>
  </table>

  </div>
  </div>

  </body>
</html>