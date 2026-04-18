<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-card {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 2rem;
            width: 100%;
            max-width: 380px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .login-header {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .login-header h1 {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 4px;
        }

        .login-header p {
            font-size: 13px;
            color: #6b7280;
        }

        .error-box {
            background-color: #fef2f2;
            border: 1px solid #fca5a5;
            border-radius: 8px;
            padding: 10px 14px;
            margin-bottom: 1rem;
            font-size: 13px;
            color: #b91c1c;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 500;
            color: #374151;
            margin-bottom: 6px;
        }

        .form-group input {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            color: #1a1a1a;
            background: #ffffff;
            outline: none;
            transition: border-color 0.2s;
        }

        .form-group input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.15);
        }

        .btn-login {
            width: 100%;
            padding: 10px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-top: 0.5rem;
        }

        .btn-login:hover {
            background-color: #1d4ed8;
        }

        .hint {
            text-align: center;
            font-size: 12px;
            color: #9ca3af;
            margin-top: 1rem;
        }
    </style>
</head>
<body>

<div class="login-card">

    <div class="login-header">
        <h1>Inventario de Productos</h1>
        <p>Ingresa tus credenciales para continuar</p>
    </div>

    <%-- Muestra el error si las credenciales son incorrectas --%>
    <c:if test="${not empty errorLogin}">
        <div class="error-box">
            <c:out value="${errorLogin}"/>
        </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">

        <div class="form-group">
            <label for="username">Usuario</label>
            <input type="text"
                   id="username"
                   name="username"
                   placeholder="Ej: admin"
                   value="<c:out value="${param.username}"/>"
                   required>
        </div>

        <div class="form-group">
            <label for="password">Contraseña</label>
            <input type="password"
                   id="password"
                   name="password"
                   placeholder="••••••••"
                   required>
        </div>

        <button type="submit" class="btn-login">Iniciar sesión</button>

    </form>

    <p class="hint">admin / Admin123! &nbsp;·&nbsp; viewer / View456!</p>

</div>

</body>
</html>