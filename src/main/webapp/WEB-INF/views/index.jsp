<!DOCTYPE html>
<%@page import="java.io.IOException"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="org.springframework.web.context.ContextLoader"%>
<%@page import="java.io.File"%>
<%@page import="com.enggcell.entities.Cities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.enggcell.entities.Companies"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="<%= request.getContextPath() %>/assets/img/icon.png" type="image/png" sizes="16x16">
	<meta name="description" content="EnggCell is India's largest job fair organizing portal, Which connects companies, colleges and students through job fair.">
	<meta name="keywords" content="EnggCell, Engineer Cell, Job Fair, Job Fair registration, Job fair in pune, hyderabad, chennai, Bhopal, delhi, noida, gaziabad, gurgaon, banglore, mumbai." />
    <meta name="description" content="Engineer placement cell is job fair organizer in collaboration with well reputed companies in India.Our mission is to provide jobs easily to fresh graduates. EnggCell organizes 4 Job fair in a year.">
    <meta name="author" content="enggCell">

    <title>EnggCell- India's largest and trusted job fairs</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%= request.getContextPath() %>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%= request.getContextPath() %>/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type='text/css'>
    <!-- Theme CSS -->
    <link href="<%= request.getContextPath() %>/assets/css/agency.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">
<%
List<Companies> indexCompanies = null;
//HashSet<String> cities = new HashSet<String>();
//indexCities
List<Cities> cities = null;
try{
if(request.getAttribute("indexCities") != null && !request.getAttribute("indexCities").equals("")){
	cities = (List<Cities>)request.getAttribute("indexCities");

}

if (request.getAttribute("indexCompanies") != null && !request.getAttribute("indexCompanies").equals("")) {
	indexCompanies = (List<Companies>) request.getAttribute("indexCompanies");
    
}
}catch(Exception e){
	e.printStackTrace();
}

%>
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">EnggCell</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Fairs</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Companies</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Company Registration</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Welcome To enggCell</div>
                <div class="intro-heading">The mega job fair</div>
                <a href="#services" class="page-scroll btn btn-default btn-lg">Apply Now</a>
            </div>
        </div>
    </header>

    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">What you need?</h2>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
				<a href="#portfolio" style="text-decoration:none;">
                    <span class="fa-stack fa-4x">
						<i class="fa fa-bullhorn" aria-hidden="true"></i>
                    </span>
                    <h4 class="service-heading">Current Job Fairs</h4>
                    <p class="text-muted">Apply for current job fairs and know the participating colleges and companies near you.</p>
                </a>
				</div>
                <div class="col-md-4">
				<a href="#portfolio" style="text-decoration:none;">
                    <span class="fa-stack fa-4x">
						<i class="fa fa-calendar" aria-hidden="true"></i>
                    </span>
                    <h4 class="service-heading">UpComing Job Fairs</h4>
                    <p class="text-muted">Check for the upcoming job fairs in your city.</p>
                </a>
				</div>
                <div class="col-md-4">
				<a href="<%= request.getContextPath() %>/register/adddetails" style="text-decoration:none;">
                    <span class="fa-stack fa-4x">
						<i class="fa fa-graduation-cap" aria-hidden="true"></i>
                    </span>
                    <h4 class="service-heading">Apply Now</h4>
                    <p class="text-muted">Apply Now for the upcoming job fairs in Bhopal, Pune, Hyderabad, Chennai & Ghaziabad.</p>
                </a>
				</div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Companies</h2>
                    <h3 class="section-subheading text-muted">Participating in fair</h3>
                </div>
            </div>
            <div class="row">
                <%
                if(cities != null){
                	int portfolio = 0;
                for(Cities city : cities){
                	portfolio++;
                %>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal<%=portfolio %>" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <%
                        String encodedImage = "";
                        String fileExtension = "";
                        try {
                        	encodedImage = Base64.encode(city.getImageCity());
                        String delims="[,]";
                        String[] parts = encodedImage.split(delims);
                        String imageString = parts[0];
                        byte[] imageByteArray = Base64.decode(imageString );

                        InputStream is = new ByteArrayInputStream(imageByteArray);
                        String mimeType = null;
                        fileExtension = null;
                            mimeType = URLConnection.guessContentTypeFromStream(is); //mimeType is something like "image/jpeg"
                            String delimiter="[/]";
                            String[] tokens = mimeType.split(delimiter);
                            fileExtension = tokens[1];
                            System.out.println(fileExtension);
                        } catch (Exception e){
                        	e.printStackTrace();
                        }
                        %>
                        <img alt="image" src="data:image/<%=fileExtension %>;base64,<%=encodedImage%>">
                    </a>
                    <div class="portfolio-caption" style = "height: 200px;">
                        <h4><%=city.getCity().toUpperCase() %></h4>
                        <p class="text-muted"><%=city.getCollege() + ", " + city.getAddress() %></p>
                    </div>
                </div>
                <%
                }
                }
                %>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">About</h2>
                    <h3 class="section-subheading text-muted">Engineering Placement cell</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="<%= request.getContextPath() %>/assets/img/about/1.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2017</h4>
                                    <h4 class="subheading">Our Humble Beginnings</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Engineer placement cell is job fair organizer in collaboration with well reputed companies in India. <br />
									Our mission is to provide jobs easily to fresh graduates. EnggCell organizes 4 Job fair in a year.</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
								
                                <img class="img-circle img-responsive" src="<%= request.getContextPath() %>/assets/img/about/4.jpg" alt="">
								</a>
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>June 2017</h4>
                                    <h4 class="subheading">Job Fair- Record placement</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">920 out of 1000 studens were placed in job fair organized in june.</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="timeline-image">
								<a href="<%= request.getContextPath() %>/register/">
                                <img class="img-circle img-responsive" src="<%= request.getContextPath() %>/assets/img/about/3.jpg" alt="">
								</a>
							</div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>January 2018</h4>
                                    <h4 class="subheading">UpComing Job fair</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">EnggCell is organizing job fairs in 5 major cities in India. Apply for the fair in cities near you. </p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4>Be Part
                                    <br>Of Our
                                    <br>Story!</h4>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Company Registration</h2>
                    <h3 class="section-subheading text-muted">Register your Company to participate in the Job Fair</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" method = "post" action = "<%= request.getContextPath()%>/register/submitCompanyDetails" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Company Name *" id="name" name = "companyName" required data-validation-required-message="Please enter your company name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Contact Person Name *" id="contactPerson" name = "contactPerson" required data-validation-required-message="Please enter your contact person name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Designation *" id="designation" name = "designation" required data-validation-required-message="Please enter your designation.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Company Address *" id="address" name = "address" required data-validation-required-message="Please enter your address">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="tel" class="form-control" placeholder="Company Phone Number *" id="phone" name = "phone" required data-validation-required-message="Please enter company contact number.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" placeholder="Your Mobile Number *" id="mobile" name = "mobile" required data-validation-required-message="Please enter your mobile number.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Company Fax *" id="fax" name = "fax" required data-validation-required-message="Please enter company fax.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Company Email *" id="email" name = "email" required data-validation-required-message="Please enter company email.">
                                    <p class="help-block text-danger"></p>
                                </div>
                             </div>


<div class="col-md-12">
<br>
<table id="tblAddRow" border="1">
    <thead>
        <tr>
            <th style = "color:white; text-align: center;">Position/Designation</th>
            <th style = "color:white; text-align: center;">Number of Vacancies</th>
            <th style = "color:white; text-align: center;">Qualification</th>
            <th style = "color:white; text-align: center;">Salary</th>
            <th style = "color:white; text-align: center;">Location</th>
            <th style = "color:white; text-align: center;">Others</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
            <div class="form-group">
                <input type = "text" class="form-control" placeholder = "Enter Designation" required data-validation-required-message="Please enter designation" id = "i1" name = "n1"/>
                <p class="help-block text-danger"></p>
            </div>    
            </td>
            <td>
            <div class="form-group">
                <input type = "text" type = "text" class="form-control" placeholder = "Enter Vacancies" required data-validation-required-message="Please enter vacancies" id = "i2" name = "n2"/>
                <p class="help-block text-danger"></p>
            </div>
            </td>
            <td>
            <div class="form-group">
                <input type = "text" type = "text" class="form-control" placeholder = "Enter Qualification" required data-validation-required-message="Please enter qualification" id = "i3" name = "n3"/>
                <p class="help-block text-danger"></p>
            </div>
            </td>
            <td>
            <div class="form-group">
                <input type = "text" type = "text" class="form-control" placeholder = "Enter Salary" required data-validation-required-message="Please enter salary" id = "i4" name = "n4"/>
                <p class="help-block text-danger"></p>
            </div>
            </td>
            <td>
            <div class="form-group">
                <input type = "text" type = "text" class="form-control" placeholder = "Enter Location" required data-validation-required-message="Please enter location" id = "i5" name = "n5"/>
                <p class="help-block text-danger"></p>
            </div>
            </td>
            <td>
            <div class="form-group">
                <input type = "text"  type = "text" class="form-control" placeholder = "Enter other requirements or N/A" required data-validation-required-message="Please enter other requirements or N/A" id = "i6" name = "n6"/>
                <p class="help-block text-danger"></p>
            </div>
            </td>
        </tr>
        
    </tbody>
</table>

<button id="btnAddRow" type="button" class = "btn btn-success" style = "margin-bottom:30px;">
    Add More Designations
</button>
<button id="btnDelLastRow" type="button" class = "btn btn-danger" style = "margin-bottom:30px;">
    Delete Last Row
</button>
<br>
</div>


       <input type = "hidden" name = "hidRow" id = "hidRow" />
       <input type = "hidden" name = "hidRow2" id = "hidRow2" />                        
                            
                            
                            
          
                            
                            <div class = "col-md-6">
                                <div class = "form-group">
                                    <input type="text" class="form-control" name = "approxSeats" id = "approxSeats" placeholder="Approximate Number of Position(s) available *" id="position" required data-validation-required-message="Please enter approximate number of postion(s) available">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class = "form-group">
                                    <input type="text" class="form-control" name = "eligibility" id = "eligibility" placeholder="Enter Eligibility *" required data-validation-required-message="Please enter eligibility">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class = "form-group">
                                    <input type="text" class="form-control" name = "criteria" id = "criteria" placeholder="Enter Criteria *" required data-validation-required-message="Please enter criteria">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class = "col-md-6">
                                <div class = "form-group">
                                    <input type="text" class="form-control" name = "selectionProcess" id = "selectionProcess" placeholder="Enter Selection Process *" required data-validation-required-message="Please enter selection process">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class = "form-group">
                                    <input type="text" class="form-control" name = "dateOfInter" id = "dateOfInter" placeholder="Enter Date Of Interview *" required data-validation-required-message="Please enter date of interview">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class = "form-group">
                                    <input type="text" class="form-control" name = "city" id = "city" placeholder="Enter City Of Interview *" required data-validation-required-message="Please enter city of interview">
                                    <p class="help-block text-danger"></p>
                                </div>
                                
                            </div>
                            
                            <br>
                            <br>
                            <h4 style = "color: #FAFAFA; font-weight: bold; margin-left: 15px;">Interview Panel Executive Names with Designation: (One Person should be from HR Deptt.)</h4>
                            
                            <div class = "col-md-6">
                                <div class = "form-group">
                                    <input type="text" class="form-control" placeholder="Enter HR Department Person Name *" id="hrDepttPersonName" name = "hrDepttPersonName" required data-validation-required-message="Please enter hr department person name">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class = "col-md-6">
                                <div class = "form-group">
                                    <input type="text" class="form-control" placeholder="Enter Designation *" id="hrPersonDesig" name = "hrPersonDesig" required data-validation-required-message="Please enter designation">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            
                            
                            
<div class="col-md-12">
<br>
<table id="tblAddRow2" border="1" width = "100%">
    <tbody style = "border-color:#222;">
        <tr style = "border-color:#222;">
            <td style = "border-color:#222;">
            <div class="form-group col-md-12">
                <input type = "text" class="form-control" placeholder = "Enter Other Executive Name" required data-validation-required-message="Please enter executive name" id = "ii1" name = "nn1"/>
                <p class="help-block text-danger"></p>
            </div>    
            </td>
            <td style = "border-color:#222;">
            <div class="form-group col-md-12">
                <input type = "text" type = "text" class="form-control" placeholder = "Enter Designation" required data-validation-required-message="Please enter designation" id = "ii2" name = "nn2"/>
                <p class="help-block text-danger"></p>
            </div>
            </td>
        </tr>
        
    </tbody>
</table>

<button id="btnAddRow2" type="button" class = "btn btn-success" style = "margin-bottom:30px; margin-left:15px;">
    Add Other Persons
</button>
<button id="btnDelLastRow2" type="button" class = "btn btn-danger" style = "margin-bottom:30px; margin-left:15px;">
    Delete Last Row
</button>
<br>
</div>           
                            
                            
                            
                            
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn btn-xl">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	
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

    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->

    <!-- Portfolio Modal 1 -->
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
												<!--<tr>
													<td>2</td>
													<td>Infosys Ltd.</td>
													<td>All Graduates</td>
													<td>Associate Software Engineer</td>
													<td>3 - 3.6 LPA</td>
													<td>50% (Throughout)</td>
													<td>GD + PI</td>
													<td>6th Jan</td>
													<td>2017/2018</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Capgemini Ltd.</td>
													<td>All Graduates</td>
													<td>Associate Software Engineer</td>
													<td>3 - 3.6 LPA</td>
													<td>50% (Throughout)</td>
													<td>GD + PI</td>
													<td>6th Jan</td>
													<td>2017/2018</td>
												</tr>-->

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
        <!-- jQuery -->
    <script src="<%= request.getContextPath() %>/assets/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%= request.getContextPath() %>/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <!-- Contact Form JavaScript -->
    <script src="<%= request.getContextPath() %>/assets/js/jqBootstrapValidation.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="<%= request.getContextPath() %>/assets/js/agency.min.js"></script>
    <script>
        
    var nn1 ;
    var nn2 ;
    var nn3 ;
    var nn4 ;
    var nn5 ;
    var nn6 ;
    var nn7 ;
    var nn8 ;
    var nn9 ;
    var nn10 ;
    var nn11 ;
    var nn12 ;
    var nn13 ;
    var nn14 ;
    var nn15 ;
    var nn16 ;
    var nn17 ;
    var nn18 ;
    var nn19 ;
    var nn20 ;
    var nn21 ;
    var nn22 ;
    var nn23 ;
    var nn24 ;
    var nn25 ;
    var nn26 ;
    var nn27 ;
    var nn28 ;
    var nn29 ;
    var nn30 ;
    var nn31 ;
    var nn32 ;
    var nn33 ;
    var nn34 ;
    var nn35 ;
    var nn36 ;
    var nn37 ;
    var nn38 ;
    var nn39 ;
    var nn40 ;
    var nn41 ;
    var nn42 ;
    var nn43 ;
    var nn44 ;
    var nn45 ;
    var nn46 ;
    var nn47 ;
    var nn48 ;
    var nn49 ;
    var nn50 ;
    var nn51 ;
    var nn52 ;
    var nn53 ;
    var nn54 ;
    var nn55 ;
    var nn56 ;
    var nn57 ;
    var nn58 ;
    var nn59 ;
    var nn60 ;
    var nn61 ;
    var nn62 ;
    var nn63 ;
    var nn64 ;
    var nn65 ;
    var nn66 ;
    var nn67 ;
    var nn68 ;
    var nn69 ;
    var nn70 ;
    var nn71 ;
    var nn72 ;
    var nn73 ;
    var nn74 ;
    var nn75 ;
    var nn76 ;
    var nn77 ;
    var nn78 ;
    var nn79 ;
    var nn80 ;
    var nn81 ;
    var nn82 ;
    var nn83 ;
    var nn84 ;
    var nn85 ;
    var nn86 ;
    var nn87 ;
    var nn88 ;
    var nn89 ;
    var nn90 ;
    var nn91 ;
    var nn92 ;
    var nn93 ;
    var nn94 ;
    var nn95 ;
    var nn96 ;
    var nn97 ;
    var nn98 ;
    var nn99 ;
    var nn100 ;
    var nn101 ;
    var nn102 ;
    var nn103 ;
    var nn104 ;
    var nn105 ;
    var nn106 ;
    var nn107 ;
    var nn108 ;
    var nn109 ;
    var nn110 ;
    var nn111 ;
    var nn112 ;
    var nn113 ;
    var nn114 ;
    var nn115 ;
    var nn116 ;
    var nn117 ;
    var nn118 ;
    var nn119 ;
    var nn120 ;
    var nn121 ;
    var nn122 ;
    var nn123 ;
    var nn124 ;
    var nn125 ;
    var nn126 ;
    
 $("#checkPromocode").click(function () {
        if ($("#price").val() !== '0') {
            $.ajax({
                url: '<%=request.getContextPath()%>/Delivery/checkprmocode',
                type: 'post',
                dataType: 'html',
                data: {estimatedprice: $("#price").val(), promocode: $("#promocodetext").val(), pdistrict: $("#pdistrict").val()},
                success: function (data) {
                    var msg = JSON.parse(data);
                    console.log(msg[1]);
                    if (msg[0] === "Promo code is applied") {
                        console.log("Inside if");
                        $("#promocodespangreen").html(msg[2]);
                        $("#promocodespanred").html("");
                        $("#revisedprice").val(msg[1]);
                    } else {
                        console.log("Inside else");
                        $("#promocodespanred").html(msg[0]);
                        $("#promocodespangreen").html("");
                        $("#revisedprice").val($("#price").val());
                    }
                }
            });
        } else {
            //   $("#promocodespanred").html("First enter start and end location");
            $("#promocodespangreen").html("");
        }
    });
 
    $("#contactForm input,#contactForm textarea").jqBootstrapValidation({
        preventSubmit: true,
        submitError: function ($form, event, errors) {
            // additional error messages or events
        },
        submitSuccess: function ($form, event) {
            event.preventDefault(); // prevent default submit behaviour
            // get values from FORM
             //alert("hello");
            var hidRow = $("input#hidRow").val();
            var hidRow2 = $("input#hidRow2").val();
            var companyName = $("input#name").val();
            var contactPerson = $("input#contactPerson").val();
            var designation = $("input#designation").val();
            var address = $("input#address").val();
            var phone = $("input#phone").val();
            var mobile = $("input#mobile").val();
            var fax = $("input#fax").val();
            var email = $("input#email").val();
            var approxSeats = $("input#approxSeats").val();
            var eligibility = $("input#eligibility").val();
            var criteria = $("input#criteria").val();
            var selectionProcess = $("input#selectionProcess").val();
            var dateOfInter = $("input#dateOfInter").val();
            var city = $("input#city").val();
            var hrDepttPersonName = $("input#hrDepttPersonName").val();
            var hrPersonDesig = $("input#hrPersonDesig").val();
            <%
            for(int i = 1; i <= 126; i++){
            	out.println("n" + i + " = " + "$(\"input#i" + i + "\").val();");
            }
            for(int i = 1; i <= 126; i++){
        	    out.println("nn" + i + " = " + "$(\"input#ii" + i + "\").val();");
            }
            %>
            
            $.ajax({
                url: '<%= request.getContextPath()%>/register/submitCompanyDetails',
                type: 'post',
                dataType: 'html',
                data: {
                	hidRow: hidRow,
                	hidRow2: hidRow2,
                	companyName: companyName,
                	contactPerson: contactPerson,
                	designation: designation,
                    address: address,
                    phone: phone,
                    mobile: mobile,
                    fax: fax,
                    email: email,
                    approxSeats: approxSeats,
                    eligibility: eligibility,
                    criteria: criteria,
                    selectionProcess: selectionProcess,
                    dateOfInter: dateOfInter,
                    hrDepttPersonName: hrDepttPersonName,
                    hrPersonDesig: hrPersonDesig,
                    <%
                    for(int i = 1; i <= 126; i++){
                    	out.println("n" + i + ": " + "n" + i + ",");
                    }
                    for(int i = 1; i <= 126; i++){
                    	out.println("n" + i + ": " + "n" + i + ",");
                    }
                    %>
                    city: city
                },
                cache: false,
                success: function (data) {
                    var msg = data;
                    if (msg === "Success") {
                        // Success message
                        $('#success').html("<div class='alert alert-success'>");
                        $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                .append("</button>");
                        $('#success > .alert-success')
                                .append("<strong>We have recorded your registration. </strong>");
                        $('#success > .alert-success')
                                .append('</div>');
                    } else {
                        // Fail message
                        $('#success').html("<div class='alert alert-danger'>");
                        $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                .append("</button>");
                        $('#success > .alert-danger').append($("<strong>").text("Hello " + companyName + ", Please fill in all the details properly to continue!"));
                        $('#success > .alert-danger').append('</div>');
                        //clear all fields
                        $('#contactForm').trigger("reset");
                    }
                    //clear all fields
                    $('#contactForm').trigger("reset");
                },
                error: function () {
                    // Fail message
                    $('#success').html("<div class='alert alert-danger'>");
                    $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                            .append("</button>");
                    $('#success > .alert-danger').append($("<strong>").text("Sorry " + companyName + ", it seems that my mail server is not responding. Please try again later!"));
                    $('#success > .alert-danger').append('</div>');
                    //clear all fields
                    $('#contactForm').trigger("reset");
                },
            });
        },
        filter: function () {
            return $(this).is(":visible");
        },
    });

    $("a[data-toggle=\"tab\"]").click(function (e) {
        e.preventDefault();
        $(this).tab("show");
    });
    
    
 // Add button Delete in row
    /*$('tbody tr')
        .find('td')
        //.append('<input type="button" value="Delete" class="del"/>')
        .parent() //traversing to 'tr' Element
        .append('<td><a href="#" class="delrow">Delete Row</a></td>');*/

    // For select all checkbox in table  1  2  3  4  5
                                     //  6  7  8  9 10
                                     // 11 12 13 14 15 
                                     // 16 17
    var row = 1;
    var posId = 1;
    var vacId = 2;
    var qualId = 3;
    var salId = 4;
    var locId = 5;
    var otherId = 6;
    
    var posName = 1;
    var vacName = 2;
    var qualName = 3;
    var salName = 4;
    var locName = 5;
    var otherName = 6;
    
    var exRow = 1;
    var exNameId = 1;
    var exDesigId = 2;
    
    var exNameName = 1;
    var exDesigName = 2;
    
    $('#hidRow').val(row);
    $('#hidRow2').val(exRow);
    //alert("hello " + rr + " " + rrr + " hello");
    $('#checkedAll').click(function (e) {
    	//e.preventDefault();
        $(this).closest('#tblAddRow').find('td input:checkbox').prop('checked', this.checked);
    });
    
 // Add row the table
    $('#btnAddRow2').on('click', function() {
    	exRow++;
    	$('#hidRow2').val(exRow);
    	//alert($('#hidRow2').val());
    	/*
    	exNameId--;exDesigId--;
    	exNameName--;exDesigName--;*/
    	exNameId = exNameId + 2;
    	
    	exDesigId = exDesigId + 2;
    	
    	exNameName = exNameName + 2;
    	
    	exDesigName = exDesigName + 2;
    	
    	var lastRow = $('#tblAddRow2 tbody tr:last').html();
        $('#tblAddRow2 tbody').append('<tr>' + lastRow + '</tr>');
        $('#tblAddRow2 tbody tr:last input').val('');
        
        $('#tblAddRow2 tbody tr:last input:eq(0)').attr('id', "ii" + exNameId);
        $('#tblAddRow2 tbody tr:last input:eq(1)').attr('id', "ii" + exDesigId);
        
        $('#tblAddRow2 tbody tr:last input:eq(0)').attr('name', "nn" + exNameName);
        $('#tblAddRow2 tbody tr:last input:eq(1)').attr('name', "nn" + exDesigName);
    });

    // Add row the table
    $('#btnAddRow').on('click', function() {
    	row++;
    	$('#hidRow').val(row);
    	//alert($('#hidRow').val());
    	posId = posId + 6;
    	
    	vacId = vacId + 6;
    	
    	qualId = qualId + 6;
    	
    	salId = salId + 6;
    	
    	locId = locId + 6;
    	
    	otherId = otherId + 6;
    	
    	posName = posName + 6;
    	
    	vacName = vacName + 6;
    	
    	qualName = qualName + 6;
    	
    	salName = salName + 6;
    	
    	locName = locName + 6;
    	
    	otherName = otherName + 6;
    	
    	var lastRow = $('#tblAddRow tbody tr:last').html();
        $('#tblAddRow tbody').append('<tr>' + lastRow + '</tr>');
        $('#tblAddRow tbody tr:last input').val('');
        
        $('#tblAddRow tbody tr:last input:eq(0)').attr('id', "i" + posId);
        $('#tblAddRow tbody tr:last input:eq(1)').attr('id', "i" + vacId);
        $('#tblAddRow tbody tr:last input:eq(2)').attr('id', "i" + qualId);
        $('#tblAddRow tbody tr:last input:eq(3)').attr('id', "i" + salId);
        $('#tblAddRow tbody tr:last input:eq(4)').attr('id', "i" + locId);
        $('#tblAddRow tbody tr:last input:eq(5)').attr('id', "i" + otherId);
        
        $('#tblAddRow tbody tr:last input:eq(0)').attr('name', "n" + posName);
        $('#tblAddRow tbody tr:last input:eq(1)').attr('name', "n" + vacName);
        $('#tblAddRow tbody tr:last input:eq(2)').attr('name', "n" + qualName);
        $('#tblAddRow tbody tr:last input:eq(3)').attr('name', "n" + salName);
        $('#tblAddRow tbody tr:last input:eq(4)').attr('name', "n" + locName);
        $('#tblAddRow tbody tr:last input:eq(5)').attr('name', "n" + otherName);
    });
    
    $('#btnDelLastRow2').on('click', function() {
    	exRow--;
    	$('#hidRow2').val(exRow);
    	//alert($('#hidRow2').val());
    	/*
    	exNameId++;exDesigId++;
    	exNameName++;exDesigName++;*/
    	exNameId = exNameId - 2;
    	
    	exDesigId = exDesigId - 2;
    	
    	exNameName = exNameName - 2;
    	
    	exDesigName = exDesigName - 2;
    	
    	var lenRow = $('#tblAddRow2 tbody tr').length;
        //alert(lenRow);
        if (lenRow == 1 || lenRow <= 1) {
            //alert("Can't remove all row!");
        } else {
            $('#tblAddRow2 tbody tr:last').remove();
        }
    });
    
    
    // Delete last row in the table
    $('#btnDelLastRow').on('click', function() {
    	row--;
    	$('#hidRow').val(row);
    	//alert($('#hidRow').val());
    	/*
    	posId--;vacId--;qualId--;salId--;locId--;otherId--;
    	posName--;vacName--;qualName--;salName--;locName--;otherName--;*/
    	
    	posId = posId - 6;
    	
    	vacId = vacId - 6;
    	
    	qualId = qualId - 6;
    	
    	salId = salId - 6;
    	
    	locId = locId - 6;
    	
    	otherId = otherId - 6;
    	
    	posName = posName - 6;
    	
    	vacName = vacName - 6;
    	
    	qualName = qualName - 6;
    	
    	salName = salName - 6;
    	
    	locName = locName - 6;
    	
    	otherName = otherName - 6;
    	
    	var lenRow = $('#tblAddRow tbody tr').length;
        //alert(lenRow);
        if (lenRow == 1 || lenRow <= 1) {
            //alert("Can't remove all row!");
        } else {
            $('#tblAddRow tbody tr:last').remove();
        }
    });

    // Delete row on click in the table
    $('#tblAddRow').on('click', 'tr a', function(e) {
        var lenRow = $('#tblAddRow tbody tr').length;
        e.preventDefault();
        if (lenRow == 1 || lenRow <= 1) {
            //alert("Can't remove all row!");
        } else {
            $(this).parents('tr').remove();
        }
    });

    // Delete selected checkbox in the table
    $('#btnDelCheckRow').click(function() {
    	var lenRow		= $('#tblAddRow tbody tr').length;
        var lenChecked	= $("#tblAddRow input[type='checkbox']:checked").length;
        var row	= $("#tblAddRow tbody input[type='checkbox']:checked").parent().parent();
        //alert(lenRow + ' - ' + lenChecked);
        if (lenRow == 1 || lenRow <= 1 || lenChecked >= lenRow) {
            //alert("Can't remove all row!");
        } else {
            row.remove();
        }
    });


    </script>
</body>

</html>
