
package utils;

/**
 *
 * @author Emily
 */
public class BillingAddress {
    String street;
    String city;
    String state;
    String zip;

    public BillingAddress() {
        street = "";
        city = "";
        state = "";
        zip = "00000";
    }  

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }
}
