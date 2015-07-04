package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;
import model.Usuario;

@WebServlet("/servletCadUsuario")
public class ServletCadUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Usuario user = new Usuario();
		UsuarioDAO userDao = new UsuarioDAO();
		
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		String email = request.getParameter("email");
		
		user.setUsuario(usuario);
		user.setEmail(email);
		user.setSenha(senha);
		
		
		if(userDao.cadastrarUsuario(user))
			request.setAttribute("sucesscad", "<script>alert('Você foi cadastrado com sucesso!')</script>");
		else
			request.setAttribute("sucesscad", "<div class='alert alert-danger'>Não foi possivel realizar a operação</div>");	
		
			request.getRequestDispatcher("cadastro.jsp").forward(request, response);	
		}
		
}

	

