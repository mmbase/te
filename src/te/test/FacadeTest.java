/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.test;

import java.util.Stack;

import te.*;
import junit.framework.TestCase;

/**
 * @author Kees Jongenburger
 */
public class FacadeTest extends TestCase {

    TestFacadeImpl facade;
    /**
     * Constructor for FacadeTest.
     * @param arg0
     */
    public FacadeTest(String arg0) {
        super(arg0);
    }

    public void testGetRootNavigation() {
        NavigationControl c = facade.getNavigationControl();
        Navigation nav = c.getNavigation();

        String rootURL = nav.getURLString();

        Navigation nav2 = c.getNavigation(rootURL);
        assertNotNull(nav2);

        assertTrue("navigation are not the same instance", nav == nav2);
    }

    public void testAllNavigation() {
        
		NavigationControl c = facade.getNavigationControl();
        Stack stack = new Stack();
        stack.push(c.getNavigation());

        while (!stack.empty()) {
            Navigations navs = ((Navigation) stack.pop()).getChildNavigations();
            for (int x = 0; x < navs.size(); x++) {
                //get a navigation object
                Navigation n = navs.getNavigation(x);
                //put it on the stack for later 
                stack.push(n);

				assertNotNull(n);
                //get the url of the navigation
                String realURL = c.getURLString(n);
				System.err.println(realURL);
                //aks the navigationComponent back
                //what navigation belongs to the url
                Navigation n2 = c.getNavigation(realURL);

                //this must not return null since the url was generated from the navigation object
                assertNotNull(n2);

                //and it must be the same a the original navigation
                assertTrue("search for navigation " + realURL + "failed", n == n2);                
            }
        }
    }

    protected void setUp() throws Exception {
        super.setUp();
        facade = new TestFacadeImpl();
    }

}
