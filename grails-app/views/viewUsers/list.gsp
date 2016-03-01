<%--
  Created by IntelliJ IDEA.
  User: P3502441
  Date: 1. 3. 2016
  Time: 10:17
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html"/>
    <meta name="layout" content="main">
    <title>List of Users</title>
</head>

<body>
    <div class="body">
        <g:if test="${flash.message}">
            <div class="message" style="display: block">${flash.message}</div>
        </g:if>
        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Country</th>
                <th>Age</th>
                <th>Actions</th>
            </tr>
            <g:each in="${users}" var="user">
                <tr>
                    <td>
                        ${user.firstName}
                    </td>
                    <td>
                        ${user.lastName}
                    </td>
                    <td>
                        ${user.country}
                    </td>
                    <td>
                        ${user.age}
                    </td>
                    <td>
                        <g:link controller="user" action="deleteByIdUser" params="${[id: user.id]}">Delete</g:link>
                        <g:link controller="user" action="editUser" params="${[id: user.id]}">Update</g:link>
                    </td>
                </tr>

            </g:each>
        </table>
    </div>
<g:link controller="user" action="registerAgain">Register Again</g:link>
<g:link controller="user" action="listOfUsers">Refresh</g:link>
<g:link controller="user" action="deleteListOfUsers">Delete All</g:link>

</body>
</html>