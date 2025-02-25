<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="LoginServlet" method="post">
                <label for="username">Usuário:</label>
                <input type="text" id="username" name="username" required><br><br>
                <label for="password">Senha:</label>
                <input type="password" id="password" name="password" required><br><br>
                <div class="button-container">
                    <button type="submit">Entrar</button><br><br>
                </div>
                <a href="#" onclick="alert('Por favor, procure o suporte de TI para recuperar sua senha')">Esqueceu a senha?</a>
            </form>

            <!-- Exibir mensagem de sucesso ou erro -->
            <%
                String message = (String) session.getAttribute("message");
                if (message != null) {
                    if ("true".equals(request.getParameter("success"))) {
                        out.println("<p class='message success'>" + message + "</p>");
                    } else {
                        out.println("<p class='message error'>" + message + "</p>");
                    }
                    session.removeAttribute("message");
                }
            %>
        </div>
    </body>
</html>




