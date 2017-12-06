
package utils;

/**
 *
 * @author Emily
 */
public class Cat {
    String name;
    String description;
    String imageSrc;
    boolean kitten;
    double age;

    public Cat() {
        name = "";
        description = "";
        imageSrc = "";
        kitten = false;
        age = 0.0;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    public boolean isKitten() {
        return kitten;
    }

    public void setKitten(boolean kitten) {
        this.kitten = kitten;
    }

    public double getAge() {
        return age;
    }

    public void setAge(double age) {
        this.age = age;
    }
    
}
