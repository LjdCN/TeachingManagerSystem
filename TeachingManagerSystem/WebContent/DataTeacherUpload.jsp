<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>
<%
   //���ñ����ʽ 
    request.setCharacterEncoding("utf-8");
    String UserNo=(String)session.getAttribute("UserNo");
    Statement st = conn.createStatement();
    String sql="select * from teacherInfo where(teacherNo='"+UserNo+"')";
    ResultSet rs=st.executeQuery(sql);
    rs.next();
%>
<html>
<head><title>���Ϸ���ҳ��</title>
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:550px;
	height:200px;
	z-index:1;
	top: 250px;
	left:395px;
}
#Layer2 {
	position:absolute;
	width:300px;
	height:200px;
	z-index:1;
	top: 230px;
	left:290px;
}
#Layer3 {
	position:absolute;
	width:300px;
	height:200px;
	z-index:1;
	top: 20px;
	left:350px;
}
#Layer4 {
	position:absolute;
	width:300px;
	height:200px;
	z-index:1;
	top: 80px;
	left:290px;
}
#Layer5 {
	position:absolute;
	width:300px;
	height:200px;
	z-index:1;
	top: 185px;
	left:290px;
}
-->
</style>
</head>
<body background="images/forgetpassword.png" scroll="no">
<br><br>
  <div id="Layer2"><hr align="center" width="715" color="blue"></div>
  <div id="Layer3"><h1><font size="5" color="blue">��ѧ����ϵͳ������Ϣ</h1></div>
  <div id="Layer4"><p><font size="6" color="white">���Ϸ�����</font></p></div>
  <div id="Layer5"><p><font size="4" color="blue" ><a href="DataTeacherUploadShow.jsp" style="text-decoration:none">����</a></font><font size="4" color="black">>���Ϸ���</font></p></div>
<div id="Layer1">
<%response.setCharacterEncoding("GBK"); %>
<form  action="DataTeacherUploadPost.jsp" method="post" name="form1" enctype="multipart/form-data" >
<table>
<tr>
<td>���ϱ���</td><td><input type="text"  name="dataContent" ></td>
</tr>
<tr>
<td>���Ϸ��ͷ�</td><td><input type="text"  name="datasender" value="<%=rs.getString("teacherName")%>"></td>
</tr>
<tr>
<td>��ע</td><td><textarea  rows="7" cols="50" name="remark" ></textarea></td>
</tr>
<tr>
<td colspan="2"><font color=blue size=3>��ѡ���ļ��ϴ���</font><input type="file" name="myfile"></td>
</tr>
<tr>
<td colspan="2" align="right"><input type="submit" value="�ύ" ></td>
</tr>
</table>
</form>
</div>
</body>
</html>
<%
    conn.close();
%>












