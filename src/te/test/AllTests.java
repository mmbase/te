/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.test;

import junit.framework.*;
import junit.textui.TestRunner;

/**
 * @author Kees Jongenburger
 */
public class AllTests {

    public static Test suite() {
        TestSuite suite = new TestSuite("Test for te.test");
        //$JUnit-BEGIN$
        
		//suite.addTestSuite(URLConverterTest.class);
		suite.addTestSuite(FacadeTest.class);
        //$JUnit-END$
        return suite;
    }
    
    public static void main(String[] argv){
    	TestRunner.run(suite());
    }
}
