package org.mmbase.applications.te.edit;

import org.mmbase.applications.te.*;
import org.mmbase.applications.te.jsp.JSPComponent;


public class ComponentDecorator extends JSPComponent {
	Component component;
	
	
    public ComponentDecorator( Component component){
    	super("/te/edit/componentdecorator.jsp");
    	this.component = component;
    }
    
    public Component getDecoratedComponent(){
    	return component;
    }
    
    public String getName(){
    	return component.getName();
    }
}
