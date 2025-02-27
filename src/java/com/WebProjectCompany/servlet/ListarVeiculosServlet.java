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

        List<String> veiculos = new ArrayList<>();
        List<String> placas = new ArrayList<>();
        List<String> motoristas = new ArrayList<>();
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT modelo FROM cadastroveiculo";
            String sqlPlacas = "SELECT placa FROM cadastromultas";
            String sqlMotoristas = "SELECT nome FROM cadastromotorista";
            
            PreparedStatement pst = conn.prepareStatement(sql);
            PreparedStatement pstPlacas = conn.prepareStatement(sqlPlacas);
            PreparedStatement pstMotoristas = conn.prepareStatement(sqlMotoristas);
            
            ResultSet rs = pst.executeQuery();
            ResultSet rsPlacas = pstPlacas.executeQuery();
            ResultSet rsMotoristas = pstMotoristas.executeQuery();

            while (rs.next()) {
                veiculos.add(rs.getString("modelo"));
            }
            
            while (rsPlacas.next()) {
                placas.add(rsPlacas.getString("placa"));
            }

             while (rsMotoristas.next()) {
                motoristas.add(rsMotoristas.getString("nome")); 
            }
             
            // Defina o atributo 'veiculos' na requisição
            request.setAttribute("veiculos", veiculos);
            request.setAttribute("placas", placas);
            request.setAttribute("motoristas", motoristas);
            
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


