/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import te.jsp.*;
import java.io.*;
import java.util.*;
import minixml.*;
import org.mmbase.util.logging.*;
/**
 * @author keesj
 * @version $Id$
 * registry of the reusable components
 */
public class ComponentRegistry {
    private static Logger log = Logging.getLoggerInstance(ComponentRegistry.class);
    private Components components;
    private Templates templates;
    private Containers containers;
    private LayoutManagers layoutManagers;

    private static ComponentRegistry componentRegistry = null;

    private ComponentRegistry() {
        components = new Components();
        templates = new Templates();
        containers = new Containers();
        layoutManagers = new LayoutManagers();

	updateRegistry();
        //add the default layout managers
        //LayoutManager defaultLayoutManager = new JSPLayoutManager("/te/layout/default.jsp", "default", "default list layout");
        //layoutManagers.add(defaultLayoutManager);

        //LayoutManager horizontal = new JSPLayoutManager("/te/layout/horizontal.jsp", "horizontal", "horizontal layout");
        //layoutManagers.add(horizontal);

        //LayoutManager vertical = new JSPLayoutManager("/te/layout/vertical.jsp", "vertical", "vertical layout");
        //layoutManagers.add(vertical);

        Container defaultContainer = new JSPContainer("/te/container/default.jsp", layoutManagers.getLayoutManagerByName("horizontal"));
        defaultContainer.setName("default");
        defaultContainer.setDescription("default container with horizontal layout");
        containers.add(defaultContainer);

        Container verticalContainer = new JSPContainer("/te/container/default.jsp", layoutManagers.getLayoutManagerByName("vertical"));
        verticalContainer.setName("vertical");
        verticalContainer.setDescription("default container with vertical layout");
        containers.add(verticalContainer);

        Container horizontalContainer = new JSPContainer("/te/container/default.jsp", layoutManagers.getLayoutManagerByName("horizontal"));
        horizontalContainer.setName("horizontal");
        horizontalContainer.setDescription("default container with horizontal layout");
        containers.add(horizontalContainer);

        //add the default templates
        Template defaultTemplate = new JSPTemplate("/te/template/default.jsp", layoutManagers.getLayoutManagerByName("default"));
        defaultTemplate.setName("default");
        defaultTemplate.setDescription("default tempate using the default layout");
        templates.add(defaultTemplate);

    }

    public static ComponentRegistry getInstance() {
        synchronized (ComponentRegistry.class) {
            if (componentRegistry == null)
                componentRegistry = new ComponentRegistry();
        }
        return componentRegistry;
    }

    public Component getComponent(String name) {
        try {
            return (Component) components.getComponentByName(name).clone();
        } catch (CloneNotSupportedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    public Container getContainer(String name) {
        try {
            return (Container) containers.getContainerByName(name).clone();
        } catch (CloneNotSupportedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @return
     */
    public LayoutManagers getLayoutManagers() {
        return layoutManagers;
    }

    /**
     * @return
     */
    public Template getTemplate(String name) {
        try {
            return (Template) templates.getTemplateByName(name).clone();
        } catch (CloneNotSupportedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;

    }

    private void updateRegistry() {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("registry.xml")));
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
        XMLElement xmle = new XMLElement();
        xmle.parseString(xmlData);
        if (!xmle.getTagName().equals("registry"))
            log.error("error while reading the registry root node not regsitry but " + xmle.getTagName());

        for (int x = 0; x < xmle.countChildren(); x++) {
            XMLElement child = xmle.getChildAt(x);
            if (child.getTagName().equals("layoutManager")) {
                if (child.getProperty("class") != null || !child.getProperty("class").equals("te.jsp.JSPLayoutManager")) {
                    log.error("layoutManager class not te.jsp.LayoutManager");
                }
                String name = child.getProperty("name");
                String description = child.getProperty("description");
                for (int y = 0; y < child.countChildren(); y++) {
                    XMLElement property = child.getChildAt(y);
                    if (!property.getTagName().equals("property")) {
                        log.error("unknown subtab of " + child.getTagName() + " named " + property.getTagName());
                        continue;
                    }
                    String propertyName = property.getProperty("name");

                    if (propertyName.equals("jspPage")) {
                        String path = property.getContents();
                        LayoutManager lam = layoutManagers.getLayoutManagerByName(name);
                        log.debug("adding layout manager with name " + name);
                        synchronized (layoutManagers) {
                            if (lam != null) {
                                log.debug("updating layout manager");
                                layoutManagers.remove(lam);
                            }
                            layoutManagers.add(new JSPLayoutManager(path, name, description));
                        }
                    } else {
                        log.error("unknown property of layout manager");
                    }
                }
            }
        }

    }
}
