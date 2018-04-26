
<%--
 * edit.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="${requestURI }" modelAttribute="msg">


	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="sender"/>
	<form:hidden path="recipient"/>
	<form:hidden path="moment"/>
	<form:hidden path="body"/>
	<form:hidden path="priority"/>


	<form:label path="subject">
		<spring:message code="message.subject" />:
	</form:label>
	<form:input path="subject" readonly="true"/>
	<form:errors cssClass="error" path="subject" />
	<br />
	<br/>


	<form:label path="messageFolder">
		<spring:message code="message.messageFolder" />:
	</form:label>
	<form:select id="folders" path="messageFolder">
		<form:options items="${folders}" itemValue="id"
			itemLabel="name" />
	</form:select>
	<form:errors cssClass="error" path="messageFolder" />
	<br />
	<br/>

	

	<!-- Botones -->
	<acme:submit name="change" code="message.changefolder.link"/>

	<acme:cancel url="${requestURICancel}" code="message.cancel.link"/>

</form:form>