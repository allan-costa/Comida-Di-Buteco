package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PratoDAO;
import model.Prato;


@WebServlet("/servletGetPrato")
public class ServletGetPrato extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	
		PratoDAO p = new PratoDAO();
		
		String nome = request.getParameter("nome");
	    
		Prato prato = p.getPrato(nome);

			request.setAttribute("nomePrato", prato.getNome());
			request.setAttribute("ingredientes", prato.getIngredientes());
			request.setAttribute("preparo", prato.getPreparo());
			request.setAttribute("nomeDoBar", prato.getNomeDoBar());

			
		request.getRequestDispatcher("pratos.jsp").forward(request, response);
		
		
		}

}
