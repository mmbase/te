/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.util.StringTokenizer;

/**
 * @author Kees Jongenburger
 */
public abstract class NavigationControl {
    /**
     * String PATH_SEPARATOR ="/";
     */
    public final static String PATH_SEPARATOR = "/";

    /** 
     * @return the root navigation
     */
    public abstract Navigation getNavigation();

    /** 
     * @param path navigation path separated by  PATH_SEPARATOR tokens
     * <b>examples:</b><br>
     * <ul>
     *     <li>programmas/nieuws</li>
     *     <li>programmas/tv/ram</li>
     *     <li>programma/radio/ochtenden</li>
     * </ul>
     * @return the navigation of null if not found
     */
    public Navigation getNavigation(String path) {

        StringTokenizer st = new StringTokenizer(path, PATH_SEPARATOR);

        Navigation currentNavigation = getNavigation();

        //the first token must of course be the "root" navigation
        //if that does no match we return null
        if (st.hasMoreTokens()) {
            String currentPath = st.nextToken();
            if (!currentPath.equals(currentNavigation.getURLString())) {
                return null;
            }
        }

        while (st.hasMoreTokens()) {
            String currentPath = st.nextToken();
            Navigations navigations = currentNavigation.getChildNavigations();
            for (int x = 0; x < navigations.size(); x++) {
                Navigation navigation = navigations.getNavigation(x);
                if (navigation.getURLString().equals(currentPath)) {
                    currentNavigation = navigation;
                    break;
                }
            }

        }
        return currentNavigation;
    }

    public String getURLString(Navigation navigation) {
        StringBuffer sb = new StringBuffer();
        sb.append(navigation.getURLString());
        while (!navigation.isRootNavigation()) {
            navigation = navigation.getParentNavigation();
            sb.insert(0, PATH_SEPARATOR);
            sb.insert(0, navigation.getURLString());
        }
        return sb.toString();
    }

    public abstract Template getTemplate(Navigation navigation);
}
