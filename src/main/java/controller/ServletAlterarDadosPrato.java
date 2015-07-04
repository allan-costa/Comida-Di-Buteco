package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prato;
import model.Usuario;
import dao.PratoDAO;
import dao.UsuarioDAO;

/*
 * Esta classe recebe o nome do prato pela tela pratos.jsp, pesquisa o prato no banco de dados e depois repassa para a tela alterar-dados-pratos.jsp
 */
@WebServlet("/alterarDadosPrato")
public class ServletAlterarDadosPrato extends HttpServlet {

	private static final long serialVersionUID = 1L;

	String LIST_USER = "alterar-dados-prato.jsp";
	PratoDAO dao;
	
	public ServletAlterarDadosPrato(){ 
		super();
		dao = new PratoDAO();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String forward="";
		
		// Essa string pega o nome do prato quando o usuario está logado como admin e clica no link editar
		String nomePrato = request.getParameter("nomePrato");
		
		if(nomePrato != null){
			forward = LIST_USER;
			Prato prato = dao.getPrato(nomePrato);
			
			System.out.println(prato.getNome());
			
			//Passa o nome do prato para o campo "nome" da tela alterar-dados-prato
			request.setAttribute("nomePrato", prato.getNome());

			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);

		}
		else if(nomePrato == null)
			request.setAttribute("sucesscad", "<script>alert('ERRO')</script>");	
			request.getRequestDispatcher("login.jsp");
			
		}		
}

