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
      <g:link controller="twitter4jtest" action="trends" params="['tipo':'current']">Current Trends</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="trends" params="['tipo':'daily']">Daily Trends</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="trends" params="['tipo':'available']">Available Trends</g:link>&nbsp;|&nbsp;
        <g:link controller="twitter4jtest" action="trends" params="['tipo':'weekly']">Weekly Trends</g:link>

  </td></tr></table>

  <br><br>
     <center>  <h1>${tipoTrends}</h1>
</center>
          <table>

  <g:each in="${trends}" var="trend">
     <tr>
         <td>
           ${trend}
         </td>
     </tr>

  </g:each>
  </table>

  </div>
  </div>

  </body>
</html>