/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import te.jsp.JSPComponent;

/**
 * @author keesj
 * @version $Id$
 */
public class ProgrammaSiteNavigationComponent extends JSPComponent {
    public boolean showLogs = false; //log
    public boolean showForums = false; //Form
    public boolean showBinders = false; //Dossiers
    public boolean showArchives = false; //Dossiers

    public ProgrammaSiteNavigationComponent() {
        super("/te/component/navigation.jsp");
    }

    /**
     * @return
     */
    public boolean isShowArchives() {
        return showArchives;
    }

    /**
     * @return
     */
    public boolean isShowBinders() {
        return showBinders;
    }

    /**
     * @return
     */
    public boolean isShowForums() {
        return showForums;
    }

    /**
     * @return
     */
    public boolean isShowLogs() {
        return showLogs;
    }

    /**
     * @param b
     */
    public void setShowArchives(boolean b) {
        showArchives = b;
    }

    /**
     * @param b
     */
    public void setShowBinders(boolean b) {
        showBinders = b;
    }

    /**
     * @param b
     */
    public void setShowForums(boolean b) {
        showForums = b;
    }

    /**
     * @param b
     */
    public void setShowLogs(boolean b) {
        showLogs = b;
    }

}
