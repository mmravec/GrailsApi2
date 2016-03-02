<%--
  Created by IntelliJ IDEA.
  User: P3502441
  Date: 2. 3. 2016
  Time: 12:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html"/>
    <meta name="layout" content="main">
    <title>Company Register</title>
</head>


<body>
<div class="body">
    <g:form action="save">
        <table>
            <input name="id" type="hidden" value="${company?.id}" />
            <tr>
                <td>
                    <g:hasErrors bean="${company}" field="nameCompany">
                        <p style="color:red"><g:message error="${company.errors?.getFieldError('nameCompany')}" encodeAs="HTML"/></p>
                    </g:hasErrors>
                    <label for="nameCompany">Company Name: </label>
                    <input id="nameCompany" name="nameCompany" type="text" value="${company?.nameCompany}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <g:hasErrors bean="${company}" field="address">
                        <p style="color:red"><g:message error="${company.errors?.getFieldError('address')}" encodeAs="HTML"/></p>
                    </g:hasErrors>
                    <label for="address">Address</label>
                    <input id="address" name="address" type="text" value="${company?.address}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <g:hasErrors bean="${company}" field="aboutUs">
                        <p style="color:red"><g:message error="${company.errors?.getFieldError('aboutUs')}" encodeAs="HTML"/></p>
                    </g:hasErrors>
                    <label for="aboutUs">About Us</label>
                    <input id="aboutUs" name="aboutUs" type="text" value="${company?.aboutUs}"/>
                </td>
            </tr>

            <tr><td colspan="2"><input value="Save" type="submit"/></td></tr>
        </table>
    </g:form>
</div>

</body>
</html>