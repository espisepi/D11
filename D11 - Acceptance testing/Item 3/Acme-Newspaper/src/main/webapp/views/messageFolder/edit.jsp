
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
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<form:form action="${requestURI }" modelAttribute="messageFolder">


	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="modifiable"/>
	<form:hidden path="actor"/>

	
	<B><acme:textbox code="messageFolder.name" path="name"/></B>
	<br />
	
	
	<!-- 	//BOTONES -->
	
	<acme:submit name="save" code="tabooWord.save"/>
	
	<jstl:if test="${messageFolder.id != 0 }">
	 	<input type="submit" name="delete"
			value="<spring:message code="messageFolder.delete" />"
			onclick="javascript: return confirm('<spring:message code="messageFolder.confirm.delete" />')" />&nbsp;
	</jstl:if>
	
	<acme:cancel url="welcome/index.do" code="tabooWord.cancel"/>
	<br />

	
</form:form>