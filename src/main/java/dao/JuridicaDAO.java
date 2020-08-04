package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.PessoaJuridica;
import util.ConexaoBanco;

public class JuridicaDAO {

    private Connection con;

    public JuridicaDAO() {
        this.con = new ConexaoBanco().getConnection();
    }

    // Cadastro:
    public void cadastrar(PessoaJuridica pj) throws SQLException {
        
        String query;
        //tipo = 1: fisica; 2: juridica
        query = "INSERT INTO cliente (tipo, nome, endereco, cep, telefone, cnpj, razao_social) VALUES (2, ?, ?, ?, ?, ?, ?);";

        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, pj.getNome());
        st.setString(2, pj.getEndereco());
        st.setString(3, pj.getCEP());
        st.setString(4, pj.getTelefone());
        st.setString(5, pj.getCNPJ());
        st.setString(6, pj.getRazaoSocial());

        st.execute();
        st.close();
        con.close();
    }

    public List<PessoaJuridica> pesquisar() throws SQLException, Exception {
        
        List<PessoaJuridica> lista = new ArrayList();
        String query = "SELECT * FROM cliente WHERE tipo='2'";
        
        PreparedStatement st = con.prepareStatement(query);
        
        ResultSet rs = st.executeQuery();
        
        while(rs.next()) {            
            PessoaJuridica pj = new PessoaJuridica();
            
            pj.setNome(rs.getString("nome"));
            pj.setEndereco(rs.getString("endereco"));
            pj.setCEP(rs.getString("cep"));
            pj.setTelefone(rs.getString("telefone"));
            pj.setCNPJ(rs.getString("cnpj"));
            pj.setRazaoSocial(rs.getString("razao_social"));
            
            lista.add(pj);
        }   
        return lista;
    }
    
}