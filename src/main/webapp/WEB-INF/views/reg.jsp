<!DOCTYPE html>
<%@page import="com.enggcell.entities.Cities"%>
<%@page import="com.enggcell.entities.Companies"%>
<%@page import="java.util.List"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="<%= request.getContextPath() %>/assets/img/icon.png" type="image/png" sizes="16x16">
        <meta name="description" content="EnggCell is India's largest job fair organizing portal, Which connects companies, colleges and students through job fair.">
        <meta name="keywords" content="EnggCell, Engineer Cell, Job Fair, Job Fair registration, Job fair in pune, hyderabad, chennai, Bhopal, delhi ncr, gaziabad, gurgaon, banglore, mumbai." />
        <meta name="description" content="Engineer placement cell is job fair organizer in collaboration with well reputed companies in India.Our mission is to provide jobs easily to fresh graduates. EnggCell organizes 4 Job fair in a year.">
        <meta name="author" content="enggcell">

        <title>EnggCell- India's largest and trusted job fairs</title>

        <!-- Bootstrap Core CSS -->
        <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<%=request.getContextPath()%>/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type='text/css'>
        <!-- Theme CSS -->
        <link href="<%=request.getContextPath()%>/assets/vendor/agency.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendor/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style type="text/css">
label#it-error{
    margin-top: 60px;
    position: absolute;
    left: 25px;
}
label#year-error, label#location-error{
    margin-top: 60px;
    position: absolute;
    left: 25px;
}
label#selectCompany-error, label#selectCompany-error{
    display:none;
    position: relative;
    top: -15px;
    margin-left: 15px;
}
label#selectCompany-error{
   margin-left:50px;
}
input[type="checkbox"] {
    display: inline;
}

.nav-pills>li>a:focus, .nav-pills>li>a:hover {
    text-decoration: none;
    background-color: #eee;
}
</style>


    </head> 

    <body id="page-top" class="index">
     
<%

List<Companies> indexCompanies = null;
//HashSet<String> cities = new HashSet<String>();
//indexCities
List<Cities> cities = null;
try{
if(request.getAttribute("indexCitiesRegi") != null && !request.getAttribute("indexCitiesRegi").equals("")){
	cities = (List<Cities>)request.getAttribute("indexCitiesRegi");

}

if (request.getAttribute("indexCompaniesRegi") != null && !request.getAttribute("indexCompaniesRegi").equals("")) {
	indexCompanies = (List<Companies>) request.getAttribute("indexCompaniesRegi");
  
}
}catch(Exception e){
	e.printStackTrace();
}

%>    
        <!-- Navigation -->
        <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top affix">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll" href="http://www.enggcell.in">EnggCell</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li class="">
                            <a class="page-scroll" href="http://www.enggcell.in">Fairs</a>
                        </li>
                        <li class="">
                            <a class="page-scroll" href="http://www.enggcell.in">Companies</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="http://www.enggcell.in">About</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="http://www.enggcell.in">Company Registration</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <!-- Registration form -->

        <div class="container1">
            <form id="signupForm" method="post" autocomplete="off" action="<%= request.getContextPath()%>/register/submitdetails" enctype="multipart/form-data">
                <div class="row">
                    <%
                        if (request.getAttribute("errors") != null && !request.getAttribute("errors").equals("")) {
                    %>
                    <div class="alert alert-danger">
                        <button class="close" data-close="alert"></button>
                        <%
                        if(request.getAttribute("dupEmailPanOrAadharErrors") != null && !request.getAttribute("dupEmailPanOrAadharErrors").equals("")){
                        	out.println("<i class='fa fa-arrow-circle-right'></i> You already registered. If you want to make changes contact to <span style = 'color:blue;'>contact@enggcell.in</span> with your Email Pan/Aadhar and Mobile No. .<br/>");
                        }else{
                        	out.println("<i class='fa fa-arrow-circle-right'></i> Please fill in all the details properly.<br/>");
                        }
                        %>
                    </div>
                    <%  }
                    %>
                    <br>
                    <div class="row">
                        <label><h4>"In order to complete registration you need to have transaction number or booking id. Get your Booking id here "</h4></label>
                <br>
                    <%
                for(Cities cityyy : cities){
                %>
                <div class = "col-lg-2 col-md-2 col-sm-2 col-xs-6"><span style = 'color: #7ed321;margin-top: 2em;font-family: Montserrat,"Helvetica Neue",Helvetica,Arial,sans-serif;text-transform: uppercase;font-weight: 500;font-size: 18px;'><%=cityyy.getCity() %> - </span></div>
                <div class = "col-lg-10 col-md-10 col-sm-10 col-xs-6"><a href="<%=cityyy.getTownscriptLink() %>" class="btn btn-primary">Get Booking Id</a></div>
                <br>
                <br>
                <%
                }
                %>
                        <div class="col-md-12" style = "position:relative; left:-15px;">
                        <h4 class="col-md-4">Personal Details </h4>
                        </div>
                        <br/>
                        <label for="it" style = "position: relative; left: 25px;">Select your field</label>
                        <div class="col-md-12">
                            <select name="it" id="it" class="input-group-icon" required>
                                <%
                                if (request.getAttribute("errBranch") != null && !request.getAttribute("errBranch").equals("")) {
                                %>
                                <option value = "<%=request.getAttribute("errBranch") %>"><%=request.getAttribute("errBranch") %></option>
                                <%	
                                }else{
                                %>
                                <option value = "">Applying for</option>
                                <%	
                                }
                                %>
                                
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
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div id="name" class="input-group-icon">
                                <%--<input type="hidden" name="state" id="state" value="<%= request.getAttribute("state") %>"/>--%>
                                <%
                                if (request.getAttribute("errFullName") != null && !request.getAttribute("errFullName").equals("")) {
                                %>
                                <input type="text" id="fullname" name="fullname" placeholder="Full Name" value = "<%=request.getAttribute("errFullName")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="text" id="fullname" name="fullname" placeholder="Full Name"/>
                                <%	
                                }
                                %>
                                <div class="input-icon"><i class="fa fa-user"></i></div>
                            </div>
                            <div id="address" class="input-group-icon">
                                <%
                                if (request.getAttribute("errAddress") != null && !request.getAttribute("errAddress").equals("")) {
                                %>
                                <input type="text" id="address" name="address" placeholder="Address" value = "<%=request.getAttribute("errAddress")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="text" id="address" name="address" placeholder="Address"/>
                                <%	
                                }
                                %>
                                
                                <div class="input-icon"><i class="fa fa-map-marker"></i></div>
                            </div>
                            <div id="input-group2" class="input-group-icon">
                                <%
                                if (request.getAttribute("errEmail") != null && !request.getAttribute("errEmail").equals("")) {
                                %>
                                <input type="email" name="email" id="email" placeholder="Email Adress" value = "<%=request.getAttribute("errEmail")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="email" name="email" id="email" placeholder="Email Adress"/>
                                <%	
                                }
                                %>
                                
                                <div class="input-icon"><i class="fa fa-envelope"></i></div>
                            </div>
                            <div id="college" class="input-group-icon">
                                <%
                                if (request.getAttribute("errCollege") != null && !request.getAttribute("errCollege").equals("")) {
                                %>
                                <input type="text" id="college" name="college" placeholder="Name Of College" value = "<%=request.getAttribute("errCollege")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="text" id="college" name="college" placeholder="Name Of College"/>
                                <%	
                                }
                                %>
                                
                                <div class="input-icon"><i class="fa fa-graduation-cap"></i></div>
                            </div>
                            <div class="col-md-8" style="margin-left: -15px;">
                                <div id="input-group3" class="input-group-icon">
                                    <%
                                if (request.getAttribute("errMobile") != null && !request.getAttribute("errMobile").equals("")) {
                                %>
                                <input type="text" name="mobile" id="mobile" placeholder="Contact Number" value = "<%=request.getAttribute("errMobile")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="text" name="mobile" id="mobile" placeholder="Contact Number"/>
                                <%	
                                }
                                %>
                                    <div class="input-icon"><i class="fa fa-mobile"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-half">
                        <h4>Date of Birth</h4>
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="col-third">
                                    <%
                                if (request.getAttribute("errDay") != null && !request.getAttribute("errDay").equals("")) {
                                %>
                                <input type="text" name="dobday" id="dobday" placeholder="DD" value = "<%=request.getAttribute("errDay")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="text" name="dobday" id="dobday" placeholder="DD"/>
                                <%	
                                }
                                %>
                                </div>
                                <div class="col-third">
                                    <%
                                if (request.getAttribute("errMonth") != null && !request.getAttribute("errMonth").equals("")) {
                                %>
                                <input type="text" name="dobmonth" id="dobmonth" placeholder="MM" value = "<%=request.getAttribute("errMonth")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="text" name="dobmonth" id="dobmonth" placeholder="MM"/>
                                <%	
                                }
                                %>
                                    
                                </div>
                                <div class="col-third">
                                    <%
                                if (request.getAttribute("errYear") != null && !request.getAttribute("errYear").equals("")) {
                                %>
                                <input type="text" name="dobyear" id="dobyear" placeholder="YYYY" value = "<%=request.getAttribute("errYear")%>" required/>
                                <%	
                                }else{
                                %>
                                <input type="text" name="dobyear" id="dobyear" placeholder="YYYY" required/>
                                <%	
                                }
                                %>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <h4>Gender</h4>
                        <div class="col-md-12">
                            <select name="gender" id="gender">
                            <%
                                if (request.getAttribute("errGender") != null && !request.getAttribute("errGender").equals("")) {
                                %>
                                <option value = "<%=request.getAttribute("errGender") %>"><%=request.getAttribute("errGender") %></option>
                                <%	
                                }else{
                                %>
                                <option disabled="disabled">Select</option>
                                <%	
                                }
                                %>
                                
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-half">
                        <h4>PAN/Aadhar Card Number </h4>
                        <div class="col-md-8" style="margin-left: -15px;">
                            <div id="#input-group" class="input-group-icon">
                                <%
                                if (request.getAttribute("errPanOrAadhar") != null && !request.getAttribute("errPanOrAadhar").equals("")) {
                                %>
                                <input type="text" id="aadhar" name="aadhar" placeholder="PAN/Aadhar Card Number" value = "<%=request.getAttribute("errPanOrAadhar")%>"/>
                                <%	
                                }else{
                                %>
                                <input type="text" id="aadhar" name="aadhar" placeholder="PAN/Aadhar Card Number"/>
                                <%	
                                }
                                %>
                                
                                <div class="input-icon"><i class="fa fa-credit-card"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                    
                    <div class="col-md-12">
                    <h4>Select Passing Year </h4>
                        <div class="col-md-8">
                            <select name="passingyear" id="year" class="input-group-icon" required style = "margin-left:0px; margin-bottom: 40px;">
                            <%
                            if (request.getAttribute("errPassingYear") != null && !request.getAttribute("errPassingYear").equals("")) {
                                %>
                                <option value = "<%=request.getAttribute("errPassingYear") %>"><%=request.getAttribute("errPassingYear") %></option>
                                <%	
                                }else{
                                %>
                                <option value = "">Select Passing Year</option>
                                <%	
                                }
                                %>
                                
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                            </select>
                        </div>
                    </div>
                    <br>
                <div class="row">
                    <h4>Select 5 Companies </h4>
                    <div class="col-md-8" style="margin-left: -15px;">
                        <div id="#input-group" class="input-group-icon">
                            <%
                                if (request.getAttribute("errCompanies") != null && !request.getAttribute("errCompanies").equals("")) {
                                %>
                                <!-- <input type="text" id="companies" name="companies" placeholder="Enter Companies Names seprating by , (Maximum 5 Companies)" value = "<%=request.getAttribute("errCompanies")%>"/>-->
                                
      <div class="row" style = "position: relative; left: 35px;">
         <ul class="nav nav-pills">
                <%
                if(cities != null){
                	int portfolio = 0;
                for(Cities city : cities){
                	portfolio++;
                %>
                <!-- <div class="col-md-3 col-sm-3 portfolio-item">-->
                  
                   <li style = "border: 1px solid red;">
                           <a href="#portfolioModal<%=portfolio %>" class="portfolio-link" data-toggle="modal" style = "padding-top: 3px; padding-bottom: 3px;">
                               
                                <h5 style = "color:red;"><%=city.getCity().toUpperCase() %></h5>
                                     
                           </a>
                   </li>
                   
                    
                <!-- </div>-->
                <%
                }
                }
                %>
                </ul>
            </div>
                                
                                <%
                                System.out.println("in the wrong input");
                                %>
                                <%	
                                }else{
                                %>
                                <!-- <input type="text" id="companies" name="companies" placeholder="Enter Companies Names seprating by , (Maximum 5 Companies)"/>-->
                                
                                
                                
         <div class="row" style = "position: relative; left: 35px;">
         <ul class="nav nav-pills">
                <%
                if(cities != null){
                	int portfolio = 0;
                for(Cities city : cities){
                	portfolio++;
                %>
                <!-- <div class="col-md-3 col-sm-3 portfolio-item">-->
                  
                   <li>
                           <a href="#portfolioModal<%=portfolio %>" class="portfolio-link" data-toggle="modal" style = "padding-top: 3px; padding-bottom: 3px;">
                               
                                <h5 style = "color:#616161;"><%=city.getCity().toUpperCase() %></h5>
                                     
                           </a>
                   </li>
                   
                    
                <!-- </div>-->
                <%
                }
                }
                %>
                </ul>
            </div>
                                
                                
                                
                                <%	
                                }
                                %>
                            
                        </div>
                        <label id="selectCompany-error" for="selectCompanies">Please select atleast one company</label>
                    </div>
                </div>
                
                <div class="row">
                    <h4>Preferred Location</h4>
                    <div class="col-md-12">
                        <div class="col-md-8">
                           <%
                           if(request.getAttribute("errCityBool") != null && !request.getAttribute("errCityBool").equals("")){
                           %>
                           <select name="location" id="location" class="input-group-icon" style = "border-color:red;" required>
                           <%
                           }else{
                           %>
                        	   <select name="location" id="location" class="input-group-icon" required>
                           <%
                           }
                           %>
                            
                            <%
                            if (request.getAttribute("errCity") != null && !request.getAttribute("errCity").equals("")) {
                                %>
                                <option value = "<%=request.getAttribute("errCity") %>"><%=request.getAttribute("errCity") %></option>
                                <%	
                                }else{
                                %>
                                <option value="">Select City</option>
                                <%	
                                }
                                %>
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
                    </div>
                    
                    <div class="col-md-8" style="margin-left: -15px;">
                        <h4>Enter Your Booking Id </h4>
                        <div class="col-md-8" style="margin-left: -15px;">
                            <div id="#input-group" class="input-group-icon">
                                <%
                                if (request.getAttribute("errBookingId") != null && !request.getAttribute("errBookingId").equals("")) {
                                %>
                                <input type="text" id="bookingId" name="bookingId" placeholder="Enter 6 digits Booking Id" value = "<%=request.getAttribute("errBookingId")%>" required/>
                                <%	
                                }else{
                                %>
                                <input type="text" id="bookingId" name="bookingId" placeholder="Enter 6 digits Booking Id" required/>
                                <%	
                                }
                                %>
                                
                                <div class="input-icon"><i class="fa fa-credit-card"></i></div>
                            </div>
                        </div>
                    </div>
                </div>	
                <div class="row">
                    <h4>Terms and Conditions</h4>
                    <div class="input-group">
                        <input type="checkbox" class="checkbox" name="terms" id="terms"/>
                        <label for="terms">I accept the terms and conditions for this registration for job fair, and hereby confirm I have read the privacy policy.</label>
                    </div>
                    <div class="row" style="text-align: center;">
                        <input type="submit" class="submit" onclick="vali()" value="Apply" style="width: 100px;background-color: #0bbff2; color: #fff;"/><span class="network-name"></span>
                    </div>
                </div>
                
                
                
   
   
   <%
    
    if(cities != null){
    	int portfolioAgain = 0;
    	/*
    	while (iterator.hasNext()){
    		portfolioAgain++;
    		String city = iterator.next().toString().toLowerCase();*/
    		for(Cities city : cities){
    			portfolioAgain++;
    %>
    <div class="portfolio-modal modal fade" id="portfolioModal<%=portfolioAgain %>" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>Participating Companies</h2>
								<h3>OVERVIEW</h3>
								<p>
								 Group of Institutions, <%=city.getCity().toUpperCase() %> in association with EnggCell, Noida organising MEGA JOB FAIR on <%=city.getDate() %> from <%=city.getTime() %> 35+ Companies are coming for the recruitment process of B.Tech(All branches), BCA, BBA, MBA, MCA and all the Graduates(BA/B.Sc/B.Com etc) of 2016, 2017 & 2018 (Pursuing)batches.</p>
								
								<h3 style="color: orange;">Major Attractions</h3>
								<p style="font-size:15px;">	
								-  Core Companies for all the branches . <br />
								-  Bulk Recruitments<br />
								-  <%=city.getAvailSeats() %>+ Openings<br />
								-  Companies for all Technical / Non Technical and Management Students.<br />
								-  Limited Seats.<br />
								-  Only first <%=city.getAvailSeats() %> Registrations will be eligible . Registrations will be closed after first <%=city.getAvailSeats() %> registrations.<br />
								-  On the spot offer letters.   <br />
								Registration Fee - <%=city.getRegPrice() %>/- for All the students <br />
                                Registered  candidates can appear in maximum five Companies.<br />
								Company wise details are given below.</p>
								<div class="row companies">
									<div class="col-lg-12 col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover">
												<thead>
												<tr>
												    <th>Check at max 5 Companies</th>
													<th>S. No.</th>
													<th>Company Name</th>
													<th>Qualification</th>
													<th>Profile</th>
													<th>CTC</th>
													<th>Criteria</th>
													<th>Selection Process</th>
													<th>Date of Campus</th>
													<th>Elegibility</th>
												</tr>
												</thead>
												<tbody>
												<%
												if(indexCompanies != null){
													int sno = 0;
									    			for(Companies company : indexCompanies){
									    				//System.out.println(company + " " + city);
									    				if(company.getCity().equalsIgnoreCase(city.getCity())){
									    					sno++;
												%>
												<tr>
												    <td><input type = "checkbox" class = "companiesCheckBox" name = "companiesCheck" value = "<%=company.getCompanyName()%>"></td>
													<td><%=sno %></td>
													<td><%=company.getCompanyName() %></td>
													<td><%=company.getQualification() %></td>
													<td><%=company.getProfile() %></td>
													<td><%=company.getCtc() %></td>
													<td><%=company.getCriteria() %></td>
													<td><%=company.getSelectionProcess() %></td>
													<td><%=company.getDateOfCampus() %></td>
													<td><%=company.getEligibility() %></td>
												</tr>
												<%}else{
									    				//System.out.println("ccccsdsd");
												}
									    			}
												}else{
												    %>
												    <h4>No companies yet</h4>
												    <%		
												    	}
												%>

												</tbody>
											</table>
										</div>
									</div>
								</div>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%}
    	}else{
    %>
    <h4>No companies yet</h4>
    <%		
    	}
%>
   
   
   
    <div class="portfolio-modal modal fade" id="portfolioModalC" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row" style = "width:100%;">
                        <div class="col-lg-12">
                            <div class="modal-body">
								
								<%
    
    if(cities != null){
    	int portfolioAgain = 0;
    	/*
    	while (iterator.hasNext()){
    		portfolioAgain++;
    		String city = iterator.next().toString().toLowerCase();*/
    		for(Cities city : cities){
    			portfolioAgain++;
    %>
								<h4><%=city.getCity() %></h4>
								<hr>
								<div class="row companies">
									<div class="col-lg-12 col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover">
												<thead>
												<tr>
												    <th>Check at max 5 Companies</th>
													<th>S. No.</th>
													<th>Company Name</th>
													<th>Qualification</th>
													<th>Profile</th>
													<th>CTC</th>
													<th>Criteria</th>
													<th>Selection Process</th>
													<th>Date of Campus</th>
													<th>Elegibility</th>
												</tr>
												</thead>
												<tbody>
												<%
												if(indexCompanies != null){
													int sno = 0;
									    			for(Companies company : indexCompanies){
									    				//System.out.println(company + " " + city);
									    				if(company.getCity().equalsIgnoreCase(city.getCity())){
									    					sno++;
												%>
												<tr>
												    <td><input type = "checkbox" class = "companiesCheckBox" name = "companiesCheck" value = "<%=company.getCompanyName()%>"></td>
													<td><%=sno %></td>
													<td><%=company.getCompanyName() %></td>
													<td><%=company.getQualification() %></td>
													<td><%=company.getProfile() %></td>
													<td><%=company.getCtc() %></td>
													<td><%=company.getCriteria() %></td>
													<td><%=company.getSelectionProcess() %></td>
													<td><%=company.getDateOfCampus() %></td>
													<td><%=company.getEligibility() %></td>
												</tr>
												<%}else{
									    				//System.out.println("ccccsdsd");
												}
									    			}
												}else{
												    %>
												    <h4>No companies in this <%=city.getCity() %>></h4>
												    <%		
												    	}
												%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<%}
    	                     }else{
                             %>
                             <h4>No companies yet</h4>
                             <%		
    	                     }
                             %>
								
								
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                 
                
            </form>
        </div>

        <!-- ./Registration form -->
        <div class="banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12" style="text-align: center; padding-top: 30px;">
                        <ul class="list-inline banner-social-buttons">
                            <li>
                            <a href="https://www.instagram.com/enggcell/" class="btn btn-default btn-lg"><i class="fa fa-instagram fa-fw"></i> <span class="network-name">Instagram</span></a>
                        </li>
                        <li>
                            <a href="https://www.facebook.com/placementenggcell/" class="btn btn-default btn-lg"><i class="fa fa-facebook fa-fw"></i> <span class="network-name">Facebook</span></a>
                        </li>
                        <li>
                            <a href="https://www.linkedin.com/company/enggcell/" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">LinkedIn</span></a>
                        </li>
                        </ul>
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>
        <!-- /.banner -->

        <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <span class="copyright">Copyright &copy; EnggCell 2017. All Rights Reserved</span>
                </div>
                <div class="col-md-6">
                    <ul class="list-inline quicklinks">
                        <li><a href="<%= request.getContextPath()%>/privacy">Privacy Policy</a>
                        </li>
                        <li><a href="<%= request.getContextPath()%>/terms">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class = "container-fluid">
            <div class = "row">
                <div class="col-md-12">
                    <img src = "<%= request.getContextPath() %>/assets/img/sealOfTrust.png" alt = "Trust us" style = "width: 100%;">
                </div>
            </div>
        </div>
    </footer>

        <!-- jQuery -->
<script>

var cerror = false;
var limit = 6;
$('input.companiesCheckBox').on('change', function(evt) {
   if($("input[name='companiesCheck']:checked").length >= limit) {
       this.checked = false;
   }
   if($("input[name='companiesCheck']:checked").length > 0) {
	    $(".selectCompany-error").hide();
	    cerror = false;
	}
});
function vali(){
	if($("input[name='companiesCheck']:checked").length <= 0) {
        $("#selectCompany-error").show();
        cerror = true;
    }
}
$('#signupForm').submit(function (event) {
    $(this).find('.required').each(function () {
        if ($(this).val().length < 1) {
            $(this).addClass('error');
            cerror = true;
        }
    });
    
    if (cerror == true) {
        event.preventDefault();
        return false;
    }
    return true;
})
//myError
$('input.checkbox').hide();
</script>  
        <script src="<%=request.getContextPath()%>/assets/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

        <!-- Contact Form JavaScript -->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/script.js"></script>
        <!--<script src="<%=request.getContextPath()%>/assets/vendor/jqBootstrapValidation.js"></script>-->
        <!--<script src="<%=request.getContextPath()%>/assets/vendor/contact_me.js"></script>-->
        <!--&lt;!&ndash; Theme JavaScript &ndash;&gt;-->
        <!--<script src="<%=request.getContextPath()%>/assets/vendor/agency.min.js"></script>-->
    </body>

</html>
