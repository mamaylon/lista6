<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.FisicaDAO"%>
<%@ page import="dao.JuridicaDAO"%>
<%@ page import="model.PessoaFisica"%>
<%@ page import="model.PessoaJuridica"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Exemplo</title>
    </head>

    <body>

        <h1>Clientes pessoa física</h1>
        <h2><a href="cadastrarFisica.jsp">Cadastrar Pessoa Física</a></h2>
        <table border="1">
            <thead>
                <th>Nome</th>
                <th>Data Nascimento</th>
                <th>CPF</th>
                <th>Endereço</th>
                <th>CEP</th>
                <th>Telefone</th>
            </thead>
            <tbody>
            <%
                try {
                    FisicaDAO pfd = new FisicaDAO();
                    List<PessoaFisica> lstPf = pfd.pesquisar();             

                    for (PessoaFisica pf : lstPf) 
                    {
                        out.println("<tr>");
                            out.println("<td>" + pf.getNome() + "</td>");
                            out.println("<td>" + pf.getDataNascimento() + "</td>");
                            out.println("<td>" + pf.getCPF() + "</td>");
                            out.println("<td>" + pf.getEndereco() + "</td>");
                            out.println("<td>" + pf.getCEP() + "</td>");
                            out.println("<td>" + pf.getTelefone() + "</td>");
                        out.println("</tr>");
                    }

                } catch (SQLException e) {
                    out.println("<td colspan='6'>Erro " + e.getMessage() + "</td>");
                    
                }          
                
            %> 
            </tbody>
        </table>
        
        <br><br>

        <h1>Clientes pessoa juridica</h1>
        <h2><a href="cadastrarJuridica.jsp">Cadastrar Pessoa Juridica</a></h2>
        <table border="1">
            <thead>
                <th>Nome</th>
                <th>Razão Social</th>
                <th>CNPJ</th>
                <th>Endereço</th>
                <th>CEP</th>
                <th>Telefone</th>
            </thead>
            <tbody>
            <%
                try {
                    JuridicaDAO pjd = new JuridicaDAO();
                    List<PessoaJuridica> lstPj = pjd.pesquisar();             

                    for (PessoaJuridica pj : lstPj) 
                    {
                        out.println("<tr>");
                            out.println("<td>" + pj.getNome() + "</td>");
                            out.println("<td>" + pj.getRazaoSocial() + "</td>");
                            out.println("<td>" + pj.getCNPJ() + "</td>");
                            out.println("<td>" + pj.getEndereco() + "</td>");
                            out.println("<td>" + pj.getCEP() + "</td>");
                            out.println("<td>" + pj.getTelefone() + "</td>");
                        out.println("</tr>");
                    }

                } catch (SQLException e) {
                    out.println("<td colspan='6'>Erro " + e.getMessage() + "</td>");
                    
                }          
                
            %> 
            </tbody>
        </table>

    </body>
</html>
