/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.jsp.taglib;

import javax.servlet.jsp.*;

import org.mmbase.bridge.jsp.taglib.*;

/**
 * @author keesj
 * @version $Id$
 */
public class TeFieldTag extends FieldTag {

    /* (non-Javadoc)
     * @see org.mmbase.bridge.jsp.taglib.FieldTag#convert(java.lang.String)
     */
    protected String convert(String s) throws JspTagException {
        StringBuffer sb = new StringBuffer();
        sb.append("<div class=\"");
        //sb.append(getFieldVar().getNodeManager().getName());
        //sb.append("_");
        sb.append(getFieldVar().getName());
        sb.append("\">");
        sb.append(s);
        sb.append("</div>");
        return sb.toString();
    }
}
