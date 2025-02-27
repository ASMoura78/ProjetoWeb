<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Principal</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <div class="main-container">
            <h2>Menu Principal</h2>
            <!-- Exibir mensagem de sucesso -->
            <%
                String message = (String) session.getAttribute("message");
                if (message != null) {
                    out.println("<p class='message success'>" + message + "</p>");
                    session.removeAttribute("message");
                }
            %>
            <div class="button-container">
                <form class="form-container" action="CadastroMotorista.jsp" method="get">
                    <button type="submit">
                        <img src="imagens/motorista.jpg" alt="Cadastrar Motorista">
                        Cadastrar Motorista
                    </button>
                </form>
                <form class="form-container" action="CadastroVeiculo.jsp" method="get">
                    <button type="submit">
                        <img src="imagens/veiculo.jpg" alt="Cadastrar Veículo">
                        Cadastrar Veículo
                    </button>
                </form>
                <form class="form-container" action="ListarMotoristasServlet" method="get"> <!-- Atualizado -->
                    <button type="submit">
                        <img src="imagens/atividade.jpg" alt="Cadastrar Atividade">
                        Cadastrar Atividade
                    </button>
                </form>
                <form class="form-container" action="ListarVeiculosServlet" method="get">
                    <button type="submit">
                        <img src="imagens/multa.jpg" alt="Cadastro de Multas">
                        Cadastro de Multas
                    </button>
                </form>
                <form class="form-container" action="ListarVeiculosOficinaServlet" method="get">
                    <button type="submit">
                        <img src="imagens/oficina.jpg" alt="Cadastro de Oficina">
                        Cadastro de Oficina
                    </button>
                </form>
            </div>
            <div class="exit-container">
                <form class="form-container" action="LogoutServlet" method="post">
                    <button type="submit">Sair</button>
                </form>
            </div>
        </div>
    </body>
</html>








