/*
 * Created on Sep 26, 2003
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package org.mmbase.applications.te;

/**
 * @author keesj
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class NavigationParam extends StaticNavigation {
	private String field;
	private String guifield;
	private String type;
	public NavigationParam(String id , String name,String field , String guifield,String type){
		super(id,name);
		this.field = field;
		this.guifield = guifield;
		this.type = type;
	}
    
    /**
     * @return
     */
    public String getField() {
        return field;
    }

    /**
     * @return
     */
    public String getGuifield() {
        return guifield;
    }

    /**
     * @return
     */
    public String getType() {
        return type;
    }

}
