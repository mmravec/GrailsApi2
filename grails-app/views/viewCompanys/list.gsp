<%--
  Created by IntelliJ IDEA.
  User: P3502441
  Date: 2. 3. 2016
  Time: 12:32
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html"/>
    <meta name="layout" content="main">
    <title>List of Companys</title>
</head>

<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message" style="display: block">${flash.message}</div>
    </g:if>
    <table>
        <tr>
            <th>Company Name</th>
            <th>Address</th>
            <th>About Us</th>
        </tr>
        <g:each in="${companys}" var="company">
            <tr>
                <td>
                    ${company?.nameCompany}
                </td>
                <td>
                    ${company?.address}
                </td>
                <td>
                    ${company?.aboutUs}
                </td>
                <td>
                    <g:link controller="user" action="deleteByIdCompany" params="${[id: company.id]}">Delete</g:link>
                    <%--<g:link controller="user" action="editUser" params="${[id: user.id]}">Update</g:link>--%>
                  </td>
      </tr>

  </g:each>
</table>
</div>
<g:link controller="company" action="registerAgain">Register Again</g:link>
<g:link controller="company" action="listOfCompanys">Refresh</g:link>
<%--<g:link controller="company" action="deleteListOfCompanys">Delete All</g:link>--%>

</body>
</html>