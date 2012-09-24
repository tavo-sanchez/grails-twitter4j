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
      <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'rtbyme']">RTs by me</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'rttofme']">RTs to me</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'rtofme']">RTs of me</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="rtfav" params="['tipo':'favorites']">Favorites</g:link>

  </td></tr></table>

  <br><br>
     <center>  <h1>${tipoRtfav}</h1>
</center>
          <table>

  <g:each in="${tweets}" var="tweet">
      <tr>
              <td>
                 <img src="${tweet.user.profileImageUrl}">
              </td>
              <td>
                  ${tweet.user.screenName} "${tweet.user.name}"<br>
                  ${tweet.text}<br>
                  Creado en: ${tweet.createdAt}
              </td>
          </tr>


  </g:each>
  </table>

  </div>
  </div>

  </body>
</html>