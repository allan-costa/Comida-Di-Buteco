package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PratoDAO;
/*
 * Lista, na tela "listarPratos", todos os pratos cadastrados e disponibiliza a opção de deletar algum prato
 */
@WebServlet("/servletListarPratos")
public class ServletListarPratos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void remover (File f) {  
        if (f.isDirectory()) {  
            File[] files = f.listFiles();  
            for (int i = 0; i < files.length; ++i) {  
                remover (files[i]);  
            }  
        }  
        f.delete();  
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String separador = java.io.File.separator; 
		String nome = request.getParameter("nome");
		PratoDAO  p = new PratoDAO();
		
		// Deleta a pasta com imagens do prato
		this.remover(new File ("src/main/webapp/imagens/" + separador + nome));
		
		//Passa o nome do prato ser deletado para o método removerPrato() da classe PratoDAO
		p.removePrato(nome);
		response.sendRedirect("listarPratos.jsp");
	}
}
