<%--
 * list.jsp
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

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="messages" requestURI="${requestURI }" id="row">


	<!-- Attributes -->

	<spring:message code="message.format.date" var="pattern"></spring:message>
	<spring:message code="message.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}"
		format="${pattern }" />

	<spring:message code="message.subject" var="subjectHeader" />
	<display:column property="subject" title="${subjectHeader}" />
	
	<spring:message code="message.sender" var="senderHeader" />
	<display:column property="sender.name" title="${senderHeader}" />


</display:table>

