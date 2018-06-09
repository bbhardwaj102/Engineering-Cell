

<%@page import="com.enggcell.entities.Job"%>
<%@page import="com.enggcell.entities.Executive"%>
<%@page import="com.enggcell.entities.CompanyRegistrations"%>
<%@page import="java.util.List"%>
<%@page import="com.enggcell.entities.Companies"%>
<!DOCTYPE html>
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
$(function() {
    
    var $formLogin = $('#addCom');
    var $formLost = $('#lost-form');
    var $formRegister = $('#register-form');
    var $divForms = $('#div-forms');
    var $modalAnimateTime = 300;
    var $msgAnimateTime = 150;
    var $msgShowTime = 2000;

    $("form").submit(function () {
        switch(this.id) {
            case "addCom":
                var $companyName=$('#companyName').val();
                var $city=$('#city').val();
                var $qualification=$('#qualification').val();
                var $profile=$('#profile').val();
                var $ctc=$('#ctc').val();
                var $criteria=$('#criteria').val();
                var $selectionProcess=$('#selectionProcess').val();
                var $dateOfCampus=$('#dateOfCampus').val();
                var $eligibility=$('#eligibility').val();
                if ($companyName == "ERROR") {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
                } else {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
                }
                return false;
                break;
            default:
                return false;
        }
        return false;
    });
    
    $('#login_register_btn').click( function () { modalAnimate($formLogin, $formRegister) });
    $('#register_login_btn').click( function () { modalAnimate($formRegister, $formLogin); });
    $('#login_lost_btn').click( function () { modalAnimate($formLogin, $formLost); });
    $('#lost_login_btn').click( function () { modalAnimate($formLost, $formLogin); });
    $('#lost_register_btn').click( function () { modalAnimate($formLost, $formRegister); });
    $('#register_lost_btn').click( function () { modalAnimate($formRegister, $formLost); });
    
    function modalAnimate ($oldForm, $newForm) {
        var $oldH = $oldForm.height();
        var $newH = $newForm.height();
        $divForms.css("height",$oldH);
        $oldForm.fadeToggle($modalAnimateTime, function(){
            $divForms.animate({height: $newH}, $modalAnimateTime, function(){
                $newForm.fadeToggle($modalAnimateTime);
            });
        });
    }
    
    function msgFade ($msgId, $msgText) {
        $msgId.fadeOut($msgAnimateTime, function() {
            $(this).text($msgText).fadeIn($msgAnimateTime);
        });
    }
    
    function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
        var $msgOld = $divTag.text();
        msgFade($textTag, $msgText);
        $divTag.addClass($divClass);
        $iconTag.removeClass("glyphicon-chevron-right");
        $iconTag.addClass($iconClass + " " + $divClass);
        setTimeout(function() {
            msgFade($textTag, $msgOld);
            $divTag.removeClass($divClass);
            $iconTag.addClass("glyphicon-chevron-right");
            $iconTag.removeClass($iconClass + " " + $divClass);
  		}, $msgShowTime);
    }
});


function setCity(){
	var city = $("#addComDrop").val();
	$("#city").val(city);
}


function editDetails(id, companyName, city, qualification, profile, ctc, criteria, selectionProcess, dateOfCampus, eligibility){
	$("#hidId").val(id);
	$("#updateCompanyName").val(companyName);
	$("#updateCity").val(city);
	$("#updateQualification").val(qualification);
	$("#updateProfile").val(profile);
	$("#updateCtc").val(ctc);
	$("#updateCriteria").val(criteria);
	$("#updateSelectionProcess").val(selectionProcess);
	$("#updateDateOfCampus").val(dateOfCampus);
	$("#updateEligibility").val(eligibility);
}
</script>
<div class="wrapper">
<%
List<CompanyRegistrations> companies = null;
if (request.getAttribute("cityFilterDataAdmin") != null && !request.getAttribute("cityFilterDataAdmin").equals("")) {
    companies = (List<CompanyRegistrations>) request.getAttribute("cityFilterDataAdmin");
    //regId = registrations.getRegId();
}
%>
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
      
      <form id = "filterForm" action="<%= request.getContextPath()%>/admin/filterByCityDetailsByAdmin" class="form-inline" method = "get">
          <div class = "form-group">&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <div class="form-group" style="margin-top:8px;">
              <select id = "cityFilter" name = "cityFilter" class = "form-control">
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
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  
  
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview menu-open">
          <a href="<%= request.getContextPath() %>/admin/">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <li class="treeview menu-open">
          <a href="<%= request.getContextPath() %>/admin/companyManager">
            <i class="fa fa-building-o"></i> <span>Company Registration(all)</span>
          </a>
        </li>
        <li class="active treeview menu-open">
          <a href="<%= request.getContextPath() %>/admin/companyManagerByAdmin">
            <i class="fa fa-building-o"></i> <span>Company Registration(by Company)</span>
          </a>
        </li>
        <li class="treeview menu-open">
          <a href="<%= request.getContextPath() %>/admin/cityManager">
            <i class="fa fa-building-o"></i> <span>Cities</span>
          </a>
        </li>
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
							<th>Company</th>
							<th>City</th>
							<th>Contact Person Name</th>
							<th>Person Designation</th>
							<th>Company Address</th>
							<th>Phone No.</th>
							<th>Mobile No.</th>
							<th>Fax</th>
							<th>Email</th>
							<th>Hr and Other Executives</th>
							<th>Executives Designations</th>
							<th>Registration Date</th>
							<th>Job Designations</th>
							<th>Job Vacancies</th>
							<th>Job Qualifications</th>
							<th>Job Salaries</th>
							<th>Job Locations</th>
							<th>others</th>
							<th>Approx Positions</th>
							<th>Date Of Campus</th>
							<th>Selection Process</th>
							<th>Criteria</th>
							<th>Eligibility</th>
						</tr>
						</thead>
						<tbody>
						<% if(companies != null){
							int i = 0;
							for(CompanyRegistrations company : companies){
						%>
						
						<tr>
						    <form id="deleteCompany" method="post" autocomplete="off" action="<%= request.getContextPath()%>/admin/deletedetails" enctype="multipart/form-data">
						    <td><%=++i %></td>
							<td><%=company.getCompanyName() %></td>
							<td><%=company.getCity().toUpperCase() %></td>
							<td><%=company.getContactPersonName() %></td>
							<td><%=company.getPersonDesignation() %></td>
							<td><%=company.getCompanyAddress() %></td>
							<td><%=company.getCompanyPhone() %></td>
							<td><%=company.getPersonMobile() %></td>
							<td><%=company.getFax() %></td>
							<td><%=company.getEmail() %></td>
							<%
							Executive[] executives = (Executive[])company.getExecutives();
							%>
							<td>
							<%
							for(Executive ex : executives){
								out.println(ex.getName() + ", ");
							}
							%>
							</td>
							<td>
							<%
							for(Executive ex : executives){
								out.println(ex.getDesignation() + ", ");
							}
							%>
							</td>
							<td><%=company.getRegDate() %></td>
							<%
							Job[] jobs = (Job[])company.getJobDetails();
							%>
							<td>
							<%
							for(Job job : jobs){
								out.println(job.getDesignation() + ", ");
							}
							%>
							</td>
							<td>
							<%
							for(Job job : jobs){
								out.println(job.getVacancies() + ", ");
							}
							%>
							</td>
							<td>
							<%
							for(Job job : jobs){
								out.println(job.getQualification() + ", ");
							}
							%>
							</td>
							<td>
							<%
							for(Job job : jobs){
								out.println(job.getSalary() + ", ");
							}
							%>
							</td>
							<td>
							<%
							for(Job job : jobs){
								out.println(job.getLocation() + ", ");
							}
							%>
							</td>
							<td>
							<%
							for(Job job : jobs){
								out.println(job.getOthers() + ", ");
							}
							%>
							</td>
							<td><%=company.getApproxPos() %></td>
							<td><%=company.getDateOfInter() %></td>
							<td><%=company.getSelectionProcess() %></td>
							<td><%=company.getCriteria() %></td>
							<td><%=company.getEligibility() %></td>
						    </form>
							
						</tr>
						<%}
						}else{
						%>
						<h3>sorry No Company Fairs Till Now</h3>
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
