<%--
  Created by IntelliJ IDEA.
  User: P3502441
  Date: 29. 2. 2016
  Time: 13:28
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-type" content="text/html"/>
<meta name="layout" content="main">
<title>User Registration</title>
</head>
<body>
    <div class="body">
        <g:form action="save">
            <table>
                <input name="id" type="hidden" value="${user?.id}" />
                <tr>

                    <td>
                        <g:hasErrors bean="${user}" field="firstName">
                            <p style="color:red"><g:message error="${user.errors?.getFieldError('firstName')}" encodeAs="HTML"/></p>
                        </g:hasErrors>
                        <label for="firstName">First Name: </label>
                        <input id="firstName" name="firstName" type="text" value="${user?.firstName}"/>
                    </td>
                </tr>
                <tr><td>Last name:</td><td><input id="lastname" name="lastName" type="text" value="${user?.lastName}"/>
                </td></tr>
                <tr><td>Country:</td><td><input id="country" name="country" type="text" value="${user?.country}"></td>
                </tr>
                <tr><td>Age:</td><td><input id="age" name="age" type="text" value="${user?.age}"></td></tr>
                <tr><td colspan="2"><input value="Save" type="submit"/></td></tr>
            </table>
        </g:form>
    </div>

</body>
</html>
