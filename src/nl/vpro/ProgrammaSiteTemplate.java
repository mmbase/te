/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import java.io.*;

import javax.servlet.*;

import te.*;
import te.jsp.*;

import org.mmbase.util.logging.*;
/**
 * @author keesj
 * @version $Id$
 */
public class ProgrammaSiteTemplate extends JSPTemplate {
	private static Logger log = Logging.getLoggerInstance(ProgrammaSiteMMBaseNavigation.class);
	
	public ProgrammaSiteTemplate(String path,LayoutManager layoutManager){
		super(path,layoutManager);
		log.debug("new programma site");
	}
    /* (non-Javadoc)
     * @see te.Component#render(te.WhiteBoard, java.io.PrintWriter)
     */
    public void render(WhiteBoard wb, PrintWriter writer) throws ServletException, IOException {
    	log.debug("render");
        super.render(wb, writer);
    }

    /* (non-Javadoc)
     * @see te.Component#renderRelative(java.lang.String, te.WhiteBoard)
     */
    public void renderRelative(String path, WhiteBoard wb) throws ServletException, IOException {
		log.debug("render relative");
        // TODO Auto-generated method stub
        super.renderRelative(path, wb);
    }

}
