<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Motorista</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script type="text/javascript">
            // Função para limpar os campos do formulário
            function clearForm() {
                document.getElementById("nome").value = "";
                document.getElementById("cpf").value = "";
                document.getElementById("cnh").value = "";
                document.getElementById("categoria").value = "";
                document.getElementById("cursos").value = "";
            }
            // Função para formatar o CPF
            function formatCPF(cpfField) {
                let cpf = cpfField.value.replace(/\D/g, '');
                cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
                cpfField.value = cpf;
            }
            window.onload = function () {
            <% if (session.getAttribute("message") != null) { %>
                clearForm(); // Limpar os campos do formulário
            <% } %>
            };
        </script>
    </head>
    <body>
        <div class="cadastro-container">
            <h2>Cadastro de Motorista</h2>
            <form action="CadastrarMotoristaServlet" method="post">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" required><br><br>
                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" oninput="formatCPF(this)" maxlength="14" required><br><br>
                <label for="cnh">Número da CNH:</label>
                <input type="text" id="cnh" name="cnh" required><br><br>
                <label for="categoria">Categoria da CNH:</label>
                <select id="categoria" name="categoria" required>
                    <option value="" disabled selected>Selecione a categoria</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="E">E</option>
                </select><br><br>
                <label for="cursos">Cursos Adicionais:</label>
                <textarea id="cursos" name="cursos" rows="4" cols="50"></textarea><br><br>
                <div class="button-container">
                    <button type="submit">Cadastrar</button>
                    <button type="button" onclick="window.location.href = 'main.jsp'">Voltar</button>
                </div>
            </form>

            <!-- Exibir mensagem de sucesso -->
            <%
                String message = (String) session.getAttribute("message");
                if (message != null) {
                    out.println("<p class='message success'>" + message + "</p>");
                    session.removeAttribute("message");
                }
            %>
        </div>
    </body>
</html>





