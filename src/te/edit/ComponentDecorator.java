package te.edit;

import te.*;
import te.jsp.JSPComponent;


public class ComponentDecorator extends JSPComponent {
	Component component;
	
	
    public ComponentDecorator(String path , Component component){
    	super(path);
    	this.component = component;
    }
    
    public Component getDecoratedCompoment(){
    	return component;
    }
}
