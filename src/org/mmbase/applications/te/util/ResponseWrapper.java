/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te.util;

import java.io.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;

import org.mmbase.util.logging.*;

/**
 * Wrapper around the response. It collects all data that is sent to it, and 
 * makes it available through a toString() method.
 */
public class ResponseWrapper extends HttpServletResponseWrapper {

    private static String DEFAULT_CHARSET = org.mmbase.applications.te.Facade.encoding;
    private static String DEFAULT_CONTENTTYPE = "text/html";
    private static Logger log = Logging.getLoggerInstance(ResponseWrapper.class);

    private PrintWriter writer;
    private PrintWriterServletOutputStream msos;
    private String contentType = DEFAULT_CONTENTTYPE;
    private String characterEncoding = DEFAULT_CHARSET;


    /**
     * Public constructor
     */
    public ResponseWrapper(HttpServletResponse resp, PrintWriter writer) {
        super(resp);
        //caw = new CharArrayWriter();
        //writer = new PrintWriter(caw);
        this.writer = writer;
        msos = new PrintWriterServletOutputStream(writer);
    }

    /**
     * Return the OutputStream. This is a 'MyServletOutputStream' that
     * wraps around the PrintWriter
     */
    public ServletOutputStream getOutputStream() throws java.io.IOException {
        return msos;
    }

    /**
     * Return the PrintWriter
     */
    public PrintWriter getWriter() throws java.io.IOException {
        return writer;
    }

    /**
     * Return all data that has been written to the PrintWriter.
     */
    public String toString() {
        writer.flush();
        return writer.toString();
    }

    /**
     * Sets the content type of the response being sent to the
     * client. The content type may include the type of character
     * encoding used, for example, text/html; charset=ISO-8859-4.  If
     * obtaining a PrintWriter, this method should be called first.
     */
    public void setContentType(String ct) {
        if (ct == null) {
            contentType = DEFAULT_CONTENTTYPE;
        } else {
            contentType = ct;
        }
        int i = contentType.indexOf("charset=");
        if (i >= 0) {
            characterEncoding = contentType.substring(i + 8);
            characterEncoding.trim();
        } else {
            characterEncoding = DEFAULT_CHARSET;
        }
        if (log.isDebugEnabled()) {
            //log.debug("set content type of include page to: '" + contentType + "' (and character encoding to '" + characterEncoding + "')");
        }
    }

    /**
     * Returns the name of the charset used for the MIME body sent in this response.
     * If no charset has been assigned, it is implicitly set to ISO-8859-1 (Latin-1).
     * See RFC 2047 (http://www.ietf.org/rfc/rfc2045.txt) for more information about character encoding and MIME.
     * returns the encoding
     */
    public String getCharacterEncoding() {
        //log.debug(characterEncoding);
        return characterEncoding;
    }
    /* (non-Javadoc)
     * @see javax.servlet.http.HttpServletResponse#addHeader(java.lang.String, java.lang.String)
     */
    public void addHeader(String arg0, String arg1) {
    	log.debug("adding header " + arg0  + " = " + arg1);
        super.addHeader(arg0, arg1);
    }

}
