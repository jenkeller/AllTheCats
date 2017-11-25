
package utils;

/**
 *
 * @author Emily
 */
public class PhoneNumber {
    String areaCode;
    String middleThree;
    String lastFour;

    public PhoneNumber() {
        areaCode = "000";
        middleThree = "000";
        lastFour = "0000";
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getMiddleThree() {
        return middleThree;
    }

    public void setMiddleThree(String middleThree) {
        this.middleThree = middleThree;
    }

    public String getLastFour() {
        return lastFour;
    }

    public void setLastFour(String lastFour) {
        this.lastFour = lastFour;
    }
}
