/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.io.*;
/**
 * @author Kees Jongenburger
 */
public interface LayoutManager {
    public void render(WhiteBoard wb,Container container, PrintWriter pw) throws Exception;
}
