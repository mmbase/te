/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import te.jsp.JSPContainer;

/**
 * @author keesj
 * @version $Id$
 */
public class ProgrammaSiteContainer extends JSPContainer {

    public ProgrammaSiteContainer() {
        super("/te/container/programmasites.jsp", new ProgrammaSiteLayoutManager());
    }
}
