<%--
 * action-1.jsp
 *
 * Copyright (C) 2013 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<div>

	<ul>
		<li><b><spring:message code="notification.moment" />:</b> <jstl:out
				value="${notification.moment}" /></li>

		<li><b><spring:message code="notification.reason" />:</b> <jstl:out
				value="${notification.reason}" /></li>

		<li><b><spring:message code="notification.description" />:</b> <jstl:out
				value="${notification.description}" /></li>


	</ul>
	
	<acme:link href="notification/actor/list.do" code="notification.goBack"/>

</div>

