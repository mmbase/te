/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te.jsp.taglib;

import javax.servlet.jsp.*;

import org.mmbase.bridge.*;
import org.mmbase.bridge.jsp.taglib.*;

import org.mmbase.applications.te.*;
//import javax.servlet.jsp.PageContext;
//import te.*;
/**
 * @author keesj
 * @version $Id$
 */
public class TeFieldTag extends FieldTag {

    public int doEndTag() throws JspTagException {
        String content = (String) helper.getValue();
        StringBuffer sb = new StringBuffer();
        sb.append("<div class=\"");
        //sb.append(getNodeVar().getNodeManager().getName());

        if (getFieldVar() != null) {
            sb.append(getFieldVar().getName());
        } else {
            //fuzzy .. there is no other way
            FieldList list = getNodeVar().getNodeManager().getFields(NodeManager.ORDER_CREATE);
            for (int x = 0; x < list.size(); x++) {
                Field nodeManagerfield = list.getField(x);
                if (fieldName.indexOf(nodeManagerfield.getName()) != -1) {
                    sb.append(nodeManagerfield.getName());
                    break;
                } else {
                    //sb.append("[");
                    //sb.append(nodeManagerfield.getName() + "/" + fieldName);
                    //sb.append("]");
                }
            }

        }
        sb.append("\" ");
        if (pageContext.getRequest().getAttribute("wb") != null) {
            WhiteBoard wb = (WhiteBoard) pageContext.getRequest().getAttribute("wb");
            if (wb.getProperty("edit") != null) {
                sb.append(" onMouseOver=\"select(this);\" onMouseOut=\"unselect();\" ");
            }
        }
        sb.append(">");
        sb.append(content);
        sb.append("</div>");
        helper.setValue(sb.toString());
        return helper.doEndTag();
    }

}
