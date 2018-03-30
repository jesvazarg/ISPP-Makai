<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<display:table name="requests" id="row" pagesize="5" requestURI="${requestURI}" class="displaytag">

	<jstl:set var="substrDescription" value="${fn:substring(row.description, 0, 40)}" />
	<spring:message code="request.description" var="descriptionHeader" />
	<display:column title="${descriptionHeader}" >
		<jstl:out value="${substrDescription}" />
		<jstl:if test="${fn:length(row.description)>40}">
			<jstl:out value="..." />
		</jstl:if>
	</display:column>
	<security:authorize access="hasRole('TRAINER')">
		<acme:column code="request.customer" property="customer.userAccount.username" sortable="true"/>
	</security:authorize>
	<acme:column code="request.tags" property="tags" sortable="true"/>
	<acme:column code="request.category" property="category.name" sortable="true" />
	
	
	<spring:message code="request.animal" var="animalHeader" />
	<spring:message code="request.none" var="none"/>
	<display:column title="${animalHeader}" >
		<jstl:if test="${row.animal != null}">
			<jstl:out value="${row.animal.name}" />
		</jstl:if>
		<jstl:if test="${row.animal == null}">
			<jstl:out value="${none}" />
		</jstl:if>
	</display:column>
	
	<display:column>
		<div class="btn-group">
			<acme:link image="eye" href="request/actor/display.do?requestId=${row.id}"/>
			<security:authorize access="hasRole('CUSTOMER')">
				<%-- <acme:link href="request/customer/edit.do?requestId=${row.id}" code="request.edit"/> --%>
				<jstl:set var="showTrade" value="${false}"/>
				<jstl:if test="${!requestsWithOffer.isEmpty()}">
					<jstl:forEach var="r" items="${requestsWithOffer}">
						<jstl:if test="${r.id == row.id}">
							<jstl:set var="showTrade" value="${true}"/>
						</jstl:if>
					</jstl:forEach>
				</jstl:if>
				<jstl:if test="${showTrade == true}">
					<acme:link href="offer/customer/list.do?requestId=${row.id}" code="request.list.offer" type="dark" image="deal"/>
				</jstl:if>
				
				<jstl:set var="showDelete" value="${true}"/>
				<jstl:if test="${!offersPendingReceipts.isEmpty()}">
					<jstl:forEach var="offer" items="${offersPendingReceipts}">
						<jstl:if test="${offer.request.id == row.id}">
							<jstl:set var="showDelete" value="${false}"/>
						</jstl:if>
					</jstl:forEach>
				</jstl:if>
				<jstl:if test="${showDelete == true}">
					<%-- <acme:link href="request/customer/edit.do?requestId=${row.id}" code="request.edit"/> --%>
					<acme:delete href="request/customer/delete.do?requestId=${row.id}" id="${row.id}"/>
				</jstl:if>
			</security:authorize>
			<security:authorize access="hasRole('TRAINER')">
				<acme:link href="offer/trainer/create.do?requestId=${row.id}" code="offer.create" image="deal" type="dark"/>
			</security:authorize>
		</div>
	</display:column>

</display:table>
<security:authorize access="hasRole('CUSTOMER')">
	<acme:link href="request/customer/create.do" code="request.create" type="success"/>
</security:authorize>