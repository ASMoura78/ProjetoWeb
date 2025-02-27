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

@WebServlet(name = "CadastrarAtividadeServlet", urlPatterns = {"/CadastrarAtividadeServlet"})
public class CadastrarAtividadeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nomeMotorista = request.getParameter("nome_motorista");
        String veiculo = request.getParameter("veiculo");
        String destino = request.getParameter("destino");
        String dataSaida = request.getParameter("dataSaida");
        String dataChegada = request.getParameter("dataChegada");
        String quilometragemSaida = request.getParameter("quilometragemSaida");
        String quilometragemChegada = request.getParameter("quilometragemChegada");
        String observacoes = request.getParameter("observacoes");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO cadastroAtividade (nome_motorista, veiculo, destino, data_horario_saida, data_horario_chegada, km_saida, km_chegada, observacoes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, nomeMotorista);
            pst.setString(2, veiculo);
            pst.setString(3, destino);
            pst.setString(4, dataSaida);
            pst.setString(5, dataChegada);
            pst.setString(6, quilometragemSaida);
            pst.setString(7, quilometragemChegada);
            pst.setString(8, observacoes);
            pst.executeUpdate();

            request.setAttribute("message", "Atividade cadastrada com sucesso!");

            // Obter a lista de motoristas
            List<String> motoristas = new ArrayList<>();
            sql = "SELECT nome FROM cadastromotorista";
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                motoristas.add(rs.getString("nome"));
            }
            request.setAttribute("motoristas", motoristas);

            // Obter a lista de veículos
            List<String> veiculos = new ArrayList<>();
            sql = "SELECT modelo FROM cadastroveiculo";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                veiculos.add(rs.getString("modelo"));
            }
            request.setAttribute("veiculos", veiculos);

            request.getRequestDispatcher("CadastroAtividade.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erro ao carregar veículos: " + e.getMessage());
            request.getRequestDispatcher("CadastroAtividade.jsp").forward(request, response);
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
        return "Servlet para cadastrar atividades";
    }
}
