/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.edit;
import te.*;
import te.jsp.*;
import te.util.*;
import java.util.*;
import org.mmbase.util.logging.*;

/**
 * @author keesj
 * @version $Id$
 */
public class TemplateEditor {
    Logger log = Logging.getLoggerInstance(TemplateEditor.class);

	Navigation nav;
    static Hashtable hash = new Hashtable();

    public TemplateEditor(Navigation navigation) {
    	this.nav = navigation;
        if (hash.get(navigation) == null) {
            XMLStorage store = new XMLStorage();
            Template wrappedTemplate = (Template) store.stringToComponent(store.componentToString(navigation.getTemplate()));
            wrapComponent(wrappedTemplate);
            hash.put(navigation,wrappedTemplate);
            wrappedTemplate.addComponent(new JSPComponent("/te/edit/stylecompoment.jsp"));
        }
    }

    private void wrapComponent(Component c) {
        if (c instanceof Container) {
            Components childs = ((Container) c).getComponents();
            for (int x = 0; x < childs.size(); x++) {
                Component child = childs.getComponent(x);
                if (child instanceof Container) {
                    wrapComponent(child);
                    childs.remove(child);
                    childs.add(x, new ContainerDecorator((Container) child));
                } else {
                    childs.remove(child);
                    childs.add(x, new ComponentDecorator(child));
                }
            }
        }
    }

    public Template getTemplate() {
        return (Template)hash.get(nav);
    }
}