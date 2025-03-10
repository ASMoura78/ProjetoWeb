package com.WebProjectCompany.servlet;

import com.WebProjectCompany.db.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ListarMotoristasServlet", urlPatterns = {"/ListarMotoristasServlet"})
public class ListarMotoristasServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (Connection conn = DatabaseConnection.getConnection()) {
            List<String> motoristas = new ArrayList<>();
            List<String> veiculos = new ArrayList<>();
            String sqlMotoristas = "SELECT nome FROM cadastromotorista";
            String sqlVeiculos = "SELECT modelo FROM cadastroveiculo";
            PreparedStatement pstMotoristas = conn.prepareStatement(sqlMotoristas);
            PreparedStatement pstVeiculos = conn.prepareStatement(sqlVeiculos);
            ResultSet rsMotoristas = pstMotoristas.executeQuery();
            ResultSet rsVeiculos = pstVeiculos.executeQuery();
            while (rsMotoristas.next()) {
                motoristas.add(rsMotoristas.getString("nome"));
            }
            request.setAttribute("motoristas", motoristas);

            while (rsVeiculos.next()) {
                veiculos.add(rsVeiculos.getString("modelo"));
            }
            request.setAttribute("veiculos", veiculos);
            
            request.getRequestDispatcher("CadastroAtividade.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar motoristas: " + e.getMessage());
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
        return "Servlet para listar motoristas";
    }
}
