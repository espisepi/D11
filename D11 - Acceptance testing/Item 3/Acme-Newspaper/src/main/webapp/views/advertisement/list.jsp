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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function confirmDelete(advertisementId) {
		confirm=confirm('<spring:message code="advertisement.confirm.delete"/>');
		if (confirm)
		  window.location.href ="advertisement/admin/delete.do?advertisementId=" + advertisementId;
		  else
			  window.location.href ="advertisement/admin/listAdvertisementWithTabooWord.do";
	}
</script>



<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="advertisements" requestURI="${requestURI}" id="row">

	<!--  EDIT 

	<security:authorize access="hasRole('USER')">
		<jstl:if test="${showButtonEdit}">
			<spring:message code="article.edit" var="Edit" />
			<display:column title="${Edit}" sortable="true">
				<jstl:if test="${row.draftMode==true}">
					<spring:url value="article/user/edit.do" var="editURL">
						<spring:param name="articleId" value="${row.id}" />
					</spring:url>
					<a href="${editURL}"><spring:message code="article.edit" /></a>
				</jstl:if>
			</display:column>
		</jstl:if>
	</security:authorize>
	
	<!-- DISPLAY 

	<security:authorize access="isAnonymous()">
		<spring:message code="article.display" var="Display" />
		<display:column title="${Display}" sortable="true">
			<spring:url value="article/display.do" var="editURL">
				<spring:param name="articleId" value="${row.id}" />
			</spring:url>
			<a href="${editURL}"><spring:message code="article.display" /></a>
		</display:column>
	</security:authorize>

	<security:authorize access="hasRole('USER')">
		<spring:message code="article.display" var="Display" />
		<display:column title="${Display}" sortable="true">
			<spring:url value="article/user/display.do" var="editURL">
				<spring:param name="articleId" value="${row.id}" />
			</spring:url>
			<a href="${editURL}"><spring:message code="article.display" /></a>
		</display:column>
	</security:authorize>

	<!-- 	DISPLAY PARA ADMIN

	<security:authorize access="hasRole('ADMIN')">
		<spring:message code="article.display" var="display" />
		<display:column title="${display}" sortable="true">
			<spring:url value="article/admin/display.do" var="displayURL">
				<spring:param name="articleId" value="${row.id }" />
			</spring:url>
			<a href="${displayURL}"><spring:message code="newspaper.display" /></a>
		</display:column>
	</security:authorize>

	<security:authorize access="hasRole('CUSTOMER')">
		<spring:message code="article.display" var="display" />
		<display:column title="${display}" sortable="true">
			<spring:url value="article/customer/display.do" var="displayURL">
				<spring:param name="articleId" value="${row.id }" />
			</spring:url>
			<a href="${displayURL}"><spring:message code="newspaper.display" /></a>
		</display:column>
	</security:authorize>
	-->
	


	<!-- ATRIBUTOS -->

	<spring:message code="advertisement.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />


	<spring:message code="advertisement.banner" var="bannerHeader" />
	<display:column property="banner" title="${bannerHeader}"
		sortable="true" />

	<spring:message code="advertisement.targetPage" var="targetPageHeader" />
	<display:column property="targetPage" title="${targetPageHeader}"
		sortable="true" />

	<spring:message code="advertisement.targetPage" var="targetPageHeader" />
	<display:column property="targetPage" title="${targetPageHeader}"
		sortable="true" />
		
	<!-- Boton de delete para el admin ya que puede borrar los advertisements que considere inapropiados-->
	<security:authorize access="hasRole('ADMIN')">
		<jstl:if test="${showDelete}">
			<spring:message code="advertisement.delete" var="deleteHeader" />
			<display:column title="${deleteHeader}" sortable="true">
				<input type="button" name="delete"
					value="<spring:message code="advertisement.delete" />"
					onclick="confirmDelete(${row.id});" />
			</display:column>
		</jstl:if>
	</security:authorize>

</display:table>