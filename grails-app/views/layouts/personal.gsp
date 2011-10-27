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


          <table>

  <g:each in="${profiles}" var="profile">
     <tr>
         <td>
            <img src="${profile.profileImageUrl}">
         </td>
         <td>
             ${profile.screenName} <br>
             ${profile.name}<br>
             ${profile.location}<br>
             ${profile.description}   <br> <br>

             <g:link controller="twitter4jtest" action="follow" params="['user':profile.screenName]">Follow</g:link>
             <g:link controller="twitter4jtest" action="unfollow" params="['user':profile.screenName]">Unfollow</g:link>

         </td>
     </tr>
  </g:each>
  </table>

  </div>
  </div>

  </body>
</html>