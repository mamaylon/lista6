<%@page import="dao.JuridicaDAO"%>
<%@ page import="model.PessoaJuridica"%>
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
                JuridicaDAO pjd = new JuridicaDAO();
                PessoaJuridica pj = new PessoaJuridica();

                pj.setNome(request.getParameter("nome"));
                pj.setRazaoSocial(request.getParameter("razao_social"));
                pj.setCEP(request.getParameter("cep"));
                pj.setTelefone(request.getParameter("telefone"));
                pj.setCNPJ(request.getParameter("cnpj"));
                pj.setEndereco(request.getParameter("endereco"));
                
                pjd.cadastrar(pj);

                response.sendRedirect("/lista6/");
            }
        %>

        <form method="POST" action="">
            Nome: <input type="text" name="nome" required> <br>
            Razão Social: <input type="text" name="razao_social"> <br>
            CNPJ: <input type="text" name="cnpj"> <br>
            Endereço: <input type="text" name="endereco"> <br>
            CEP: <input type="text" name="cep"> <br>
            Telefone: <input type="text" name="telefone"> <br><br><br>

            <input type="submit" value="Cadastrar">
        </form>

    </body>
</html>