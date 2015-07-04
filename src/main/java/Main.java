import dao.PratoDAO;
import dao.UsuarioDAO;

/*
 * Criar a tabela pratos e usuario no banco de dados.
 */


public class Main {

	public static void main(String[] args) {
		PratoDAO p = new PratoDAO();
		p.criarTabelaPratos();
		 UsuarioDAO novoUser = new UsuarioDAO();
	     novoUser.createUserTable();
	     
		
	     
	}

}
