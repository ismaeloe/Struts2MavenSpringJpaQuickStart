<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>Hola Mundo</h2>
	    <br/>
		<div style="width: 300px;border-style: solid">
			<p>Person Data</p>
			<s:form action="save" validate="false" acceptcharset="utf-8">
			    <s:textfield id="id" name="person.id" cssStyle="display:none"/>
				<s:textfield id="firstName" label="Fisrt Name" name="person.firstName"/>
				<s:textfield id="lastName" label="Last Name" name="person.lastName"/>
				<!--s:submit theme="ajax" targets="persons" notifyTopics="/save"/ -->
            <s:submit id="cmdSave" name="cmdSave" value="Grabar"/>
			</s:form>
		</div>
</body>
</html>