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

@WebServlet(name = "ListarVeiculosServlet", urlPatterns = {"/ListarVeiculosServlet"})
public class ListarVeiculosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        List<String> motoristas = new ArrayList<>();
        List<String> veiculos = new ArrayList<>();
        List<String> placas = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sqlMotoristas = "SELECT nome FROM cadastromotorista";
            String sqlVeiculos = "SELECT modelo FROM cadastroveiculo";
            String sqlPlacas = "SELECT placa FROM cadastroveiculo";
            
            PreparedStatement pstMotoristas = conn.prepareStatement(sqlMotoristas);
            PreparedStatement pstVeiculos = conn.prepareStatement(sqlVeiculos);
            PreparedStatement pstPlacas = conn.prepareStatement(sqlPlacas);
            
            ResultSet rsMotoristas = pstMotoristas.executeQuery();
            ResultSet rsVeiculos = pstVeiculos.executeQuery();
            ResultSet rsPlacas = pstPlacas.executeQuery();
            
            while (rsMotoristas.next()) {
                motoristas.add(rsMotoristas.getString("nome"));
            }
            
            while (rsVeiculos.next()) {
                veiculos.add(rsVeiculos.getString("modelo"));
            }
            while (rsPlacas.next()) {
                placas.add(rsPlacas.getString("placa"));
            }

            // Defina os atributos na requisição
            request.setAttribute("motoristas", motoristas);
            request.setAttribute("veiculos", veiculos);
            request.setAttribute("placas", placas);
            
            // Encaminhe para a página 'CadastroMultas.jsp'
            request.getRequestDispatcher("CadastroMultas.jsp").forward(request, response);

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
        return "Servlet para listar veículos cadastrados";
    }
}


