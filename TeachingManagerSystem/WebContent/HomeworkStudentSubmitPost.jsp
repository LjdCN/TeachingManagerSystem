<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>


<%
    //��ȡϵͳʱ�䲢��ʽ�����
    java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.util.Date Now=new java.util.Date();
    String time=formatter.format(Now);
   //���ñ����ʽ 
    request.setCharacterEncoding("utf-8");
    String UserNo=(String)session.getAttribute("UserNo");
    Statement ststudent = conn.createStatement();
    ResultSet rsstudent = ststudent.executeQuery("select * from studentInfo where(studentNo='"+UserNo+"')");
    if(rsstudent.next()){
    String studentName=rsstudent.getString("studentName");
    String studentNo  =rsstudent.getString("studentNo");  
    
//���ظ���
try
{
request.setCharacterEncoding("GBK");
mySmartUpload.initialize(pageContext);
mySmartUpload.service(request,response);
mySmartUpload.upload();
String filename=mySmartUpload.getFiles().getFile(0).getFileName();
String path="/upload/";
//�ļ������Ŀ¼Ϊupload
mySmartUpload.save(path);
 //enctype="multipart/form-data"����ֱ��ȡ��ȡ����ֵ��
//su.getRequest().getParameterValues();ȡ����ֵ
//su.getRequest().getParameter();ȡ������������ֵ             
String homeworkNo     =mySmartUpload.getRequest().getParameter("homeworkNo");
String homeworkContent=mySmartUpload.getRequest().getParameter("homeworkContent");
String homeworkremark =mySmartUpload.getRequest().getParameter("remark");
 //֧�ֿɸ��µ����ݼ�
Statement st = conn.createStatement();
st.executeUpdate("INSERT INTO homework1(homeworkNo,homeworkContent,homeworksender,studentNo,homeworkremark,homeworkpath,time,homeworkname) values('"+homeworkNo+"','"+homeworkContent+"','"+studentName+"','"+studentNo+"','"+homeworkremark+"','"+path+"','"+time+"','"+filename+"')"); 
 }
catch(Exception e)
{ 
e.printStackTrace();
}  
   
 }
 conn.close();
response.sendRedirect("HomeworkStudentShow.jsp");
%>
