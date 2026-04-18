<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error — Inventario de Productos</title>
    <link rel="stylesheet" href="<c:url value="/css/estilos.css"/>">
</head>
<body>

<div class="container">
    <div class="error-box">

        <h1 class="error-titulo">Ocurrió un error</h1>

        <p class="error-mensaje">
            La operación no pudo completarse.
            Por favor verifica los datos e intenta de nuevo.
        </p>

        <%-- Muestra el mensaje de la excepción si existe --%>
        <c:if test="${not empty pageContext.exception}">
            <div class="error-detalle">
                    ${pageContext.exception.message}
            </div>
        </c:if>

        <a href="<c:url value="/productos"/>" class="btn-volver">
            ← Volver al listado
        </a>

    </div>
</div>

</body>
</html>
