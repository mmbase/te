/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te.util;

import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;

/**
 * Wrapper around a PrintWriter, that can cast to a ServletOutputStream
 */
public class PrintWriterServletOutputStream extends ServletOutputStream {
    private PrintWriter printWriter;

    /**
     * Public constructor
     */
    public PrintWriterServletOutputStream(PrintWriter printWriter) {
        this.printWriter = printWriter;
    }

    /**
     * Write a character to the PrintWriter
     */
    public void write(int i) {
        printWriter.write(i);
    }
}
