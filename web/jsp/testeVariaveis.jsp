<%-- 
    Document   : newjsp
    Created on : 25/10/2016, 15:25:55
    Author     : rui
--%>

<%@page import="java.util.Enumeration"%>
<%@ page import = "java.util.Map" %>

<%

    Enumeration paramNames = request.getParameterNames();
    while (paramNames.hasMoreElements()) {
        String paramName
                = (String) paramNames.nextElement();
        out.print("<br>" + paramName +": "+ request.getParameter(paramName));
    }

%>

