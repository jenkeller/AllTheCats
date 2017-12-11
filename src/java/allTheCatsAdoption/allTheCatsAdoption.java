package allTheCatsAdoption;

import db.CatDB;
import db.UserInfoDB;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.mail.MessagingException;
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
import utils.MailUtilGmail;
import utils.PhoneNumber;
import utils.UserInfo;

/**
 *
 * @author Emily
 */
public class allTheCatsAdoption extends HttpServlet {

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
        Cat catt = (Cat) servletContext.getAttribute("cat");
        if (catt == null) {
            catt = new Cat();
        }
        servletContext.setAttribute("cat", catt);
        //actions
        String url = "/index.jsp";
        if (action == null) {
            action = "loginFirst";
        }

        String emails = request.getParameter("username");
        if (emails != null) {
            userInfo.setEmail(emails);
        } else {
            emails = userInfo.getEmail();
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

        System.out.println(action);
        userInfo.setErrorText("");
        String cat = request.getParameter("cat");
        String todo = request.getParameter("todo");
        switch (action) {
            case "loginFirst":
                url = "/login.jsp";
                break;
            case "cart":
                url = "/cart.jsp";
                break;
            case "backToCats":
                url = "/catSelection.jsp";
                break;
            case "confirm":
                ArrayList<Cat> catss = new ArrayList<>();
                for (String catStr : cart.getCatsToAdopt()) {
                    String[] catStrArray = catStr.split(",");
                    String nameCat = catStrArray[0];
                    String descriptionCat = catStrArray[1];
                    Cat c = CatDB.selectCat(nameCat, descriptionCat);
                    catss.add(c);
                    //remove cat from db
                    CatDB.deleteCat(nameCat, descriptionCat);
                }
                //send confirmation email
                String to = emails;
                String from = "AllTheCatsAdoption";
                String subject = "AllTheCats Adoption Confirmation";
                String body = "Congratulations on your adoption!\n\n";
                body += "You will recieve a call when your new companion(s) is/are ready to go home.\n";
                body += "If you had a card on file, it was charged; otherwise, please bring cash with you when you come to pick up your new family member(s).\n";
                double total = 0.0;
                for (Cat n : catss) {
                    body += n.getName() + ": " + n.getDescription() + ": " + n.getAge();
                    if (n.isKitten()) {
                        body += " --> $90\n";
                        total += 90.0;
                    } else {
                        body += "$50\n";
                        total += 50.0;
                    }
                }
                DecimalFormat priceFormatter = new DecimalFormat("$#0.00");
                body += "Total Amount Due: " + priceFormatter.format(total) + "\n";
                body += "Please keep this receipt for your records.\n";
                body += "\nRegards,\n";
                body += "Your Friends at AllTheCats";
                boolean isBodyHTML = false;
                try {
                    MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
                } catch (MessagingException e) {
                    String errorMessage
                            = "ERROR: Unable to send email. "
                            + "Check Tomcat logs for details.<br>"
                            + "NOTE: You may need to configure your system "
                            + "as described in chapter 14.<br>"
                            + "ERROR MESSAGE: " + e.getMessage();
                    request.setAttribute("errorMessage", errorMessage);
                    this.log(
                            "Unable to send email. \n"
                            + "Here is the email you tried to send: \n"
                            + "=====================================\n"
                            + "TO: " + emails + "\n"
                            + "FROM: " + from + "\n"
                            + "SUBJECT: " + subject + "\n"
                            + "\n"
                            + body + "\n\n");
                }
                //remove cats from cart
                cart.getCatsToAdopt().clear();
                url = "/confirmation.jsp";
                break;
            case "addToCart":
                cart.getCatsToAdopt().add(cat);
                url = "/catSelection.jsp";
                break;
            case "removeFromCartSelect":
                cart.getCatsToAdopt().remove(cat);
                url = "/catSelection.jsp";
                break;
            case "removeFromCartCart":
                cart.getCatsToAdopt().remove(cat);
                url = "/cart.jsp";
                break;
            case "addCat":
                url = "/addCat.jsp";
                break;
            case "catToBeAdded":
                String newCatName = request.getParameter("newCatName");
                String newCatDesc = request.getParameter("newCatDesc");
                String newAge = request.getParameter("newCatAge");
                double newCatAge = Double.parseDouble(newAge);
                boolean isKitten = false;
                if (newCatAge < 1) {
                    isKitten = true;
                }
                String imageSrc = "images/"+request.getParameter("image");
                CatDB.insertIntoCatTable(newCatName, newCatAge, newCatDesc, isKitten, imageSrc);
                url = "/adminPage.jsp";
                break;
            case "removeCat":
                if (todo != null && todo.equals("remove") && cat != null) {
                    String[] creds = cat.split(",");
                    String catName = creds[0];
                    String descr = creds[1];
                    CatDB.deleteCat(catName, descr);
                }
                url = "/adminPage.jsp";
                break;
            case "submitApp":
                String declaw = request.getParameter("claw");
                if(declaw != null && declaw.equals("Yes")){
                    url = "/index.jsp";
                } else {
                    url = "/profile.jsp";
                }
                break;
            case "editCat":
                if (todo != null && todo.equals("edit") && cat != null) {
                    String[] creds = cat.split(",");
                    String catName = creds[0];
                    String descr = creds[1];
                    Cat myCat = CatDB.selectCat(catName, descr);
                    catt.setAge(myCat.getAge());
                    catt.setDescription(myCat.getDescription());
                    catt.setImageSrc(myCat.getImageSrc());
                    catt.setKitten(myCat.isKitten());
                    catt.setName(myCat.getName());
                    url = "/editCat.jsp";
                }
                break;
            case "saveCatInfo":
                String catName = catt.getName();
                String catImgSrc = catt.getImageSrc();
                String agee = request.getParameter("cAge");
                double catAge = Double.parseDouble(agee);
                String catDesc = request.getParameter("catDesc");
                boolean isKitten1 = false;
                if (catAge < 1) {
                    isKitten1 = true;
                }
                CatDB.updateCatTable(catName, catAge, catDesc, isKitten1, catImgSrc);
                catt = new Cat();//reset cat
                url = "/adminPage.jsp";
                break;
            case "logoutAdmin":
                url = "/index.jsp";
                break;
            case "login":
                //check database
                if (UserInfoDB.emailExists(emails)) {
                    //already in the db
                    url = "/catSelection.jsp";
                    userInfo = UserInfoDB.selectUser(emails);
                } else {
                    //user needs to create account
                    //send back to login page
                    userInfo.setErrorText("ERROR! Username not found in system. Please create account.");
                    url = "/login.jsp";
                }
                break;
            case "adminLogin":
                String aPassword = request.getParameter("password");
                if (aPassword.equals("letMeIn!")) {
                    url = "/adminPage.jsp";
                } else {
                    userInfo.setErrorText("ERROR! Administrative password incorrect.");
                    url = "/login.jsp";
                }
                break;
            case "createAccount":
                url = "/adoptionApplication.jsp";
                break;
            case "accountSaved":
                if (UserInfoDB.emailExists(emails)) {
                    UserInfoDB.updateAddressTable(address, name, emails);
                    UserInfoDB.updateCreditCardTable(name, emails, card);
                    UserInfoDB.updatePhoneNumberTable(emails, phone);
                    UserInfoDB.updateUserTable(password, emails);
                    url = "/catSelection.jsp";
                } else {
                    //add new account to db
                    UserInfoDB.insertIntoUserTable(password, emails);
                    UserInfoDB.insertIntoAddressTable(address, emails, name);
                    UserInfoDB.insertIntoPhoneNumberTable(phone, emails);
                    if (!userInfo.isCash()) {
                        UserInfoDB.insertIntoCreditCardTable(card, emails, name);
                    }
                    url = "/catSelection.jsp";
                }
                break;
            default:
                break;
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
        return "AllTheCats Adoption Site";
    }

}
