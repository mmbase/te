/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro.mmbase.applications.te;

import java.io.*;
import java.util.List;

import minixml.XMLElement;

import org.mmbase.util.logging.*;

import te.*;
import te.jsp.JSPTemplate;
import te.util.*;
/**
 * @author Kees Jongenburger
 */
public class ProgrammasitesNavigationControl extends NavigationControl implements Configurable {
	
    private static Logger log = Logging.getLoggerInstance(ProgrammasitesNavigationControl.class);

    Navigation navigation;
    String config = null;

    public ProgrammasitesNavigationControl() {}

    public Navigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(Navigation navigation) {
        if (navigation.getProperty("template") != null) {
        	
            JSPTemplate t = new JSPTemplate(navigation.getProperty("template"), null);
            t.setMapRenderRelativeToRender(true);
            return t;
        }
        String templateName = navigation.getProperty("type");

        Template t = getTemplate(templateName);
        //since the template is used in a differen faction then the template compoment
        //we set the name and description of the template again
        t.setName(templateName);
        return t;
    }

    private Template getTemplate(String name) {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream(name + ".xml")));
        StringWriter sw = new StringWriter();
        String data = null;
        try {
            while ((data = br.readLine()) != null) {
                sw.write(data);
            }
        } catch (IOException e) {
            throw new RuntimeException("can not load xml");
        }
        String xmlData = sw.toString();
        XMLStorage store = new XMLStorage();
        Component c = store.stringToComponent(xmlData);
        return (Template)c;
    }


    /* (non-Javadoc)
     * @see te.Configurable#setConfig(java.lang.String)
     */
    public void setConfig(String config) {
        this.config = config;
        XMLElement e = new XMLElement();
        e.parseString(config);
        e.setTagName("navigation");
        e.addProperty("name", "test controler");
        e.addProperty("id", "testcontroler");
        navigation = NavigationLoader.parseXML(e.toString());
        navigation.setNavigationControl(this);
        navigation.setVisible(false);
        log.debug("Test navigation = " + navigation);
    }

    /* (non-Javadoc)
     * @see te.NavigationControl#resoveURL(te.Navigation, java.util.List)
     */
    public String resoveURL(Navigation currentNavigation, List params) {
        return getNavigation().getParentNavigation().getNavigationControl().resoveURL(currentNavigation, params);
    }
}
