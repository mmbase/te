/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.io.PrintWriter;
import java.util.Properties;

/**
 * @author Kees Jongenburger
 */
public abstract class AbstractComponent implements Component {
    Properties properties = new Properties();

    public abstract void render(WhiteBoard wb, PrintWriter writer) throws Exception;
    public abstract void renderRelative(String path, WhiteBoard wb, PrintWriter writer) throws Exception;

    public String getProperty(String key) {
        return properties.getProperty(key);
    }

    public void setProperty(String key, String value) {
        properties.setProperty(key, value);
    }
    public Properties getProperties() {
        return properties;
    }
    public abstract void setParentComponent(Component component);
	public abstract Component getParentComponent();
}
