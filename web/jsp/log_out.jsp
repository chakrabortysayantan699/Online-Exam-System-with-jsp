<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>

<%

session.setAttribute("uname",null);
session.setAttribute("uid",0);
session.invalidate();
response.sendRedirect("index.html");
// String a=session.getAttribute("uname").toString();
// System.out.println(a);


 %>