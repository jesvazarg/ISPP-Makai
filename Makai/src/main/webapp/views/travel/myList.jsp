<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<security:authorize access="hasAnyRole('PROFESSIONAL','CUSTOMER')">
<display:table name="travels" id="row" requestURI="${requestURI}" class="displaytag">

	<acme:column code="travel.origin" property="origin.city" />
	<acme:column code="travel.destination" property="destination.city" />
	<acme:column code="travel.startMoment" property="startMoment" />
	<acme:column code="travel.endMoment" property="endMoment" />
	<acme:column code="travel.animalSeats" property="animalSeats" />
	<acme:column code="travel.humanSeats" property="humanSeats" />
	
	<display:column>
		<div class="btn-group">
			<acme:link href="travel/display.do?travelId=${row.id}" code="travel.display"/>
			<acme:link href="travel/edit.do?travelId=${row.id}" code="travel.edit" type="warning"/>
			<acme:delete href="travel/delete.do?travelId=${row.id}" code="travel.delete" id="${row.id}"/>
		</div>
	</display:column>
	
		
</display:table>
	<acme:link href="travel/create.do" code="travel.create" type="success"/>
</security:authorize>

