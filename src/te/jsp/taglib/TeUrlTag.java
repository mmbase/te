package te.jsp.taglib;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import org.mmbase.bridge.jsp.taglib.*;
import te.*;
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
            if (np!= null){
            	name = np.getNodeVar().getNodeManager().getName();
            }
            WhiteBoard wb = (WhiteBoard) pageContext.getRequest().getAttribute("wb");
            if (wb != null) {
                Facade facade = wb.getFacade();
                pageContext.getOut().write(wb.getCurrentNavigation().getFullURLString() + " " + name + "!");
            } else {
                pageContext.getOut().write(" " + name + "!");
            }
        } catch (java.io.IOException e) {
            throw new JspTagException("IO Error: " + e.getMessage());
        }
        return EVAL_PAGE;
    }
}
