import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Main extends HttpServlet {
	
	/**
	 * Serial Version for Servlet
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Encoder e = new Encoder();
		String text = req.getParameter("message");
		ArrayList<Node> fr = e.calculateFrequency(text);
		e.printFromPreOrder(e.makeHuffmanTree(fr), "");
		req.setAttribute("tree", e.huffman);
		getServletContext().getRequestDispatcher("/result.jsp").forward(req, resp);
	}

}
