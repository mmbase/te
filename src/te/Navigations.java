package te;
import java.util.*;

public class Navigations extends Vector {
    public AbstractNavigation getNavigation(int index) {
        return (AbstractNavigation)get(index);
    };
}   
 
