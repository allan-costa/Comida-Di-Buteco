package controller;

import java.io.IOException;

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
 * Classe que recebe os dados do prato depois de feira a altera��o pela tela alterar-dados-prato.jsp. E em seguida chama o m�todo alterarDados() da classe PratoDAO para tentar fazer a  persist�ncia no BD
 */
@WebServlet("/servletUpdatePrato")
public class ServletUpdatePrato extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	Prato prato = new Prato();
	PratoDAO pratoDao = new PratoDAO();
	
	String nome = request.getParameter("nome");
	String nomeDoBar = request.getParameter("nomeDoBar");
	String ingredientes = request.getParameter("ingredientes");
	String preparo = request.getParameter("preparo");
	
	prato.setNome(nome);
	prato.setNomeDoBar(nomeDoBar);
	prato.setIngredientes(ingredientes);
	prato.setPreparo(preparo);
	
	if(pratoDao.alterarDados(prato))
		request.setAttribute("updatestats", "<script>alert('Seus dados foram atualizados com sucesso!')</script>");
	else
		request.setAttribute("updatestats", "<script>Não foi possivel realizar a operação</script>");	
	
		request.getRequestDispatcher("principal.jsp").forward(request, response);	
	}
	
	
	
}
