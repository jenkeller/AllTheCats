
package utils;

import java.util.ArrayList;

/**
 *
 * @author Emily
 */
public class Cart {
    ArrayList<String> catsToAdopt;

    public Cart() {
        catsToAdopt = new ArrayList<>();
    }

    public ArrayList<String> getCatsToAdopt() {
        return catsToAdopt;
    }

    public void setCatsToAdopt(ArrayList<String> catsToAdopt) {
        this.catsToAdopt = catsToAdopt;
    }
}
