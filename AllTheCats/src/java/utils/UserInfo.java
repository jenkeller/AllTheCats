
package utils;

/**
 *
 * @author Emily
 */
public class UserInfo {
    String name;
    String email;
    String password;
    BillingAddress address;
    PhoneNumber phone;
    CreditCardInfo card;
    String errorText;
    boolean cash;

    public UserInfo() {
        name = "";
        email = "";
        password = "";
        address = new BillingAddress();
        phone = new PhoneNumber();
        card = new CreditCardInfo();
        errorText = "";
        cash = false;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public BillingAddress getAddress() {
        return address;
    }

    public void setAddress(BillingAddress address) {
        this.address = address;
    }

    public PhoneNumber getPhone() {
        return phone;
    }

    public void setPhone(PhoneNumber phone) {
        this.phone = phone;
    }

    public CreditCardInfo getCard() {
        return card;
    }

    public void setCard(CreditCardInfo card) {
        this.card = card;
    }

    public String getErrorText() {
        return errorText;
    }

    public void setErrorText(String errorText) {
        this.errorText = errorText;
    }

    public boolean isCash() {
        return cash;
    }

    public void setCash(boolean cash) {
        this.cash = cash;
    }
}
