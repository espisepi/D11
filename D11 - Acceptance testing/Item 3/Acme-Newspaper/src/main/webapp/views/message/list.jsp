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
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<script type="text/javascript">
	function confirmDelete(messageId) {
		confirm=confirm('<spring:message code="message.confirm.delete"/>');
		if (confirm)
		  window.location.href ="message/user/delete.do?messageId=" + messageId;
		  else
			  window.location.href ="message/user/list.do";
	}
</script>

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

	
	<spring:message code="message.delete.link" var="deleteHeader" />
		<display:column title="${deleteHeader}" sortable="true">
			<input type="button" name="delete"
				value="<spring:message code="message.delete.link" />"
				onclick="confirmDelete(${row.id});" />
		</display:column>

	<spring:message code="message.changefolder.link" var="Move" />	
	<display:column title="${Move}" sortable="true">

		<spring:url value="message/user/changeFolder.do" var="changeURL">
			<spring:param name="messageId" value="${row.id}" />
		</spring:url>
		<a href="${changeURL}"><spring:message code="message.changefolder.link" /></a>
		
		</display:column>


</display:table>

