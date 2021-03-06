<%--
 * action-1.jsp
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
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<jstl:if test="${successMessage != null}">
	<div class="alert alert-success"><spring:message code="${successMessage}" /></div>
</jstl:if>

<form:form action="${RequestURI}" modelAttribute="trainerForm" enctype="multipart/form-data">
	<form:hidden path="id"/>
	
	<jstl:if test="${errorMessage != null}">
		<acme:error code="${errorMessage}"/>
	</jstl:if>
	
	<div class="row">
		<div class="col-md-5">
			<h3>
				<spring:message code="trainer.personalDetails" />
			</h3>
	
			<acme:textbox code="trainer.name" path="name" mandatory="true" />
			<acme:textbox code="trainer.surname" path="surname" mandatory="true" />
			<acme:input image="phone" code="trainer.phone" path="phone" mandatory="true" />
			<acme:input image="at" code="trainer.email" path="email" mandatory="true" />
			<acme:textbox code="trainer.nid" path="nid" mandatory="true" />
		</div>
		<div class="offset-md-1 col-md-5">
			<h3>
				<spring:message code="trainer.coordinates" />
			</h3>
	
			<acme:textbox code="coordinates.country" path="coordinates.country" mandatory="true" />
			<acme:textbox code="coordinates.state" path="coordinates.state" />
			<acme:textbox code="coordinates.province" path="coordinates.province" />
			<acme:textbox code="coordinates.city" path="coordinates.city" mandatory="true" />
			<acme:textbox code="coordinates.zipCode" path="coordinates.zip_code" mandatory="true" />
		</div>
		<div class="col-md-12">
		<br>
			<spring:message code="image.formats" var="formats" />
			<spring:message code="trainer.picture" var="picture" />
			<jstl:out value="${picture}"/>
			<form:input type="file" path="userImage" id="userImage" name="userImage" mandatory="true"
			class="form:input-large" enctype="multipart/form-data" code="trainer.picture"></form:input>
			<jstl:out value="${formats}"/>
			<jstl:if test="${imageError != null}">
				<acme:error code="${imageError}" type="danger"/>
			</jstl:if>

		</div>
		<br><br><br>
		<security:authorize access="isAnonymous()">
		<div class="col-md-5">
			<h3>
				<spring:message code="trainer.userAccountDetails" />
			</h3>
			<br />
			<acme:input image="user-xs" code="trainer.username" path="username" mandatory="true" />
			<acme:password image="lock1" code="trainer.password" path="password" mandatory="true" />
			<acme:password image="lock1" code="trainer.repeatPassword" path="repeatPassword" mandatory="true" />
		</div>
		</security:authorize>
		<div class="col-md-12">
			<acme:acceptUseTerms href="misc/privacyPolicy.do?sc=false" code="trainer.accept" path="acceptCondition" linkCode="trainer.conditions"
					mandatory="true" target="_blank" />
		</div>
	</div>
	<br><br>
	<acme:submit code="trainer.register" name="save" />
	<acme:cancel code="trainer.cancel" url="" />
	
</form:form>