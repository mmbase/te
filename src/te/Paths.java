/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.util.*;

/**
 * @author keesj
 * @version $Id$
 */
public class Paths extends Vector {
    public Path getPath(int index) {
        return (Path) get(index);
    }
}
