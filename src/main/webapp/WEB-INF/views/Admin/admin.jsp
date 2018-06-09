<!DOCTYPE html>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFAnchor"%>
<%@page import="org.apache.poi.ss.usermodel.Color"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.util.List"%>
<%@page import="com.enggcell.entities.Registrations"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>EnggCell admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/admin/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/admin/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/admin/bower_components/Ionicons/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/admin/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/admin/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/admin/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<style type="text/css">

#login-modal .modal-dialog, #login-modal2 .modal-dialog {
    width: 350px;
}

#login-modal input[type=text], input[type=password], #login-modal2 input[type=text]{
	margin-top: 10px;
}

#div-login-msg,
#div-lost-msg,
#div-register-msg {
    border: 1px solid #dadfe1;
    height: 30px;
    line-height: 28px;
    transition: all ease-in-out 500ms;
}

#div-login-msg.success,
#div-lost-msg.success,
#div-register-msg.success {
    border: 1px solid #68c3a3;
    background-color: #c8f7c5;
}

#div-login-msg.error,
#div-lost-msg.error,
#div-register-msg.error {
    border: 1px solid #eb575b;
    background-color: #ffcad1;
}

#icon-login-msg,
#icon-lost-msg,
#icon-register-msg {
    width: 30px;
    float: left;
    line-height: 28px;
    text-align: center;
    background-color: #dadfe1;
    margin-right: 5px;
    transition: all ease-in-out 500ms;
}

#icon-login-msg.success,
#icon-lost-msg.success,
#icon-register-msg.success {
    background-color: #68c3a3 !important;
}

#icon-login-msg.error,
#icon-lost-msg.error,
#icon-register-msg.error {
    background-color: #eb575b !important;
}

#img_logo {
    max-height: 100px;
    max-width: 100px;
}

.modal-backdrop.in {
    filter: alpha(opacity=50);
    opacity: .8;
}

.modal-content {
    background-color: #ececec;
    border: 1px solid #bdc3c7;
    border-radius: 0px;
    outline: 0;
}

.modal-header {
    min-height: 16.43px;
    padding: 15px 15px 15px 15px;
    border-bottom: 0px;
}

.modal-body {
    position: relative;
    padding: 5px 15px 5px 15px;
}

.modal-footer {
    padding: 15px 15px 15px 15px;
    text-align: left;
    border-top: 0px;
}

.checkbox {
    margin-bottom: 0px;
}

.btn {
    border-radius: 3px;
}

.btn:focus,
.btn:active:focus,
.btn.active:focus,
.btn.focus,
.btn:active.focus,
.btn.active.focus {
    outline: none;
}

.btn-lg, .btn-group-lg>.btn {
    border-radius: 0px;
}

.btn-link {
    padding: 5px 10px 0px 0px;
    color: #95a5a6;
}

.btn-link:hover, .btn-link:focus {
    color: #2c3e50;
    text-decoration: none;
}

.glyphicon {
    top: 0px;
}

.form-control {
  border-radius: 0px;
}

</style>


</head>
<body class="hold-transition skin-blue sidebar-mini">
<script type="text/javascript">
function editDetails(id, branch, city, fullName, email, mobile, dob, gender, panOrAadhar, 
		passingYear, companies, status, address, college, resume, bookingId){
	$("#hidId").val(id);
	$("#updateBranch").val(branch);
	$("#updateCity").val(city);
	$("#updateFullName").val(fullName);
	$("#updateEmail").val(email);
	$("#updateMobile").val(mobile);
	$("#updateGender").val(gender);
	$("#updatePanOrAadhar").val(panOrAadhar);
	$("#updatePassingYear").val(passingYear);
	$("#updateCompanies").val(companies);
	$("#updateAddress").val(address);
	$("#updateStatus").val(status);
	$("#updateBookingId").val(bookingId);
	$("#updateCollege").val(college);
	//$("#updateResume").val(resume);
}

</script>
<%
List<Registrations> registrations = null;
if (request.getAttribute("adminStudentsList") != null && !request.getAttribute("adminStudentsList").equals("")) {
	registrations = (List<Registrations>) request.getAttribute("adminStudentsList");
    //regId = registrations.getRegId();
}
try{
if(registrations != null){
	//XSSFWorkbook workbook = new XSSFWorkbook();
	//XSSFSheet spreadSheet = workbook.createSheet("Registrations");
	/*FileInputStream fis = new FileInputStream(new File(request.getServletContext().getRealPath("/") + "/assets/admin/Files/Enggcell.xlsx"));
	Workbook wb = WorkbookFactory.create(fis);
	Sheet sheet = wb.getSheet("Registrations");*/
	HSSFWorkbook workbook = new HSSFWorkbook();
	HSSFSheet sheet = workbook.createSheet("Registrations");
	
	Row rowHeading = sheet.createRow(0);
	rowHeading.createCell(0).setCellValue("S No.");
	rowHeading.createCell(1).setCellValue("Date");
	rowHeading.createCell(2).setCellValue("Applying For");
	rowHeading.createCell(3).setCellValue("Name");
	rowHeading.createCell(4).setCellValue("Address");
	rowHeading.createCell(5).setCellValue("Email");
	rowHeading.createCell(6).setCellValue("College Name");
	rowHeading.createCell(7).setCellValue("Contact");
	rowHeading.createCell(8).setCellValue("DOB");
	rowHeading.createCell(9).setCellValue("Gender");
	rowHeading.createCell(10).setCellValue("PAN/Aadhar");
	rowHeading.createCell(11).setCellValue("Companies");
	rowHeading.createCell(12).setCellValue("City (filter)");
	rowHeading.createCell(13).setCellValue("Payment Status");
	rowHeading.createCell(14).setCellValue("Booking Id");
	
	CellStyle styleRow1 = workbook.createCellStyle();
	Font font1 = workbook.createFont();
	font1.setBold(true);
	font1.setColor(HSSFFont.COLOR_NORMAL);
	font1.setFontHeightInPoints((short)11);
	font1.setFontName(HSSFFont.FONT_ARIAL);
	styleRow1.setFont(font1);
	styleRow1.setVerticalAlignment(CellStyle.ALIGN_CENTER);
	
	int ii = 1;
	for(Registrations registration : registrations){
		Row row = sheet.createRow(ii);
		
		Cell cell1 = row.createCell(0);
		cell1.setCellType(cell1.CELL_TYPE_NUMERIC);
		cell1.setCellValue(ii);
		
		Cell cell2 = row.createCell(1);
		cell2.setCellType(cell2.CELL_TYPE_STRING);
		cell2.setCellValue(registration.getDate());
		
		Cell cell3 = row.createCell(2);
		cell3.setCellType(cell3.CELL_TYPE_STRING);
		cell3.setCellValue(registration.getBranch());
		
		Cell cell4 = row.createCell(3);
		cell4.setCellType(cell4.CELL_TYPE_STRING);
		cell4.setCellValue(registration.getFullName());
		
		Cell cell5 = row.createCell(4);
		cell5.setCellType(cell5.CELL_TYPE_STRING);
		cell5.setCellValue(registration.getAddress());
		
		Cell cell6 = row.createCell(5);
		cell6.setCellType(cell6.CELL_TYPE_STRING);
		cell6.setCellValue(registration.getEmail());
		
		Cell cell7 = row.createCell(6);
		cell7.setCellType(cell7.CELL_TYPE_STRING);
		cell7.setCellValue(registration.getCollege());
		
		Cell cell8 = row.createCell(7);
		cell8.setCellType(cell8.CELL_TYPE_STRING);
		cell8.setCellValue(registration.getMobile());
		
		Cell cell9 = row.createCell(8);
		cell9.setCellType(cell9.CELL_TYPE_STRING);
		cell9.setCellValue(registration.getDay() + "/" + registration.getMonth() + "/" + registration.getYear());
		
		Cell cell10 = row.createCell(9);
		cell10.setCellType(cell10.CELL_TYPE_STRING);
		cell10.setCellValue(registration.getGender());
		
		Cell cell11 = row.createCell(10);
		cell11.setCellType(cell11.CELL_TYPE_STRING);
		cell11.setCellValue(registration.getPanoraadhar());
		
		Cell cell12 = row.createCell(11);
		cell12.setCellType(cell12.CELL_TYPE_STRING);
		cell12.setCellValue(registration.getCompanies());
		
		Cell cell13 = row.createCell(12);
		cell13.setCellType(cell13.CELL_TYPE_STRING);
		cell13.setCellValue(registration.getCity());
		
		
		Cell cell14 = row.createCell(13);
		cell14.setCellType(cell14.CELL_TYPE_STRING);
		cell14.setCellValue(registration.getStatus());
		
		Cell cell15 = row.createCell(14);
		cell15.setCellType(cell15.CELL_TYPE_STRING);
		cell15.setCellValue(registration.getBookingId());
		
		CellStyle styleRow = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setColor(HSSFFont.COLOR_NORMAL);
		font.setFontHeightInPoints((short)11);
		font.setFontName(HSSFFont.FONT_ARIAL);
		styleRow.setFont(font);
		styleRow.setVerticalAlignment(CellStyle.ALIGN_CENTER);
		
		for(int j = 0; j < 15; j++){
			row.getCell(j).setCellStyle(styleRow);
			rowHeading.getCell(j).setCellStyle(styleRow1);
			sheet.autoSizeColumn(j);
		}
		
		ii++;
		
	}
	FileOutputStream outt = new FileOutputStream(new File(request.getServletContext().getRealPath("/") + "/assets/admin/Files/Enggcell.xlsx"));
	
	
	workbook.write(outt);
	outt.close();
	workbook.close();
	System.out.println("Excel file written" + request.getServletContext().getRealPath("/") + "/assets/admin/Files/Enggcell.xlsx");
}
}catch(Exception e){
	e.printStackTrace();
}
%>
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>J</b>Fair</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>Jobfair</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <div class = "row">
          <div class = "col-lg-3 col-md-4 col-sm-5 col-xs-5">
          <form id = "filterForm1" action="<%= request.getContextPath()%>/admin/filterStudentsByCityDetails" class="form-inline" method = "get">
              <div class="form-group" style="margin-top:8px;">
                  <!--  <input type="text" name = "studentCityFilter" id = "studentCityFilter" class="form-control" placeholder="Enter city">-->
                  <select name = "studentCityFilter" id = "studentCityFilter" class="form-control">
                      <option value="NCR">NCR</option>
                      <option value="Gurgaon">Gurgaon</option>
                      <option value="Banglore">Banglore</option>
                      <option value="Hyderabad">Hyderabad</option>
                      <option value="Mumbai">Mumbai</option>
                      <option value="Chennai">Chennai</option>
                      <option value="Pune">Pune</option>
                      <option value="Bhopal">Bhopal</option>
                      <option value="Ahmedabad">Ahmedabad</option>
                      <option value="Kolkata">Kolkata</option>
                  </select>
              </div>
              <button type="submit" style="margin-top:8px;" class="btn btn-default">Filter By City</button>
          </form>
          </div>
          <div class = "col-lg-4 col-md-5 col-sm-5 col-xs-5">
          <form id = "filterForm2" action="<%= request.getContextPath()%>/admin/filterStudentsByCourseDetails" class="form-inline" method = "get">
              <div class="form-group" style="margin-top:8px;">
                  <!--  <input type="text" name = "studentCourseFilter" id = "studentCourseFilter" class="form-control" placeholder="Enter Course">-->
                  <select name = "studentCourseFilter" id = "studentCourseFilter" class="form-control">
                      <option value="Non Technical">Non Technical</option>
                      <option value="B.Tech(CSE/IT)">B.Tech(CSE/IT)</option>
                      <option value="B.Tech(Civil)">B.Tech(Civil)</option>
                      <option value="B.Tech(Electrical)">B.Tech(Electrical)</option>
                      <option value="B.Tech(Electronics)">B.Tech(Electronics)</option>
                      <option value="B.Tech(Mechanical)">B.Tech(Mechanical)</option>
                      <option value="B.Tech(Automobile)">B.Tech(Automobile)</option>
                      <option value="B.Pharma">B.Pharma</option>
                      <option value="BBA">BBA</option>
                      <option value="BCA">BCA</option>
                      <option value="M.Tech(CSE/IT)">M.Tech(CSE/IT)</option>
                      <option value="M.Tech(Mechanical)">M.Tech(Mechanical)</option>
                      <option value="MCA">MCA</option>
                      <option value="MBA">MBA</option>
                      <option value="B.Sc/M.Sc(IT)">B.Sc/M.Sc(IT)</option>
                  </select>
              </div>
              <button type="submit" style="margin-top:8px;" class="btn btn-default">Filter By Course</button>
          </form>
          </div>
          <div class = "col-lg-3 col-md-4 col-sm-5 col-xs-5" style = "margin-top:8px;">
              <a href="<%= request.getContextPath() %>/assets/admin/Files/Enggcell.xlsx" class="btn btn-warning" role="button">Download as Excel File</a>
          </div>
      </div>
      
      
    </nav>
  </header>
  
  <div class="modal fade" id="login-modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="left">
				<h3 style="">Edit Company Details</h3>
				</div>
                <div id="div-forms">
                    <form id="editStu" method="post" autocomplete="off" action="<%= request.getContextPath()%>/admin/submitEditStudentDetails">
		                <div class="modal-body">
		                    <input type = "hidden" id = "hidId" name = "hidId">
				    		<input id="updateBranch" name="updateBranch" class="form-control" type="text" placeholder="Edit Branch" required>
				    		<input id = "updateCity" name = "updateCity" class = "form-control" type = "text" placeholder = "Edit City" required>
                            <input id="updateFullName" name="updateFullName" class="form-control" type="text" placeholder="Edit Full Name" required>
                            <input id="updateEmail" name="updateEmail" class="form-control" type="text" placeholder="Edit Email" required>
                            <input id="updateMobile" name="updateMobile" class="form-control" type="text" placeholder="Edit Mobile" required>
                            <input id="updateGender" name="updateGender" class="form-control" type="text" placeholder="Edit Gender" required>
                            <input id="updatePanOrAadhar" name="updatePanOrAadhar" class="form-control" type="text" placeholder="Edit PanOrAadhar" required>
                            <input id="updatePassingYear" name="updatePassingYear" class="form-control" type="text" placeholder="Edit Passing Year" required>
                            <input id="updateCompanies" name="updateCompanies" class="form-control" type="text" placeholder="Edit Companies" required>
                            <input id="updateAddress" name="updateAddress" class="form-control" type="text" placeholder="Edit Address" required>
                            <input id="updateCollege" name="updateCollege" class="form-control" type="text" placeholder="Edit College" required>
                            <input id="updateStatus" name="updateStatus" class="form-control" type="text" placeholder="Edit Payment Status" required>
                            <input id="updateBookingId" name="updateBookingId" class="form-control" type="text" placeholder="Edit Booking Id" required>
                            
        		    	</div>
				        <div class="modal-footer">
                            <div>
                                <input type="submit" class="btn btn-primary btn-lg btn-block" value = "Edit"/>
                            </div>
				        </div>
                    </form>
                </div>
                
			</div>
		</div>
	</div>
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview menu-open active">
          <a href="<%= request.getContextPath() %>/admin/">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <li class="treeview menu-open">
          <a href="<%= request.getContextPath() %>/admin/companyManager">
            <i class="fa fa-building-o"></i> <span>Company Registration(all)</span>
          </a>
        </li>
        <li class="treeview menu-open">
          <a href="<%= request.getContextPath() %>/admin/companyManagerByAdmin">
            <i class="fa fa-building-o"></i> <span>Company Registration(by Company)</span>
          </a>
        </li>
        <li class="treeview menu-open">
          <a href="<%= request.getContextPath() %>/admin/cityManager">
            <i class="fa fa-building-o"></i> <span>Cities</span>
          </a>
        </li>
        <!--<li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>Students</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="b-tech.html"><i class="fa fa-circle-o"></i> B. Tech</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> MBA</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> B. Pharma</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> M. Tech</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> M. Pharma</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> HM</a></li>
          </ul>
        </li>-->
        <li class="treeview menu-open">
          <form action="<%= request.getContextPath()%>/admin/logout" method = "post" style = "margin-left: 17px;">
              <button type = "submit" class = "btn btn-danger">Logout</button>
          </form>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>




  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
		<div class="row companies">
			<div class="col-lg-12 col-md-12">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>S. No.</th>
							<th>Date</th>
							<th>Registration Id</th>
							<th>Applying For</th>
							<th>Name</th>
							<th>Address</th>
							<th>Email</th>
							<th>College Name</th>
							<th>Contact</th>
							<th>DOB</th>
							<th>Gender</th>
							<th>PAN/Aadhaar</th>
							<th>Companies</th>
							<th>City(filter)</th>
							<th>Payment Status</th>
							<th>Booking Id</th>
							<th>Actions</th>
						</tr>
						</thead>
						<tbody>
						<%
						if(registrations != null){
							int i = 0;
							for(Registrations registration : registrations){
						%>
						<tr>
						    <form id="deleteRegistration" method="post" autocomplete="off" action="<%= request.getContextPath()%>/admin/deleteStudentDetails" enctype="multipart/form-data">
							<td><%=++i %></td>
							<td><%=registration.getDate() %></td>
							<td><%=registration.getRegId() %></td>
							<td><%=registration.getBranch() %></td>
							<td><%=registration.getFullName() %></td>
							<td><%=registration.getAddress() %></td>
							<td><%=registration.getEmail() %></td>
							<td><%=registration.getCollege() %></td>
							<td><%=registration.getMobile() %></td>
							<td><%=registration.getDay() + "/" + registration.getMonth() + "/" + registration.getYear() %></td>
							<td><%=registration.getGender() %></td>
							<td><%=registration.getPanoraadhar() %></td>
							<td><%=registration.getCompanies().trim() %></td>
							<td><%=registration.getCity().toUpperCase() %></td>
							<td><%=registration.getStatus() %></td>
							<td><%=registration.getBookingId() %></td>
							<input type = "hidden" value = "<%=registration.getId() %>" name = "registrationId"/>
							<td>
							<input type = "submit" value = "Delete" class = "btn btn-danger"/>
							<div class = "form-group" style = "margin-top: 8px;">
							    <a href="#" class="btn btn-warning" id = "aId" value = "45" role="button" data-toggle="modal" data-target="#login-modal2" onclick = 'editDetails("<%=registration.getId()%>", "<%=registration.getBranch() %>", "<%=registration.getCity().toUpperCase() %>", "<%=registration.getFullName() %>", "<%=registration.getEmail() %>", "<%=registration.getMobile() %>", "<%=registration.getDay() + "/" + registration.getMonth() + "/" + registration.getYear() %>", "<%=registration.getGender() %>", "<%=registration.getPanoraadhar() %>", "<%=registration.getPassingyear() %>", "<%=registration.getCompanies().trim() %>", "<%=registration.getStatus() %>", "<%=registration.getAddress() %>", "<%=registration.getCollege() %>", "yes", "<%=registration.getBookingId() %>")' style = "padding:19px; padding-top:6px; padding-bottom:6px;">Edit</a>
							</div>
							</td>
							</form>
						</tr>
						<%}
						}else{
						%>
						<h3>sorry No Registrations Till Now</h3>
						<%
						}
						%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
    </div>
    <strong>Copyright &copy; 2017 <a href="https://www.enggcell.com">EnggCell</a>.</strong> All rights
    reserved.
  </footer>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="<%= request.getContextPath() %>/assets/admin/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%= request.getContextPath() %>/assets/admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<%= request.getContextPath() %>/assets/admin/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%= request.getContextPath() %>/assets/admin/dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="<%= request.getContextPath() %>/assets/admin/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="<%= request.getContextPath() %>/assets/admin/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="<%= request.getContextPath() %>/assets/admin/bower_components/Chart.js/Chart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%= request.getContextPath() %>/assets/admin/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%= request.getContextPath() %>/assets/admin/dist/js/demo.js"></script>
</body>
</html>
