/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.util;

import org.mmbase.bridge.*;

import java.util.*;
import java.io.*;
import minixml.*;
/**
 * @author keesj
 * @version $Id$
 */
public class TemplateImport {
    public static void main(String[] argv) throws IOException {
        CloudContext cloudContext = ContextProvider.getCloudContext("rmi://localhost:1111/templates");
        HashMap user = new HashMap();
        user.put("username", "admin");
        user.put("password", "admin2k");
        Cloud cloud = cloudContext.getCloud("mmbase", "name/password", user);
        //Cloud cloud = cloudContext.getCloud("mmbase");
        NodeManager nm = cloud.getNodeManager("tetemplates");
        File dir = new File("/home/keesj/work/te/src/nl/vpro");
        if (dir.isDirectory()) {
            File[] fileList = dir.listFiles();
            for (int x = 0; x < fileList.length; x++) {
                File f = fileList[x];
                if (f.isFile()) {
                    if (f.getName().toLowerCase().endsWith(".xml")) {
                        //System.err.println(f.getName());
                        String name = f.getName().substring(0, f.getName().length() - 4);
                        String content = readFile(f);
                        //System.err.println(content);
                        NodeList list = nm.getList("name = '" + name + "' ", null, null);
                        if (list.size() == 0) {
                            System.err.println("importing a new template{" + name + "} ");
                            try {
                                XMLElement nodeXMLContent = new XMLElement();
                                nodeXMLContent.parseString(content);
                                Node newNode = nm.createNode();
                                newNode.setStringValue("name", name);
                                newNode.setStringValue("content", content);
								newNode.setStringValue("description", nodeXMLContent.getProperty("description"));
                                newNode.commit();
                            } catch (Exception e) {
                                System.err.println("template " + f.getPath() + " does not contain valid xml");
                            }
                        } else if (list.size() == 1) {
                            System.err.print("comparing " + name + ": ");
                            Node theNode = list.getNode(0);
                            String nodeContent = theNode.getStringValue("content");
                            XMLElement nodeXMLContent = new XMLElement();
                            nodeXMLContent.parseString(nodeContent);
                            XMLElement fileXMLContent = new XMLElement();
                            fileXMLContent.parseString(content);
                            if (nodeXMLContent.toString().hashCode() != fileXMLContent.toString().hashCode() ) {
                                System.err.println("differ updating");
                                theNode.setStringValue("content", content);
								theNode.setStringValue("description", fileXMLContent.getProperty("description"));
                                theNode.commit();
                            } else {
                                System.err.println("are the same ");
                            }
                        }
                    }
                }
            }
        }
    }

    public static String readFile(File file) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
        StringWriter sw = new StringWriter();
        String data = null;
        while ((data = br.readLine()) != null) {
            sw.write(data);
            sw.write("\n");
        }
        return sw.toString();
    }
}
