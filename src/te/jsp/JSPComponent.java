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

import java.util.*;
import te.*;
import te.util.*;

/**
 * @author Kees Jongenburger
 */
public class JSPComponent extends AbstractContainer implements Component {
    private static Logger log = Logging.getLoggerInstance(JSPComponent.class);
    protected String path = null;

    private boolean mapRenderRelativeToRender = false;
    /**
     * create a new jsp template for a certain path
     */
    public JSPComponent(String path) {
        this.path = path;
    }

    public void render(WhiteBoard wb, PrintWriter writer) throws ServletException, IOException {
        long start = System.currentTimeMillis();
        log.debug(" render {" + path + "} ");
        try {

            wb.getHttpServletRequest().setAttribute("component", this);

            RequestWrapper req = new RequestWrapper(wb.getHttpServletRequest());
            ResponseWrapper resp = new ResponseWrapper(wb.getHttpServletResponse(), writer);
            RequestDispatcher requestDispatcher = wb.getHttpServletRequest().getRequestDispatcher(path);
            requestDispatcher.include(req, resp);

            /**            
            HttpServletRequestWrapper req = new HttpServletRequestWrapper(wb.getHttpServletRequest());
            HttpServletResponseWrapper resp = new HttpServletResponseWrapper(wb.getHttpServletResponse());
            RequestDispatcher requestDispatcher = wb.getHttpServletRequest().getRequestDispatcher(path);
            requestDispatcher.include(wb.getHttpServletRequest(), wb.getHttpServletResponse());
            **/
        } catch (Throwable t) {
            wb.getHttpServletRequest().setAttribute("throwable", t);
            new JSPComponent("/te/component/error.jsp").render(wb, writer);
        }
        log.debug("finised render {" + path + "} " + (System.currentTimeMillis() - start) + " ms");
    }

    /* (non-Javadoc)
     * @see te.Template#renderRelative(java.lang.String, te.WhiteBoard, java.io.PrintWriter)
     */
    public void renderRelative(String path, WhiteBoard wb) throws ServletException, IOException {
        if (path.endsWith(".jsp") || path.endsWith(".jpg") || path.endsWith(".css") || path.endsWith(".png") || path.endsWith(".js")) {
            mapRenderRelativeToRender = false;
        } else {
            mapRenderRelativeToRender = true;
        }

   

        if (mapRenderRelativeToRender) {
            log.debug("rendering " + path + " via " + getName());
            render(wb, wb.getHttpServletResponse().getWriter());
        } else {
            log.debug("dispatching " + path);

            int index = this.path.lastIndexOf(NavigationControl.PATH_SEPARATOR);
            if (index != -1) {
                String realPath = this.path.substring(0, index);
                String theURL = realPath + NavigationControl.PATH_SEPARATOR + path;
                log.debug("the url that will be renderd is : " + theURL);
                wb.getHttpServletRequest().getRequestDispatcher(theURL).forward(wb.getHttpServletRequest(), wb.getHttpServletResponse());
            }
        }
    }
    /**
     * @return
     */
    public boolean isMapRenderRelativeToRender() {
        return mapRenderRelativeToRender;
    }

    /**
     * @param b
     */
    public void setMapRenderRelativeToRender(boolean b) {
        mapRenderRelativeToRender = b;
    }

    public Object clone() {
        JSPComponent c = new JSPComponent(path);
        c.setName(getName());
        c.setDescription(getDescription());
        c.setProperties(getProperties());
        return c;
    }
    public String getName() {
        if (super.getName() == null) {
            return getClass().getName() + "/" + path;
        }
        return super.getName();
    }

}
