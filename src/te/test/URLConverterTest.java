/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.test;

import junit.framework.TestCase;
import te.util.*;
/**
 * @author Kees Jongenburger
 */
public class URLConverterTest extends TestCase {

    /**
     * Constructor for URLConverterTest.
     * @param arg0
     */
    public URLConverterTest(String arg0) {
        super(arg0);
    }

    public void testSpaces() {
        String test = "hello I am testing this string";
        String answer = URLConverter.toURL(test);
        assertTrue("String " + answer + " converted from " + test + "sould not contain % sings", answer.indexOf('%') == -1);
    }

    public void testSingleQuote() {
        String test = "hello I'm testing this string";
        String answer = URLConverter.toURL(test);
        assertTrue("String " + answer + " converted from " + test + "sould not contain % sings", answer.indexOf('%') == -1);
    }

    public void testQuote() {
        String test = "hello I am \"happy\" testing this string";
        String answer = URLConverter.toURL(test);
        assertTrue("String " + answer + " converted from " + test + "sould not contain % sings", answer.indexOf('%') == -1);
    }
    
    public void testAmp() {
        String test = "simon & garfunkel";
        String answer = URLConverter.toURL(test);
        assertTrue("String " + answer + " converted from " + test + "sould not contain % sings", answer.indexOf('%') == -1);
    }
}
