/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import te.*;
import org.mmbase.util.logging.*;
import java.util.*;

/**
 * @author keesj
 * @version $Id$
 */
public class ItemsNavigation extends AbstractNavigation {
	//TODO:EpisodeNavigation and ItemsNavigation need to be made generic
	private static Logger log = Logging.getLoggerInstance(ItemsNavigation.class);
	 String name = "items";
	 String id = "items";

	 public ItemsNavigation() {
		 super();
	 }

	 public String getID() {
		 return id;
	 }

	 public String getName() {
		 return name;
	 }

	 public Navigations getChildNavigations() {
		 return  new Navigations();
	 }

	 public Navigation resolveNavigation(String path, WhiteBoard wb) {
		 StringTokenizer st = new StringTokenizer(path, NavigationControl.PATH_SEPARATOR, true);

		 //the current nav
		 if (st.hasMoreTokens()) {
			 String name = st.nextToken();
			 if (!name.equals(getURLString())) {
				 return null;
			 }
		 }
		 //the separator
		 if (st.hasMoreTokens()) {
			 st.nextToken();
		 } else {
			 //if there was not spearator .. this navigation is the current navigation
			 return this;
		 }

		 //the episode number
		 if (st.hasMoreTokens()) {
			 String number = st.nextToken();
			 try {
				 Integer.parseInt(number);
				 log.debug("current item = " + number);
				 wb.getHttpServletRequest().setAttribute("items", number);
			 } catch (NumberFormatException e) {
				 //hmm this was not an episode number
				 StringBuffer newPath = new StringBuffer();
				 newPath.append(number);
				 while (st.hasMoreTokens()) {
					 newPath.append(st.nextToken());
				 }
				 return super.resolveNavigation(newPath.toString(), wb);
			 }
		 }
		 //delimiter
		 if (st.hasMoreTokens()) {
			 st.nextToken();
		 }
		 StringBuffer newPath = new StringBuffer();
		 newPath.append(getURLString());
		 newPath.append("/");
		 while (st.hasMoreTokens()) {
			 newPath.append(st.nextToken());
		 }
		 return super.resolveNavigation(newPath.toString(), wb);
	 }
}
