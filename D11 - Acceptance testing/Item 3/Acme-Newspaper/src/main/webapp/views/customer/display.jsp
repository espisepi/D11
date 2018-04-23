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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<display:table name="customer" class="displaytag"
  requestURI="${RequestUri}" id="row">
  
  <!-- Attributes -->
	
	<display:column>
	<B><spring:message code="customer.name" />:</B>
	<jstl:out value="${row.name}"></jstl:out>
	

	<p>
		<B><spring:message code="customer.surname" />:</B>
		<jstl:out value="${row.surname}"></jstl:out>
	</p>
		
	<p>
		<B><spring:message code="customer.postalAddress" />:</B>
		<jstl:out value="${row.postalAddress}"></jstl:out>
	</p>

	<p>
		<B><spring:message code="customer.phoneNumber" />:</B>
		<jstl:out value="${row.phone}"></jstl:out>
	</p>
	
	<p>
		<B><spring:message code="customer.emailAddress" />:</B>
		<jstl:out value="${row.email}"></jstl:out>
	</p>
	
</display:column>
  
</display:table>