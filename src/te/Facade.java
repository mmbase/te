/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

/**
 * @author Kees Jongenburger
 */
public abstract class Facade {
    public final static String DEFAULT_ENCODING = "UTF-8";
    public static String encoding = DEFAULT_ENCODING;
    public String engineURL = null;
    
    public abstract NavigationControl getNavigationControl();
    
    public void setEngineURL(String engineurl){
    	this.engineURL = engineurl;
    }
    
    public String getEngineURL(){
    	return engineURL;
    }
}