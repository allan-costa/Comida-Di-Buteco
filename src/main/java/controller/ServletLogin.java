package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDAO;
import model.Usuario;

@WebServlet("/servletLogin")
public class ServletLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Connection conexao = null;
		PreparedStatement stmt = null;
		ResultSet res = null;

		
			String usuario = request.getParameter("usuario");
			String senha = request.getParameter("senha");
			
			UsuarioDAO userDao = new UsuarioDAO();
			
			Usuario user = userDao.getUsuario(usuario);

			if (user == null || !user.getSenha().equals(senha)) {
				request.setAttribute("msgErro", "<script>alert('Login ou senha incorretos!');</script>");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			} else {

				System.out.println("Logado!");	
				
				HttpSession session = request.getSession();
					
				session.setAttribute("usuario", user);
				
	            session.setMaxInactiveInterval(30*60);
	            
	            Cookie userName = new Cookie("usuario", usuario);
	            
	            userName.setMaxAge(30*60);
	            
	            response.addCookie(userName);

				response.sendRedirect("principal.jsp");


			}
}
}
