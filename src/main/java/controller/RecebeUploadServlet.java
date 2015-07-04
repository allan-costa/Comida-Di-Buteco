package controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class RecebeUploadServlet Criado com base no exemplo
 * disponivel em:
 * 
 * http://stackoverflow.com/questions/7114087/html5-file-upload-to-java-servlet
 * 
 */
@WebServlet("/RecebeUploadServlet")
public class RecebeUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecebeUploadServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String filename = "";

			List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			
			String nomeDiretorio = null;   
		    String separador = java.io.File.separator;   
		    
		    
		    // Cria a pasta com o nome do prato
		    try {       
		         nomeDiretorio = "src/main/webapp/imagens/" + separador + "TEMP";   
		         if (!new File(nomeDiretorio).exists()) { // Verifica se o diretório existe.   
		             (new File(nomeDiretorio)).mkdir();   // Cria o diretório   
		         }   
		    } catch (Exception ex) {   
		         throw new ServletException("Erro ao criar o diretório", ex);
		    }
		    
			for (FileItem item : items) {
				if (item.getFieldName().equalsIgnoreCase("file")) {
					filename = item.getName();
				    
					InputStream content = item.getInputStream();			
					
					// grava em arquivo
					OutputStream out = new FileOutputStream(new File("src/main/webapp/imagens/TEMP/" + item.getName()));

					int read = 0;
					byte[] bytes = new byte[1024];

					while ((read = content.read(bytes)) != -1) {
						out.write(bytes, 0, read);
					}
					content.close();
					out.flush();
					out.close();
				}
				
			    
			    
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(
					"Arquivo " + filename + " enviado com sucesso!");
			return;
		} catch (FileUploadException e) {
			throw new ServletException("Parsing file upload failed.", e);
		}
	}

}
