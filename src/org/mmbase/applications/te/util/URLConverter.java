/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te.util;

import java.net.URLEncoder;

import org.mmbase.util.logging.*;
/**
 * @author Kees Jongenburger
 */
public abstract class URLConverter {
    private static Logger log = Logging.getLoggerInstance(URLConverter.class);

    /**
     * encode a string to be used in an url
     * this method lowercases the text
     * replaces spaces quotes an double quotes and amp sings to underscores
     * after convertion is finished the java.net.URLEncoder is called
     * to encode the remaining miscoded chars this is a onw way operation in order to keep the url pretty
     * @param text
     * @return the encoded url
     */
    public static String toURL(String text) {

        char[] chars = text.toLowerCase().toCharArray();

        StringBuffer sb = new StringBuffer();

        for (int x = 0; x < chars.length; x++) {
            char current = chars[x];
            switch (current) {
                case ' ' :
                case '"' :
                case '&' :
                    sb.append('_');
                case '\'' :
                    break;
                default :
                    sb.append(current);
            }
        }
        return URLEncoder.encode(sb.toString());
        //		java 1.4
        /* try {
        	return URLEncoder.encode(sb.toString(), Facade.encoding);
        } catch (UnsupportedEncodingException e) {
            log.debug(Logging.stackTrace(e));
        }
        */
        
    }
}
