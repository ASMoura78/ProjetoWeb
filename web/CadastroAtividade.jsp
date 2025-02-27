<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Atividade</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <div class="cadastro-container">
            <h2>Cadastro de Atividade</h2>
            <%
                if (request.getAttribute("errorMessage") != null) {
                    out.println("<p class='message error'>" + request.getAttribute("errorMessage") + "</p>");
                }
            %>
            <form action="CadastrarAtividadeServlet" method="post">
                <label for="nomeMotorista">Nome do Motorista:</label>
                <select id="nomeMotorista" name="nome_motorista" required>
                    <option value="" disabled selected>Selecione o motorista</option>
                    <%
                        List<String> motoristas = (List<String>) request.getAttribute("motoristas");
                        if (motoristas != null) {
                            for (String nomeMotorista : motoristas) {
                                out.println("<option value='" + nomeMotorista + "'>" + nomeMotorista + "</option>");
                            }
                        } else {
                            out.println("<option value='' disabled>Erro ao carregar motoristas</option>");
                        }
                    %>
                </select><br><br>
                
                <label for="veiculo">Veículo:</label>
                <select id="veiculo" name="veiculo" required>
                    <option value="" disabled selected>Selecione o veículo</option>
                    <%
                        List<String> veiculos = (List<String>) request.getAttribute("veiculos");
                        if (veiculos != null) {
                            for (String veiculo : veiculos) {
                                out.println("<option value='" + veiculo + "'>" + veiculo + "</option>");
                            }
                        } else {
                            out.println("<option value='' disabled>Erro ao carregar veículos</option>");
                        }
                    %>
                </select><br><br>
                <label for="destino">Destino:</label>
                <input type="text" id="destino" name="destino" required><br><br>
                <label for="dataSaida">Data e Horário de Saída:</label>
                <input type="datetime-local" id="dataSaida" name="dataSaida" required><br><br>
                <label for="dataChegada">Data e Horário de Chegada:</label>
                <input type="datetime-local" id="dataChegada" name="dataChegada" required><br><br>
                <label for="quilometragemSaida">Quilometragem de Saída:</label>
                <input type="number" id="quilometragemSaida" name="quilometragemSaida" required><br><br>
                <label for="quilometragemChegada">Quilometragem de Chegada:</label>
                <input type="number" id="quilometragemChegada" name="quilometragemChegada" required><br><br>
                <label for="observacoes">Observações:</label>
                <textarea id="observacoes" name="observacoes" rows="4" cols="50"></textarea><br><br>
                <div class="button-container">
                    <button type="submit">Cadastrar</button>
                    <button type="button" onclick="window.location.href='main.jsp'">Voltar</button>
                </div>
            </form>
            <!-- Exibir mensagem de sucesso -->
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
                    out.println("<p class='message success'>" + message + "</p>");
                }
            %>
        </div>
    </body>
</html>




