/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.edit;

import java.io.PrintWriter;

import org.mmbase.util.logging.*;

import te.*;
import te.jsp.JSPComponent;
/**
 * @author Kees Jongenburger
 */
public class EditTemplate extends AbstractContainer implements Template {
    private static Logger log = Logging.getLoggerInstance(EditTemplate.class);

    public void render(WhiteBoard wb, PrintWriter writer) throws Exception {
        // TODO Auto-generated method stub

    }

    public void renderRelative(String path, WhiteBoard wb) throws Exception {
        log.debug("incomming path " + path);

        //remove the name of the "edit" navigation
        NavigationControl mainNavControl = wb.getFacade().getNavigationControl();

        AbstractNavigation editNav = wb.getCurrentNavigation();

        AbstractNavigation parentOfEditNav = editNav.getParentNavigation();
        //from the parent create a url and add the relative path
        String generatedURL = mainNavControl.getURLString(parentOfEditNav) + "/" + path;
        AbstractNavigation navigationToEdit = mainNavControl.getNavigation(generatedURL);

        String editNavPath = mainNavControl.getURLString(editNav);

        if (generatedURL.length() == mainNavControl.getURLString(navigationToEdit).length()) {

            //navigationToEdit might be the navigation to edit
            //but it also may be a relative url t a resource

            log.debug("editNavPath " + editNavPath);
            log.debug("nav to edit " + mainNavControl.getURLString(navigationToEdit));

            //the original template
            Template t = navigationToEdit.getTemplate();
            AbstractNavigation cacheNav = wb.getCurrentNavigation();
            t.addComponent(new JSPComponent("/te/component/pagestructure.jsp"));
            wb.setCurrentNavigation(navigationToEdit);
            t.render(wb, wb.getHttpServletResponse().getWriter());
            wb.setCurrentNavigation(cacheNav);
        } else {

            //TODO: fix this .. it's all to compilcated
            log.debug("//TODO: fix this .. it's all to compilcated");
            Template t = navigationToEdit.getTemplate();
            String url1 = mainNavControl.getURLString(navigationToEdit);

            t.renderRelative(path, wb);
        }
    }
}
