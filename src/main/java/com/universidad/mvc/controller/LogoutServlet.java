package com.universidad.mvc.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // 1. Obtener la sesión actual SIN crear una nueva
        HttpSession session = req.getSession(false);

        // 2. Si existe, destruirla
        if (session != null) {
            session.invalidate();
        }

        // 3. Redirigir al login
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}