<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Atividade</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="stylesheet" href="dark-mode.css" id="dark-mode-style" disabled>
        <link rel="stylesheet" href="theme-switch.css">
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
                <label for="nome_motorista">Nome do Motorista:</label>
                <select id="nome_motorista" name="motorista" required>
                    <option value="" disabled selected>Selecione o motorista</option>
                    <%
                        List<String> motoristas = (List<String>) request.getAttribute("motoristas");
                        if (motoristas != null) {
                            for (String motorista : motoristas) {
                                out.println("<option value='" + motorista + "'>" + motorista + "</option>");
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
                <label for="km_saida">Quilometragem de Saída:</label>
                <input type="number" id="km_saida" name="km_saida" required><br><br>
                <label for="km_chegada">Quilometragem de Chegada:</label>
                <input type="number" id="km_chegada" name="km_chegada" required><br><br>
                <label for="observacoes">Observações:</label>
                <textarea id="observacoes" name="observacoes" rows="4" cols="50"></textarea><br><br>
                <button type="submit">Cadastrar</button>
                <button type="button" onclick="window.location.href = 'main.jsp'">Voltar</button>
            </form>
            </form>
            <!-- Botão para alternar entre temas claro e escuro -->
            <div class="theme-switch-wrapper">
                <input type="checkbox" id="theme-switch">
                <div class="display">
                    <label for="theme-switch" title="Mudar Tema Claro/Escuro">
                        <div class="circle">
                            <svg class="sun" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 2.25a.75.75 0 0 1 .75.75v2.25a.75.75 0 0 1-1.5 0V3a.75.75 0 0 1 .75-.75ZM7.5 12a4.5 4.5 0 1 1 9 0 4.5 4.5 0 0 1-9 0ZM18.894 6.166a.75.75 0 0 0-1.06-1.06l-1.591 1.59a.75.75 0 1 0 1.06 1.061l1.591-1.59ZM21.75 12a.75.75 0 0 1-.75.75h-2.25a.75.75 0 0 1 0-1.5H21a.75.75 0 0 1 .75.75ZM17.834 18.894a.75.75 0 0 0 1.06-1.06l-1.59-1.591a.75.75 0 1 0-1.061 1.06l1.59 1.591ZM12 18a.75.75 0 0 1 .75.75V21a.75.75 0 0 1-1.5 0v-2.25A.75.75 0 0 1 12 18ZM7.758 17.303a.75.75 0 0 0-1.061-1.06l-1.591 1.59a.75.75 0 0 0 1.06 1.061l1.591-1.59ZM6 12a.75.75 0 0 1-.75.75H3a.75.75 0 0 1 0-1.5h2.25A.75.75 0 0 1 6 12ZM6.697 7.757a.75.75 0 0 0 1.06-1.06l-1.59-1.591a.75.75 0 0 0-1.061 1.06l1.59 1.591Z" />
                            </svg>
                            <svg class="moon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                            <path fill-rule="evenodd" d="M9.528 1.718a.75.75 0 0 1 .162.819A8.97 8.97 0 0 0 9 6a9 9 0 0 0 9 9 8.97 8.97 0 0 0 3.463-.69.75.75 0 0 1 .981.98 10.503 10.503 0 0 1-9.694 6.46c-5.799 0-10.5-4.7-10.5-10.5 0-4.368 2.667-8.112 6.46-9.694a.75.75 0 0 1 .818.162Z" clip-rule="evenodd" />
                            </svg>
                        </div>
                    </label>
                </div>
            </div>
            <!-- Exibir mensagem de sucesso -->
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
                    out.println("<p class='message success'>" + message + "</p>");
                }
            %>
        </div>
        <script src="script.js"></script> <!-- Referência ao script externo -->
    </body>
</html>




