/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

/**
 * @author keesj
 * @version $Id$
 * holder for information about programma sites
 */
public class ProgrammaSite {
	/**
	 * the node number / alias of the programma site (maps object number or alias)
	 */
	private String siteRootAlias;
	
	/**
	 * template voor de voorpagina
	 */
	private String frontPageTemplate;
	 
    /**
     * @return
     */
    public String getFrontPageTemplate() {
        return frontPageTemplate;
    }

    /**
     * @return
     */
    public String getSiteRootAlias() {
        return siteRootAlias;
    }

    /**
     * @param string
     */
    public void setFrontPageTemplate(String string) {
        frontPageTemplate = string;
    }

    /**
     * @param string
     */
    public void setSiteRootAlias(String string) {
        siteRootAlias = string;
    }

}
