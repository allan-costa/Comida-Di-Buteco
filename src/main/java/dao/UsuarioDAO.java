package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Usuario;
import connection.ConnectionFactory;

public class UsuarioDAO {

	public void createUserTable(){
		
		Connection conexao = null;
		conexao = ConnectionFactory.getConnection();
		
		String sql;
		
		sql = "" + "create table usuario(" +
		" id_user int not null generated always as identity (start with 1, increment by 1)," +
		" usuario varchar(15) not null," +
		" nome varchar(50)," +
	    " senha varchar(12) not null," +
		" email varchar(50) not null, " +
	    " constraint pk_id_user primary key (id_user)" +
		")";
		
		try{
			conexao.createStatement().execute(sql);
			System.out.println("criou tabela usuario");
		} catch(Exception e){
			throw new RuntimeException("Erro ao criar a tabela Usuario", e);
		}
	}
	
	public boolean cadastrarUsuario (Usuario usuario){
		
		boolean itsok = false;
		
		Connection conexao = null;
		PreparedStatement ps = null;
		conexao = ConnectionFactory.getConnection();
		if(conexao == null){
			return itsok;
		}
		
		String sql = "INSERT INTO usuario(usuario, nome, senha, email) VALUES(?,?,?,?)";
		
		try {
			System.out.println("1");
			ps = conexao.prepareStatement(sql);
			System.out.println("Passou");
			ps.setString(1, usuario.getUsuario());
			ps.setString(2, usuario.getNome());
			ps.setString(3, usuario.getSenha());
			ps.setString(4, usuario.getEmail());
			System.out.println("2");

			ps.executeUpdate();
			System.out.println("update executado com sucesso!");
			itsok = true;
			
			
		} catch (SQLException ex){
			Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
			System.out.println("Entrou na exceção!");

		} finally {
			System.out.println("Entrou no finally!");
			ConnectionFactory.closeConnection(conexao, ps);
		}
		
		System.out.println("Retornou itsok como true");
		return itsok;
	}
	
	public boolean removerUsuario (Usuario user){
		boolean isOK = false;
		Connection conn = null;
		PreparedStatement ps = null;
		conn = ConnectionFactory.getConnection();
		if(conn ==null){
            return isOK;
        }
		
		String sql = "DELETE FROM usuario WHERE usuario=?";
		try{
			ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsuario());
            ps.executeUpdate();
            isOK = true;
		} catch(SQLException ex){
            Logger.getLogger(UsuarioDAO.class.toString()).log(Level.SEVERE, null, ex);

		} finally{
			ConnectionFactory.closeConnection(conn, ps);
		}
		return isOK;
	}
	
	public boolean alterarDados(Usuario user){
		boolean isOK = false;

		Connection conexao = null;
		PreparedStatement ps = null;
		conexao = ConnectionFactory.getConnection();
		if(conexao == null){
			return isOK;
		}
		
		String sql = "UPDATE usuario SET senha = ?, email = ? WHERE usuario = ? ";
		
		try{
			ps = conexao.prepareStatement(sql);
			
			ps.setString(1, user.getSenha());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getUsuario());
			System.out.println("alterarDados senha: " + user.getSenha());
			System.out.println("alterarDados e-mail: " + user.getEmail());
			System.out.println("alterarDados usuario: " + user.getUsuario());

			ps.executeUpdate();	
			isOK = true;

		}catch(SQLException ex){
			Logger.getLogger(PratoDAO.class.getName()).log(Level.SEVERE, null, ex);
		}finally{
            ConnectionFactory.closeConnection(conexao, ps);
		}
		return isOK;
		
		
	}
	
	public Usuario getUsuario(String nome) {
		Usuario usuario = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        conn = ConnectionFactory.getConnection();
        if(conn ==null){
            return usuario;
        }
        String sql = "SELECT * FROM usuario WHERE usuario=?";
        
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, nome);
            rs =ps.executeQuery();
            
            System.out.println("OKKKKKK");
            
            while(rs.next()){
               usuario = new Usuario();
               usuario.setNome(rs.getString("nome"));
               usuario.setSenha(rs.getString("senha"));
               
               System.out.println("GETUSUARIO" + usuario.getNome());
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            ConnectionFactory.closeConnection(conn, ps, rs);
        }
        
        return usuario;
    }
	
}
	
	
	
	
