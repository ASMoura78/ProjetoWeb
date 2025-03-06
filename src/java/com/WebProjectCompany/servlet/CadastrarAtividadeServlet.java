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

@WebServlet(name = "CadastrarAtividadeServlet", urlPatterns = {"/CadastrarAtividadeServlet"})
public class CadastrarAtividadeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Captura os parâmetros do formulário
        String nome_motorista = request.getParameter("motorista");
        String veiculo = request.getParameter("veiculo"); // Novo campo
        String destino = request.getParameter("destino");
        String dataSaida = request.getParameter("dataSaida");
        String dataChegada = request.getParameter("dataChegada");
        String quilometragemSaida = request.getParameter("km_saida");
        String quilometragemChegada = request.getParameter("km_chegada");
        String observacoes = request.getParameter("observacoes");

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Query SQL atualizada para incluir o campo "veiculo"
            String sql = "INSERT INTO cadastroatividade (nome_motorista, veiculo, destino, data_horario_saida, data_horario_chegada, km_saida, km_chegada, observacoes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, nome_motorista);
            pst.setString(2, veiculo); // Novo campo
            pst.setString(3, destino);
            pst.setString(4, dataSaida);
            pst.setString(5, dataChegada);
            pst.setString(6, quilometragemSaida);
            pst.setString(7, quilometragemChegada);
            pst.setString(8, observacoes);
            // Execute a query
            pst.executeUpdate();

            // Mensagem de sucesso
            request.setAttribute("message", "Atividade cadastrada com sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
            // Mensagem de erro em caso de exceção
            request.setAttribute("errorMessage", "Erro ao cadastrar atividade. Por favor, tente novamente.");
        }

        // Redireciona de volta para a página de cadastro
        request.getRequestDispatcher("CadastroAtividade.jsp").forward(request, response);
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
