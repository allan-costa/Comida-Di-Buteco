package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Prato;
import connection.ConnectionFactory;

public class PratoDAO {
		
	private String sql = "";
	 
	public Prato getPrato(String nome) {
		Prato prato = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        conn = ConnectionFactory.getConnection();
        if(conn ==null){
            return prato;
        }
        sql = "SELECT * FROM pratos WHERE nome=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, nome);
            rs =ps.executeQuery();
            
            while(rs.next()){
            	prato = new Prato();
            	prato.setNome(rs.getString("nome"));
            	prato.setIngredientes(rs.getString("ingredientes"));
            	prato.setNomeDoBar(rs.getString("nomeDoBar"));
            	prato.setPreparo(rs.getString("preparo"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(PratoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            ConnectionFactory.closeConnection(conn, ps, rs);
        }
        
        return prato;
    }

	
	 public List<Prato> getPratos() {
	        List<Prato> lstPratos = null;
	        Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        conn = ConnectionFactory.getConnection();
	        if(conn ==null){
	            return lstPratos;
	        }
	        sql = "SELECT * FROM pratos ORDER BY nome";
	        try {
	            ps = conn.prepareStatement(sql);

	            rs =ps.executeQuery();
	            lstPratos = new ArrayList<Prato>();
	            while(rs.next()){
	               Prato prato = new Prato();
	              
	               //prato.setId(rs.getInt("id"));
	            	prato.setNome(rs.getString("nome"));
	            	prato.setIngredientes(rs.getString("ingredientes"));
	            	prato.setNomeDoBar(rs.getString("nomeDoBar"));
	            	prato.setPreparo(rs.getString("preparo"));
	               
	               lstPratos.add(prato);

	            }
	        } catch (SQLException ex) {
	            Logger.getLogger(PratoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        finally{
	            ConnectionFactory.closeConnection(conn, ps, rs);
	        }
	        
	        return lstPratos;
	    }
	 	
	 	public void criarTabelaPratos() {	
	        Connection conexao = null;
	        conexao = ConnectionFactory.getConnection();
	      
	        sql = "" +
	        		"create table pratos (" +
	        		"  nome varchar(50) not null," +
	        		"  ingredientes varchar(600)," +
	        		"  nomeDoBar varchar(50)," +
	        		"  preparo varchar(600)," +
	        		"  constraint pk_prato primary key (nome) " +
	        		")";
	        	
	        		try {			
	        			
	        			conexao.createStatement().execute(sql);
	        			System.out.println("Tabela pratos criada com sucesso!!");
	        		} catch(Exception e) {
	        			throw new RuntimeException("Erro ao criar a tabela de pratos", e);
	        		}
	 	}
	 	
	 	 public boolean removePrato (String nome){
	 		 
	         boolean isOK = false;
	         Connection conn = null;
	         PreparedStatement ps = null;
	         conn = ConnectionFactory.getConnection();
	         if(conn ==null){
	             return isOK;
	         }
	         
	         System.out.println(nome);
	         
	         sql = "DELETE FROM pratos WHERE nome=?";
	         try {
	             ps = conn.prepareStatement(sql);
	             ps.setString(1, nome);
	             System.out.println("Hit 2");
	             ps.executeUpdate();
	             System.out.println("Hit 3");
	             isOK = true;
	            
	         } catch (SQLException ex) {
	             Logger.getLogger(PratoDAO.class.getName()).log(Level.SEVERE, null, ex);
	         }
	         finally{
	             ConnectionFactory.closeConnection(conn, ps);
	         }

	         return isOK;
	     }
	 	
	    public boolean cadastrarPrato (Prato prato){
	        boolean isOK = false;
	        Connection conexao = null;
	        PreparedStatement ps = null;
	        conexao = ConnectionFactory.getConnection();
	        if(conexao ==null){
	            return isOK;
	        }
	
	        sql = "INSERT INTO pratos (nome, ingredientes, nomeDoBar, preparo)";
	        sql +="VALUES(?,?,?,?)";
	        
	        try {
	            ps = conexao.prepareStatement(sql);
	            ps.setString(1,prato.getNome());
	            ps.setString(2,prato.getIngredientes());
	            ps.setString(3,prato.getNomeDoBar());
	            ps.setString(4,prato.getPreparo());
	           
	            ps.executeUpdate();
	            isOK = true;
	            
	        } catch (SQLException ex) {
	            Logger.getLogger(PratoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        finally{
	            ConnectionFactory.closeConnection(conexao, ps);
	        }
	        
	        return isOK;
	    }
	    
	    public boolean alterarDados(Prato prato){
			boolean isOK = false;

			Connection conexao = null;
			PreparedStatement ps = null;
			conexao = ConnectionFactory.getConnection();
			if(conexao == null){
				return isOK;
			}
			
			String sql = "UPDATE pratos SET nome = ?, nomeDoBar = ?, ingredientes = ?, preparo = ? WHERE nome = ?";
			
			try{
				ps = conexao.prepareStatement(sql);
				
				ps.setString(1, prato.getNome());
				ps.setString(2, prato.getNomeDoBar());
				ps.setString(3, prato.getIngredientes());
				ps.setString(4, prato.getPreparo());
				ps.setString(5, prato.getNome());
					
				ps.executeUpdate();	
				isOK = true;
				
			}catch(SQLException ex){
				Logger.getLogger(PratoDAO.class.getName()).log(Level.SEVERE, null, ex);
			}finally{
	            ConnectionFactory.closeConnection(conexao, ps);
			}
			return isOK;
		}
  
	   
}

