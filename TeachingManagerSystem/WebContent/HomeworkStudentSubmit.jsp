<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>
<%
	String homeworkId = request.getParameter("homeworkId");
	String sql = "select * from homeworkInfo where homeworkId=" + homeworkId;
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	//�ƶ�����һ��
	rs.next();
%>
<html>
<head><title>��ҵ�ϴ�ҳ��</title>
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:500px;
	height:260px;
	overflow-y:auto;
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
	left:220px;
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
  <div id="Layer4"><p><font size="6" color="white">��ҵ�ύ��</font></p></div>
  <div id="Layer5"><p><font size="4" color="blue" ><a href="HomeworkStudentShow.jsp" style="text-decoration:none">����</a></font><font size="4" color="black">>��ҵ�ύ</font></p></div>
<div id="Layer1">
<%response.setCharacterEncoding("GBK"); %>
<form  action="HomeworkStudentSubmitPost.jsp" method="post" name="form1" enctype="multipart/form-data" >
��ҵ������
<input type="text"  name="homeworkNo" value="<%=rs.getString("homeworkNo")%>"><BR><BR>
��ҵ���ݣ�
<input type="text"  name="homeworkContent" value="<%=rs.getString("homeworkContent")%>"><BR><BR>
<font color=black size=3>��ע��</font><BR>
<textarea  rows="7" cols="50" name="remark" ></textarea><BR><BR>
<font color=blue size=3>��ѡ���ļ��ϴ���</font>
<input type="file" name="myfile"><BR><BR>
<input type="submit" value="�ύ">
</form>


</div>
</body>
</html>
<%
    conn.close();
%>












