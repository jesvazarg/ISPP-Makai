<%--
 * submit.tag
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@ tag language="java" body-content="empty" %>

<%-- Taglibs --%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<%-- Attributes --%> 

<%@ attribute name="name" required="true" %> 
<%@ attribute name="code" required="true" %>
<%@ attribute name="image" required="false" %>
<%@ attribute name="style" required="false" %>
<%@ attribute name="type" required="false" %>

<jstl:if test="${image == null}">
	<jstl:set var="image" value="save" />
</jstl:if>	
<jstl:if test="${type == null}">
	<jstl:set var="type" value="info" />
</jstl:if>	
	
<%-- Definition --%>

<button type="submit" name="${name}" class="btn btn-${type} btn-lg ${style}">
	<img class="icon-button" src="images/${image}.png" height="25px"/>
	<spring:message code="${code}" />
</button>
