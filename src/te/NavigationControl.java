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
public abstract class NavigationControl implements NavigationResolver {
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
    public Navigation resolveNavigation(String path, WhiteBoard wb) {

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
            if (currentNavigation instanceof NavigationResolver) {
                StringTokenizer newTokenizer = new StringTokenizer(path, PATH_SEPARATOR, true);
                if (newTokenizer.countTokens() > 2) {

                    newTokenizer.nextToken(); // the current nav
                    newTokenizer.nextToken(); // the delimiter
                    StringBuffer newPath = new StringBuffer();
                    while (newTokenizer.hasMoreTokens()) {
                        newPath.append(newTokenizer.nextToken());
                    }
                    currentNavigation = ((NavigationResolver) currentNavigation).resolveNavigation(newPath.toString(), wb);
                }
            } else {
                Navigations navigations = currentNavigation.getChildNavigations();
                for (int x = 0; x < navigations.size(); x++) {
                    AbstractNavigation navigation = navigations.getNavigation(x);
                    if (navigation.getURLString().equals(currentPath)) {
                        currentNavigation = navigation;
                        break;
                    }
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
