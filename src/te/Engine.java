/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.mmbase.module.core.*;
import org.mmbase.util.logging.*;

/**
 * Engine is a Servlet that acts as a front servlet the main purpose of the filter is 
 * to choose the right template .
  * @author Kees Jongenburger
 */
public class Engine implements Filter {

    protected static String engineName = "programma";
    //every time a new EngineFacade is created a the counter is increased 
    protected static long creationCounter = 0;

    //	every time the EngineFacade is destroy is called a the counter is increased
    protected static long destroyCounter = 0;

    //request counter shared over the different engines
    protected static int requestCounter = 0;

    //the configuration of the filter
    //private ServletConfig servletConfig = null;

    //we have a separate logger for the different instances
    private Logger log = null;

    //we have only one facade
    public static Facade facade;
    
	public Engine(){
		
	}
	
    public void init(FilterConfig filterConfig) throws ServletException {
    	
        //this.filterConfig = filterConfig;
        creationCounter++;
        MMBaseContext.init(filterConfig.getServletContext());
        MMBaseContext.initHtmlRoot() ;
        MMBase.getMMBase();
        filterConfig.getServletContext();
        log = Logging.getLoggerInstance(Engine.class.getName() + "[" + creationCounter + "]");
        log.info("init of engine with name " + filterConfig.getFilterName());
        if (facade == null) {
            facade = new FacadeImpl();
        }
    }

    public static Facade getFacade() {
        return facade;
    }

    public void destroy() {
        destroyCounter++;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
		try {

			   requestCounter++;

			   resp.setContentType("text/html;charset=" + Facade.encoding);
			   //resp.setContentType("text/html");

			   //code to determin the "engine url"             
			   if (facade.getEngineURL() == null) {
				   String servletPath = req.getRequestURI();
				   int match = servletPath.indexOf(engineName);
				   if (match > 0) {
					   facade.setEngineURL(servletPath.substring(0, match + engineName.length() + 1));
					   log.debug("setting engine url to" + facade.getEngineURL());
				   } else {
					   log.warn("it looks like the engine is not called \"engine\" unable to determin the engine url");
				   }
			   }

			   //create your shared object
			   WhiteBoard wb = new WhiteBoard(req, resp);
			   wb.setFacade(facade);
			   //and store the whiteboard on it
			   req.setAttribute("wb", wb);

			   if (req.getRequestURI().length() == facade.getEngineURL().length()) {
				   return;
			   }

			   //extract the servlet context name and the eninge name
			   //this is the starting point
			   String path = req.getRequestURI().substring(facade.getEngineURL().length());

			   //remove leading slashes
			   while (path.charAt(path.length() - 1) == '/') {
				   path = path.substring(0, path.length() - 1);
			   }

			   if (log.isDebugEnabled()) {
				   //log.debug("request[" + requestCounter + "] servlet path info " + req.getPathInfo());
				   //log.debug("request[" + requestCounter + "] " + req.getRequestURI());
				   //log.debug("request[" + requestCounter + "] servlet request url " + req.getRequestURL());
				   //log.debug("request[" + requestCounter + "] servlet context path " + req.getContextPath());
				   //log.debug("request[" + requestCounter + "] servlet  path " + req.getServletPath());
				   //log.debug("request[" + requestCounter + "] guesed filter path " + facade.getEngineURL());
				   log.debug("request[" + requestCounter + "] requested " + path);
			   }

			   NavigationControl navigationComponent = facade.getNavigationControl();
			   //resolve the current navigation
			   Navigation nav = navigationComponent.resolveNavigation(new Path(path));
			   if (nav != null) {
				   //if the navigation was found put it in the whiteboard
				   wb.setCurrentNavigation(nav);
				   String navpath = navigationComponent.getURLString(nav);
				   log.debug("request[" + requestCounter + "] found " + navpath);

				   try {
					   Template t = navigationComponent.getTemplate(nav);
					   log.debug("using template: " + t.getName() + " " + t.getDescription());
					   if (!path.equals(navpath)) {
						   log.debug("navpath " + navpath);
						   log.debug("path " + path);
						   String remainingPath = path.substring(navpath.length() + NavigationControl.PATH_SEPARATOR.length());
						   t.renderRelative(remainingPath, wb);
					   } else {
						   t.render(wb, resp.getWriter());
					   }
				   } catch (IOException e) {
					   log.warn(Logging.stackTrace(e));
				   } catch (Exception e) {
					   log.warn(Logging.stackTrace(e));
				   }
			   } else {
				   try {
					   //req.getRequestDispatcher("/" + engineName + ".old/" + path).forward(req, resp);
					   chain.doFilter(req, resp);
				   } catch (IOException e) {
					   log.warn(Logging.stackTrace(e));
				   } catch (Exception e) {
					   log.warn(Logging.stackTrace(e));
				   }
			   }
			   wb = null;
		   } catch (Throwable t) {
			   log.fatal(t.getMessage() + " " + Logging.stackTrace(t));
		   }
    }

}
