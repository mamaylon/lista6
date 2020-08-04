<%@page import="dao.FisicaDAO"%>
<%@ page import="model.PessoaFisica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exemplo</title>
    </head>

    <body>

        <%
            if(request.getParameter("nome") != null)
            {
                FisicaDAO pfd = new FisicaDAO();
                PessoaFisica pf = new PessoaFisica();

                pf.setNome(request.getParameter("nome"));
                pf.setEndereco(request.getParameter("endereco"));
                pf.setCEP(request.getParameter("cep"));
                pf.setTelefone(request.getParameter("telefone"));
                pf.setCPF(request.getParameter("cpf"));
                pf.setDataNascimento(request.getParameter("data_nascimento"));
                
                pfd.cadastrar(pf);

                response.sendRedirect("/lista6/");
            }
        %>

        <form method="POST" action="">
            Nome: <input type="text" name="nome" required> <br>
            CPF: <input type="text" name="cpf"> <br>
            Data Nascimento: <input type="text" name="data_nascimento"> <br>
            Endereço: <input type="text" name="endereco"> <br>
            CEP: <input type="text" name="cep"> <br>
            Telefone: <input type="text" name="telefone"> <br><br><br>

            <input type="submit" value="Cadastrar">
        </form>

    </body>
</html>