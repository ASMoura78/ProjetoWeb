package com.WebProjectCompany.servlet;

import com.WebProjectCompany.db.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CadastrarMotoristaServlet", urlPatterns = {"/CadastrarMotoristaServlet"})
public class CadastrarMotoristaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String cnh = request.getParameter("cnh");
        String categoria = request.getParameter("categoria");
        String cursos = request.getParameter("cursos");

        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement pst = conn.prepareStatement("INSERT INTO cadastromotorista (nome, cpf, cnh, categoria, cursos) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, nome);
            pst.setString(2, cpf);
            pst.setString(3, cnh);
            pst.setString(4, categoria);
            pst.setString(5, cursos);
            pst.executeUpdate();

            HttpSession session = request.getSession();
            session.setAttribute("message", "Motorista cadastrado com sucesso!");

            response.sendRedirect("CadastroMotorista.jsp"); // Redireciona de volta para a página de cadastro
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}




