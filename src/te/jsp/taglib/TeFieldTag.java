/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.jsp.taglib;

import javax.servlet.jsp.*;

import org.mmbase.bridge.jsp.taglib.*;
//import javax.servlet.jsp.PageContext;
import te.*;
/**
 * @author keesj
 * @version $Id$
 */
public class TeFieldTag extends FieldTag {
    //PageContext pageContext;
    /* (non-Javadoc)
     * @see org.mmbase.bridge.jsp.taglib.FieldTag#convert(java.lang.String)
     */
    protected String convert(String s) throws JspTagException {
		WhiteBoard wb =(WhiteBoard) pageContext.getAttribute("wb");
		if (wb.get)
        StringBuffer sb = new StringBuffer();
        sb.append("<div class=\"");
        sb.append(getFieldVar().getNodeManager().getName());
        sb.append("_");
        sb.append(getFieldVar().getName());
        sb.append("\">");
        sb.append(s);
        sb.append("</div>");
        return sb.toString();
    }
/*
    public void setPageContext(PageContext pc) {
        this.pageContext = pc;
        super.setPageContext(pc);
    }
    */

}
