/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.jsp;

import java.io.*;

import javax.servlet.*;

import org.mmbase.util.logging.*;

import te.*;
import te.util.*;

/**
 * @author Kees Jongenburger
 */
public class JSPComponent extends AbstractComponent implements Component {
    private static Logger log = Logging.getLoggerInstance(JSPComponent.class);
    String path = null;
    
    /**
     * create a new jsp template for a certain path
     */
    public JSPComponent(String path) {
        this.path = path;
    }

    public void render(WhiteBoard wb, PrintWriter writer) throws ServletException, IOException {
        try {

            wb.getHttpServletRequest().setAttribute("component", this);
            RequestWrapper req = new RequestWrapper(wb.getHttpServletRequest());
            ResponseWrapper resp = new ResponseWrapper(wb.getHttpServletResponse(), writer);
            RequestDispatcher requestDispatcher = wb.getHttpServletRequest().getRequestDispatcher(path);
            requestDispatcher.include(req, resp);
        } catch (Throwable t) {
            wb.getHttpServletRequest().setAttribute("throwable", t);
            new JSPComponent("/te/component/error.jsp").render(wb, writer);
        }
    }

    /* (non-Javadoc)
     * @see te.Template#renderRelative(java.lang.String, te.WhiteBoard, java.io.PrintWriter)
     */
    public void renderRelative(String path, WhiteBoard wb) throws ServletException, IOException {
        int index = this.path.lastIndexOf(NavigationControl.PATH_SEPARATOR);
        if (index != -1) {
            String realPath = this.path.substring(0, index);
            String theURL = realPath + NavigationControl.PATH_SEPARATOR + path;
            log.debug("the url that will be renderd is : " + theURL);

            //RequestWrapper req = new RequestWrapper(wb.getHttpServletRequest());
            //ResponseWrapper resp = new ResponseWrapper(wb.getHttpServletResponse(), writer);
            //RequestDispatcher requestDispatcher = wb.getHttpServletRequest().getRequestDispatcher(path);
            //requestDispatcher.forward(req, resp);
            wb.getHttpServletRequest().getRequestDispatcher(theURL).forward(wb.getHttpServletRequest(), wb.getHttpServletResponse());
        }

    }
}
