
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
        month = "01";
        year = "00";
        number = "0000000000000000";
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
