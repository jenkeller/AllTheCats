package allTheCats;

import db.CatDB;
import db.UserInfoDB;
import utils.UserInfo;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.BillingAddress;
import utils.Cart;
import utils.Cat;
import utils.Cats;
import utils.CreditCardInfo;
import utils.PhoneNumber;

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
        //set session attribute
        session.setAttribute("userinfo", userInfo);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        //set session attribute
        session.setAttribute("cart", cart);
        Cats cats = (Cats) servletContext.getAttribute("cats");
        if (cats == null) {
            cats = new Cats();
        }
        //upload cat database
        cats = CatDB.selectAllCats();
        servletContext.setAttribute("cats", cats);
        //actions
        String url = "/index.jsp";
        if (action == null) {
            if (userInfo.getName().isEmpty()) {
                action = "login";
            } else {
                action = "alterCart";
            }
        }
        String cat = request.getParameter("cat");
        String option = request.getParameter("option");
        if (action.equals("alterCart")) {
            if (option != null && cat != null && option.equals("add")) {
                cart.getCatsToAdopt().add(cat);
            } else if (option != null && cat != null && option.equals("remove")) {
                cart.getCatsToAdopt().remove(cat);
            }
        } else if (action.equals("accountCreated")) {
            String email = request.getParameter("email");
            if (UserInfoDB.emailExists(email)) {
                userInfo.setErrorText("Error! Username already exists. Please login.");
                url = "/login.jsp";
            } else {
                if (email != null) {
                    userInfo.setEmail(email);
                } else {
                    email = userInfo.getEmail();
                }
                String password = request.getParameter("password");
                if (password != null) {
                    userInfo.setPassword(password);
                } else {
                    password = userInfo.getPassword();
                }
                String name = request.getParameter("name");
                if (name != null) {
                    userInfo.setName(name);
                } else {
                    name = userInfo.getName();
                }
                BillingAddress address = new BillingAddress();
                String street = request.getParameter("street");
                if (street != null) {
                    address.setStreet(street);
                } else {
                    street = userInfo.getAddress().getStreet();
                }
                String city = request.getParameter("city");
                if (city != null) {
                    address.setCity(city);
                } else {
                    city = userInfo.getAddress().getCity();
                }
                String state = request.getParameter("state");
                if (state != null) {
                    address.setState(state);
                } else {
                    state = userInfo.getAddress().getState();
                }
                String zip = request.getParameter("zip");
                if (zip != null) {
                    address.setZip(zip);
                    userInfo.setAddress(address);
                } else {
                    zip = userInfo.getAddress().getZip();
                }
                PhoneNumber phone = new PhoneNumber();
                String area = request.getParameter("areaCode");
                if (area != null) {
                    phone.setAreaCode(area);
                } else {
                    area = userInfo.getPhone().getAreaCode();
                }
                String middleThree = request.getParameter("middleThree");
                if (middleThree != null) {
                    phone.setMiddleThree(middleThree);
                } else {
                    middleThree = userInfo.getPhone().getMiddleThree();
                }
                String lastFour = request.getParameter("lastFour");
                if (lastFour != null) {
                    phone.setLastFour(lastFour);
                    userInfo.setPhone(phone);
                } else {
                    lastFour = userInfo.getPhone().getLastFour();
                }
                CreditCardInfo card = new CreditCardInfo();
                String month = request.getParameter("month");
                if (month != null) {
                    card.setMonth(month);
                } else {
                    month = userInfo.getCard().getMonth();
                }
                String year = request.getParameter("year");
                if (year != null) {
                    card.setYear(year);
                } else {
                    year = userInfo.getCard().getYear();
                }
                String number = request.getParameter("number");
                if (number != null) {
                    card.setNumber(number);
                    userInfo.setCash(false);
                    userInfo.setCard(card);
                } else if (!userInfo.isCash()) {
                    number = userInfo.getCard().getNumber();
                } else {
                    userInfo.setCash(true);
                }
                //add account to db
                UserInfoDB.insertIntoUserTable(password, email);
                UserInfoDB.insertIntoAddressTable(address, email, name);
                UserInfoDB.insertIntoPhoneNumberTable(phone, email);
                if (!userInfo.isCash()) {
                    UserInfoDB.insertIntoCreditCardTable(card, email, name);
                }
                url = "/index.jsp";
            }
        } else if (action.equals("createAccount")) {
            url = "/createaccount.jsp";
        } else if (action.equals("login")) {
            //get credentials and send to homepage
            String email = request.getParameter("email");
            if (email != null) {
                userInfo.setEmail(email);
            } else {
                email = userInfo.getEmail();
            }
            String password = request.getParameter("password");
            if (password != null) {
                userInfo.setPassword(password);
            } else {
                password = userInfo.getPassword();
            }
            //check database
            if (UserInfoDB.emailExists(email)) {
                //already in the db
                url = "/index.jsp";
                userInfo = UserInfoDB.selectUser(email);
                System.out.println(userInfo);
            } else {
                //user needs to create account
                //send back to login page
                userInfo.setErrorText("ERROR! Username not found in system. Please create account.");
                url = "/login.jsp";
            }
        } else if (action.equals("adminLogin")) {
            url = "/adminPage.jsp";
        } else if(action.equals("editAccount")){
            
        }
        response.sendRedirect(url);
        //servletContext.getRequestDispatcher(url).forward(request, response);
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
