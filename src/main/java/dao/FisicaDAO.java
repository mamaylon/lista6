package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.PessoaFisica;
import util.ConexaoBanco;

public class FisicaDAO {

    private Connection con;

    public FisicaDAO() {
        this.con = new ConexaoBanco().getConnection();
    }

    // Cadastro:
    public void cadastrar(PessoaFisica pf) throws SQLException {
        
        String query;
        //tipo = 1: fisica; 2: juridica
        query = "INSERT INTO cliente (tipo, nome, endereco, cep, telefone, cpf, data_nasc) VALUES (1, ?, ?, ?, ?, ?, ?);";

        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, pf.getNome());
        st.setString(2, pf.getEndereco());
        st.setString(3, pf.getCEP());
        st.setString(4, pf.getTelefone());
        st.setString(5, pf.getCPF());
        st.setString(6, pf.getDataNascimento());

        st.execute();
        st.close();
        con.close();
    }

    public List<PessoaFisica> pesquisar() throws SQLException, Exception {
        
        List<PessoaFisica> lista = new ArrayList();
        String query = "SELECT * FROM cliente WHERE tipo='1'";
        
        PreparedStatement st = con.prepareStatement(query);
        
        ResultSet rs = st.executeQuery();
        
        while(rs.next()) {            
            PessoaFisica pf = new PessoaFisica();
            
            pf.setNome(rs.getString("nome"));
            pf.setEndereco(rs.getString("endereco"));
            pf.setCEP(rs.getString("cep"));
            pf.setTelefone(rs.getString("telefone"));
            pf.setCPF(rs.getString("cpf"));
            pf.setDataNascimento(rs.getString("data_nasc"));
            
            lista.add(pf);
        }   
        return lista;
    }
    
}