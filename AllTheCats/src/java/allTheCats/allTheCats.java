package allTheCats;

import utils.UserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Emily
 */
public class allTheCats extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //setup session and servlet parameters
        ServletContext servletContext = getServletContext();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(600);//inactive after 10 min
        UserInfo userInfo = (UserInfo) session.getAttribute("userinfo");
        if (userInfo == null) {
            userInfo = new UserInfo();
        }

        //setting and getting info from JavaBean
        //set session attribute
        session.setAttribute("userinfo", userInfo);

        //actions
        String url = "/index.jsp";
        if (action == null) {
            action = "";//default
        }
        if (action.equals("createAccount")) {
            url = "/createAccount.jsp";
        }
        if (action.equals("login")) {
            //get credentials and send to homepage
            //check database
            
            url = "/index.jsp";
        }
        servletContext.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "All The Cats adoption site";
    }

}
