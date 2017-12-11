
package utils;

/**
 *
 * @author Emily
 */
public class CreditCardInfo {
    String month;
    String year;
    String number;

    public CreditCardInfo() {
        month = "";
        year = "";
        number = "";
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}
