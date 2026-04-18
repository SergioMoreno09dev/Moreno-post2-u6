<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- i18n: idioma desde sesión --%>
<fmt:setLocale value="${sessionScope.locale != null ? sessionScope.locale : 'es'}"/>
<fmt:setBundle basename="messages"/>

<!DOCTYPE html><html lang="es"><head>
<meta charset="UTF-8">
<title><fmt:message key="${empty producto ? 'form.titulo.nuevo' : 'form.titulo.editar'}"/></title>
<link rel="stylesheet" href="<c:url value="/css/estilos.css"/>">
</head><body>

<h1><fmt:message key="${empty producto ? 'form.titulo.nuevo' : 'form.titulo.editar'}"/></h1>

<form method="post" action="<c:url value="/productos"/>">

    <%-- Errores generales --%>
    <c:if test="${not empty errores}">
        <div class="alert-error">
            <ul><c:forEach var="e" items="${errores}"><li>${e.value}</li></c:forEach></ul>
        </div>
    </c:if>

    <c:if test="${not empty producto}">
        <input type="hidden" name="id"    value="${producto.id}">
        <input type="hidden" name="accion" value="actualizar">
    </c:if>
    <c:if test="${empty producto}">
        <input type="hidden" name="accion" value="guardar">
    </c:if>

    <%-- Nombre --%>
    <label><fmt:message key="form.nombre"/>:
        <input type="text" name="nombre"
               value="<c:out value="${not empty nombre ? nombre : producto.nombre}"/>"
               class="${not empty errores.nombre ? 'input-error' : ''}">
        <c:if test="${not empty errores.nombre}">
            <span class="campo-error">${errores.nombre}</span>
        </c:if>
    </label>

    <%-- Categoría --%>
    <label><fmt:message key="form.categoria"/>:
        <input type="text" name="categoria"
               value="<c:out value="${not empty categoria ? categoria : producto.categoria}"/>"
               class="${not empty errores.categoria ? 'input-error' : ''}">
        <c:if test="${not empty errores.categoria}">
            <span class="campo-error">${errores.categoria}</span>
        </c:if>
    </label>

    <%-- Precio --%>
    <label><fmt:message key="form.precio"/>:
        <input type="number" name="precio" step="0.01" min="0"
               value="<c:out value="${not empty precio ? precio : producto.precio}"/>"
               class="${not empty errores.precio ? 'input-error' : ''}">
        <c:if test="${not empty errores.precio}">
            <span class="campo-error">${errores.precio}</span>
        </c:if>
    </label>

    <%-- Stock --%>
    <label><fmt:message key="form.stock"/>:
        <input type="number" name="stock" min="0"
               value="<c:out value="${not empty stock ? stock : producto.stock}"/>"
               class="${not empty errores.stock ? 'input-error' : ''}">
        <c:if test="${not empty errores.stock}">
            <span class="campo-error">${errores.stock}</span>
        </c:if>
    </label>

    <button type="submit">
        <fmt:message key="${empty producto ? 'btn.guardar' : 'btn.actualizar'}"/>
    </button>
    <a href="<c:url value="/productos"/>"><fmt:message key="btn.cancelar"/></a>

</form>
</body></html>