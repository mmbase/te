package te.jsp.taglib;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import org.mmbase.bridge.jsp.taglib.*;
import te.*;
import java.util.*;
public class TeUrlTag extends TagSupport {

    private String name = "";

    public TeUrlTag() {
        super();
    }

    public void setName(String name) {
        this.name = name;
    }

    public int doEndTag() throws javax.servlet.jsp.JspTagException {
        try {
            NodeProvider np = (NodeProvider) findAncestorWithClass(this, NodeProvider.class);
            WhiteBoard wb = (WhiteBoard) pageContext.getRequest().getAttribute("wb");
            if (np == null) {
                pageContext.getOut().write(" url tag not in node provider" + name + "!");
                return EVAL_PAGE;
            }
            if (wb == null) {
                pageContext.getOut().write("no whiteboard in context!");
                return EVAL_PAGE;
            }

            String type = np.getNodeVar().getNodeManager().getName();

            Facade facade = wb.getFacade();
            List list = new Vector();
            list.add(np.getNodeVar());
            String content  = facade.getNavigationControl().resoveURL(wb.getCurrentNavigation(),list);
            // FIXME: yup
            //String url = facade.getNavigationControl().findUrlString(wb.getCurrentNavigation(),type);
            pageContext.getOut().write(content);

        } catch (java.io.IOException e) {
            throw new JspTagException("IO Error: " + e.getMessage());
        }
        return EVAL_PAGE;
    }
}
