/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.components;

import java.io.PrintWriter;

import te.*;
import te.jsp.JSPComponent;

/**
 * @author Kees Jongenburger
 */
public class ConfigurableComponent extends AbstractComponent implements Component{
	
	JSPComponent view ;
	
	public ConfigurableComponent(){
		view = new JSPComponent("/te/components/mags.jsp");
	}
	
    public void render(WhiteBoard wb, PrintWriter writer) throws Exception {
    	view.render(wb,writer);
    }

    public void renderRelative(String path, WhiteBoard wb) throws Exception {
    }
}
