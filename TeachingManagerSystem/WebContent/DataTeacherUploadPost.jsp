<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>


<%
   //���ñ����ʽ 
    request.setCharacterEncoding("utf-8");
    String UserNo=(String)session.getAttribute("UserNo");
    //��ȡϵͳʱ�䲢��ʽ�����
    java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.util.Date Now=new java.util.Date();
    String time=formatter.format(Now);
//���ظ���
try
{
request.setCharacterEncoding("GBK");
mySmartUpload.initialize(pageContext);
mySmartUpload.service(request,response);
mySmartUpload.upload();
String filename=mySmartUpload.getFiles().getFile(0).getFileName();
String datapath="/download/";
//�ļ������Ŀ¼Ϊupload
mySmartUpload.save(datapath);
 //enctype="multipart/form-data"����ֱ��ȡ��ȡ����ֵ��
//su.getRequest().getParameterValues();ȡ����ֵ
//su.getRequest().getParameter();ȡ������������ֵ             
String dataContent     =mySmartUpload.getRequest().getParameter("dataContent");
String datasender      =mySmartUpload.getRequest().getParameter("datasender");
String dataremark      =mySmartUpload.getRequest().getParameter("remark");
 //֧�ֿɸ��µ����ݼ�
Statement st = conn.createStatement();
st.executeUpdate("INSERT INTO data(dataContent,datasender,teacherNo,dataremark,datapath,time,datafilename) values('"+dataContent+"','"+datasender+"','"+UserNo+"','"+dataremark+"','"+datapath+"','"+time+"','"+filename+"')"); 
 }
catch(Exception e)
{ 
e.printStackTrace();
}  
   
 
 conn.close();
response.sendRedirect("DataTeacherUploadShow.jsp");
%>
