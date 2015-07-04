package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PratoDAO;
import model.Prato;

/*
 * Servlet que realiza o cadastro do prato e cria a pasta com a imagem do prato
 */
@WebServlet("/servletCadastroPrato")
public class ServletCadastroPrato extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Prato prato = new Prato();
		PratoDAO p = new PratoDAO();
		File temp = null;
	    File novoNome = null;  
	    
	    prato.setNome(request.getParameter("nome"));
	    prato.setIngredientes(request.getParameter("ingredientes"));
	    prato.setNomeDoBar(request.getParameter("nomeDoBar"));
	    prato.setPreparo(request.getParameter("preparo"));
		
		// Renomeia a pasta TEMP com o nome do prato
		try{      
	    	temp = new File("src/main/webapp/imagens/TEMP");
	    	novoNome = new File("src/main/webapp/imagens/" + prato.getNome()); 
	        temp.renameTo(novoNome);
	        
	      }catch(Exception e){
	         e.printStackTrace();
	      }
		
		
		// Tenta persistir os dados do formulario e realiza o cadastro do prato no banco de dados
		if(p.cadastrarPrato(prato)) 
			request.setAttribute("msg", "<div class='alert alert-success'>Dados do prato cadastrado com sucesso</div>");
		else
			request.setAttribute("msg", "<div class='alert alert-danger'>Nao foi possivel realizar a operacao</div>");
			
		request.getRequestDispatcher("novoPrato.jsp").forward(request, response);
		
		
		}

}
