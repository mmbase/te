/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te.util;

import javax.servlet.http.*;

/**
 * Wrapper around a HttpServletRequest.
 */
public class RequestWrapper extends HttpServletRequestWrapper {
    /**
     * Public constructor
     */
    public RequestWrapper(HttpServletRequest req) {
        super(req);
    }
}
