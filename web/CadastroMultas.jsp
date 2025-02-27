<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Multas</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script src="script.js" defer></script>
    </head>
    <body>
        <div class="cadastro-container">
            <h2>Cadastro de Multas</h2>
            <form action="CadastrarMultaServlet" method="post">

                <label for="nome_motorista_infrator">Nome do Motorista Infrator:</label>
                <select type="text" id="nome_motorista_infrator" name="nome_motorista_infrator" required>
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
                <label for="placa">Placa:</label>
                <select id="placa" name="placa" required>
                    <option value="" disabled selected>Selecione a placa</option>
                    <%
                        List<String> placas = (List<String>) request.getAttribute("placas");
                        if (placas != null) {
                            for (String placa : placas) {
                                out.println("<option value='" + placa + "'>" + placa + "</option>");
                            }
                        } else {
                            out.println("<option value='' disabled>Erro ao carregar placas</option>");
                        }
                    %>
                </select><br><br>

                <label for="data_hora_infracao">Data e Hora da Infração:</label>
                <input type="datetime-local" id="data_hora_infracao" name="data_hora_infracao" required><br><br>
                <label for="local_infracao">Local da Infração:</label>
                <input type="text" id="local_infracao" name="local_infracao" required><br><br>
                <label for="descricao_infracao">Descrição da Infração:</label>
                <textarea id="descricao_infracao" name="descricao_infracao" rows="4" cols="50" required></textarea><br><br>
                <div class="button-container">
                    <button type="submit">Cadastrar</button>
                    <button type="button" onclick="window.location.href = 'main.jsp'">Voltar</button>
                </div>
            </form>
            <!-- Botão para alternar entre claro e escuro -->
            <button type="button" onclick="toggleTheme()">Alternar Claro/Escuro</button>
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





