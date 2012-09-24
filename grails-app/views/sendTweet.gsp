<%@ page import="grails.test.twitter4j.Evento" %>
<table>
<g:form controller="twitter4jtest" action="sendTweet">
      <tr class="prop">
                    <td valign="top" class="name">
                        <label for="evento"><g:message code="evento.propietario.label"
                                                            default="evento"/></label>
                    </td>
                    <td valign="top" >
                        <g:select name="evento.id" from="${Evento.list()}" optionKey="id"
                                  />
                    </td>
                </tr>
    <tr class="prop">
                    <td valign="top" class="name">
                        <label for="text"><g:message code="evento.propietario.label"
                                                            default="text"/></label>
                    </td>
                    <td valign="top" >
                        <g:textField name="statusMessage" id="statusMessage"/>
                    </td>
                </tr>
             <g:actionSubmit value="Enviar" action="sendTweet"/>
    </g:form>
</table>