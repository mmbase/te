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
public abstract class AbstractResolvingNavigation extends AbstractNavigation implements NavigationResolver {

    public static void main(String[] args) {
    }

    public Navigation resolveNavigation(String path, WhiteBoard wb) {
		StringTokenizer st = new StringTokenizer(path, NavigationControl.PATH_SEPARATOR);
        Navigation currentNavigation = this;
        while (st.hasMoreTokens()) {
            String currentPath = st.nextToken();
            Navigations navigations = currentNavigation.getChildNavigations();
            for (int x = 0; x < navigations.size(); x++) {
                AbstractNavigation navigation = navigations.getNavigation(x);
                if (navigation.getURLString().equals(currentPath)) {
                    if (navigation instanceof NavigationResolver) {
                        StringTokenizer newTokenizer = new StringTokenizer(path, NavigationControl.PATH_SEPARATOR, true);
                        if (newTokenizer.countTokens() > 2) {
                            newTokenizer.nextToken(); // the current nav
                            newTokenizer.nextToken(); // the delimiter
                            StringBuffer newPath = new StringBuffer();
                            while (newTokenizer.hasMoreTokens()) {
                                newPath.append(newTokenizer.nextToken());
                            }
                            return ((NavigationResolver) navigation).resolveNavigation(newPath.toString(), wb);
                        }
                    }
                    currentNavigation = navigation;
                    break;
                }
            }
        }
        return currentNavigation;
    }
}
