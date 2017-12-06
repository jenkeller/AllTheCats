
package utils;

import java.util.ArrayList;

/**
 *
 * @author Emily
 */
public class Cats {
    ArrayList<Cat> cats;

    public Cats() {
        cats = new ArrayList<>();
    }

    public ArrayList<Cat> getCats() {
        return cats;
    }

    public void setCats(ArrayList<Cat> cats) {
        this.cats = cats;
    }
}
