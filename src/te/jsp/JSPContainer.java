/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.jsp;

import java.io.*;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import te.*;
import java.util.*;
/**
 * @author Kees Jongenburger
 */
public class JSPContainer extends JSPComponent implements Container {
    Components templates;
    Hashtable templateHint;
    LayoutManager layoutManager;

    public JSPContainer(String path, LayoutManager layoutManager) {
        super(path);
        this.layoutManager = layoutManager;
        templates = new Components();
        templateHint = new Hashtable();
    }

    public Components getComponents() {
        return templates;
    }
	/**
	 * add a component to the container
	 * this method sould call setParentComponent of the caller
	 * @param component the component to add
	 */
    public void addComponent(Component component) {
		component.setParentComponent(this);
        templates.add(component);
    }

    public void addComponent(Component component, String hint) {
    	templateHint.put(component,hint);
        addComponent(component);
    }

    public LayoutManager getLayoutManager() {
        return layoutManager;
    }

    public void render(WhiteBoard wb, PrintWriter writer) throws ServletException, IOException  {
        wb.getHttpServletRequest().setAttribute("container", this);
        super.render(wb, writer);
    }
}
