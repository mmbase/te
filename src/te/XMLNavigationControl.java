/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;

import org.mmbase.util.logging.Logger;
import org.mmbase.util.logging.Logging;

import te.jsp.JSPTemplate;
import te.util.NavigationLoader;

/**
 * @author Kees Jongenburger
 */
public class XMLNavigationControl extends NavigationControl {
    private static Logger log = Logging.getLoggerInstance(XMLNavigationControl.class);
    Navigation navigation;

    public XMLNavigationControl() {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("navigation.xml")));
        StringWriter sw = new StringWriter();
        String data = null;
        try {
            while ((data = br.readLine()) != null) {
                sw.write(data);
            }
        } catch (IOException e) {
            throw new RuntimeException("can not load xml");
        }
        navigation = NavigationLoader.parseXML(sw.toString());
        //navigation.setNavigationControl(this);
    }

    public Navigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(Navigation navigation) {
        NavigationControl control = navigation.getNavigationControl();
        if (control == this) {
            return new JSPTemplate("/te/index.jsp?id=" + navigation.getID(),null);
        } else {
            return control.getTemplate(navigation);
        }
    }
}
