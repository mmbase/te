package te;
import java.util.*;

public class Components extends Vector {
    public Component getComponent(int index) {
        return (Component)get(index);
    };
    
    public Component getComponentByName(String name){
    	for (int x = 0 ;x < size() ; x++){
    		Component c = getComponent(x);
    		if (c.getName().equals(name)) return c;
    	}
    	return null;
    }
}
