
/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te;

import java.io.*;
import java.util.*;
/**
 * A Template is a small part of a page it is tha base class for items that will be shown 
 * on a page
 * @author Kees Jongenburger
 */
public interface Component extends Cloneable{
	
	/** 
	 * @param wb the whiteboard
	 * @param writer the writer the render function might use. in some cases the writer can be null
	 * because the caller wants the render method to generate a requesdipatch(in that case the 
	 * caller must not have called response.getWriter
	 * @throws Exception
	 */
    public void render(WhiteBoard wb, PrintWriter writer) throws Exception;
    public void renderRelative(String path, WhiteBoard wb) throws Exception;
    
	public String getProperty(String key);
	public void setProperty(String key,String value);
	public Properties getProperties(); 
	public void setProperties(Properties properties);
	public void setParentComponent(Component component);
	public Component getParentComponent();
	public void setName(String name);
	public String getName();
	public void setDescription(String  desc);
	public String getDescription();
	public Object clone() throws CloneNotSupportedException;
}
