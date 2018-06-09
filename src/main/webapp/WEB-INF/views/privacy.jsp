<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" href="img/icon.png" type="image/png" sizes="16x16">
	<meta name="description" content="EnggCell is India's largest job fair organizing portal, Which connects companies, colleges and students through job fair.">
	<meta name="keywords" content="EnggCell, Engineer Cell, Job Fair, Job Fair registration, Job fair in pune, hyderabad, chennai, Bhopal, delhi, noida, gaziabad, gurgaon, banglore, mumbai." />
    <meta name="description" content="Engineer placement cell is job fair organizer in collaboration with well reputed companies in India.Our mission is to provide jobs easily to fresh graduates. EnggCell organizes 4 Job fair in a year.">
    <meta name="author" content="enggcell">

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
	<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    
</head>

<body id="page-top" class="index">
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
                        <a class="page-scroll" href="http://www.enggcell.in//#services">Fairs</a>
                    </li>
                    <li class="">
                        <a class="page-scroll" href="http://www.enggcell.in//#portfolio">Companies</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="http://www.enggcell.in//#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="http://www.enggcell.in//#contact">Company Registration</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	<!-- Registration form -->
	
	<div class="container1">
	<form id="signupForm" method="post" action="invoice.html" autocomplete="off" onsubmit="return checkForm(this)">
		<div class="timeline-panel">
			<div class="timeline-heading">
				<h4 class="subheading">Privacy Policy</h4>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Introduction</h4>
				<p class="text-muted">We, at 'EnggCell' and our affiliated companies worldwide, are committed to respecting your online privacy and recognize your need for appropriate protection and management of any personally identifiable information ("Personal Information") you share with us. In order to provide a personalised browsing experience, Naukri.com may collect information from you, this may include technical or other related information from the device used to access Naukri.com including without limitation contact lists in your device and its location, you may also be asked to complete a registration form. When you let us have your preferences, we will be able to deliver or allow you to access the most relevant information that meets your end. 
				<br />
				"Personal Information" means any information that may be used to identify an individual, including, but not limited to, a first and last name, a home or other physical address and an email address or other contact information, whether at work or at home. In general, you can visit EnggCell India Limited's web pages without telling us who you are or revealing any Personal Information about yourself. 
				</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Cookies and Other Tracking Technologies  </h4>
				<p class="text-muted">Some of our web pages utilize "cookies" and other tracking technologies. A "cookie" is a small text file that may be used, for example, to collect information about activity on the web site. Some cookies and other technologies may serve to recall Personal Information previously indicated by a Web user. Most browsers allow you to control cookies, including whether or not to accept them and how to remove them. 
				<br />
				You may set most browsers to notify you if you receive a cookie, or you may choose to block cookies with your browser, but please note that if you choose to erase or block your cookies, you will need to re-enter your original user ID and password to gain access to certain parts of the web site. 
				<br />
				Tracking technologies may record information such as internet domain and host names; internet protocol (IP) addresses; browser software and operating system types; clickstream patterns; and dates and times that our site is accessed. Our use of cookies and other tracking technologies allows us to improve our web site and your web experience. We may also analyze information that does not contain Personal Information for trends and statistics. 
				</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Third Party Services </h4>
				<p class="text-muted">Third parties provide certain services available on www.naukri.com on EnggCell India Limited's behalf. 'EnggCell’may provide information, including Personal Information, that 'EnggCell’ collects on the web to third-party service providers to help us deliver programs, products, information, and services. Service providers are also an important means by which 'EnggCell’ maintains its web sites and mailing lists. 'EnggCell’ will take reasonable steps to ensure that these third-party service providers are obligated to protect Personal Information on EnggCell India Limited's behalf. 
				<br />
				'EnggCell’ does not intend to transfer Personal Information without your consent to third parties who are not bound to act on EnggCell India Limited's behalf unless such transfer is legally required. Similarly, it is against EnggCell India Limited's policy to sell Personal Information collected online without consent. 
				</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Your Consent </h4>
				<p class="text-muted">By using this web site, you consent to the terms of our online Privacy Policy and to EnggCell India Limited's processing of Personal Information for the purposes given above as well as those explained where 'EnggCell’ collects Personal Information on the web. </p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Information security</h4>
				<p class="text-muted"> <ul class="text-muted">
					<li>We take appropriate security measures to protect against unauthorized access to or unauthorized alteration, disclosure or destruction of data.</li>
					<li>We restrict access to your personally identifying information to employees who need to know that information in order to operate, develop or improve our services.</li>
				</ul>
				</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Updating your information</h4>
				<p class="text-muted">We provide mechanisms for updating and correcting your personally identifying information for many of our services. For more information, please see the help pages for each service.</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Children</h4>
				<p class="text-muted">'EnggCell’ will not contact children under age 13 about special offers or for marketing purposes without a parent's permission.</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Information Sharing and Disclosure </h4>
				<p class="text-muted">
				'EnggCell’ does not rent, sell, or share personal information about you with other people (save with your consent) or non-affiliated companies except to provide products or services you've requested, when we have your permission, or under the following circumstances
					<ul class="text-muted">
						<li>We provide the information to trusted partners who work on behalf of or with 'EnggCell’ under confidentiality agreements. These companies may use your personal information to help 'EnggCell’ communicate with you about offers from 'EnggCell’ and our marketing partners. However, these companies do not have any independent right to share this information.</li>
						<li>We respond to subpoenas, court orders, or legal process, or to establish or exercise our legal rights or defend against legal claims;</li>
						<li>We believe it is necessary to share information in order to investigate, prevent, or take action regarding illegal activities, suspected fraud, situations involving potential threats to the physical safety of any person, violations of EnggCell India Limited's terms of use, or as otherwise required by law.</li>
						<li>We transfer information about you if 'EnggCell’ is acquired by or merged with another company. In this event, 'EnggCell’ will notify you before information about you is transferred and becomes subject to a different privacy policy.</li>
						<li></li>
					</ul>
				'EnggCell’ displays targeted advertisements based on personal information. Advertisers (including ad serving companies) may assume that people who interact with, view, or click on targeted ads meet the targeting criteria - for example, women ages 18-24 from a particular geographic area.
					<ul class="text-muted">
						<li>'EnggCell’ does not provide any personal information to the advertiser when you interact with or view a targeted ad. However, by interacting with or viewing an ad you are consenting to the possibility that the advertiser will make the assumption that you meet the targeting criteria used to display the ad.</li>
						<li>'EnggCell’ advertisers include financial service providers (such as banks, insurance agents, stock brokers and mortgage lenders) and non-financial companies (such as stores, airlines, and software companies).</li>
						<li></li>
					</ul>
				</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Confidentiality and Security</h4>
				<p class="text-muted">•	We limit access to personal information about you to employees who we believe reasonably need to come into contact with that information to provide products or services to you or in order to do their jobs. <br />
				•	" We have physical, electronic, and procedural safeguards that comply with the laws prevalent in India to protect personal information about you. We seek to ensure compliance with the requirements of the Information Technology Act, 2000 as amended and rules made thereunder to ensure the protection and preservation of your privacy.
				</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Changes to this Privacy Policy</h4>
				<p class="text-muted">'EnggCell’ reserves the right to update, change or modify this policy at any time. The policy shall come to effect from the date of such update, change or modification. </p>
			</div>
			<div class="timeline-body">
				<p class="text-muted"> <strong>Disclaimer </strong>Enggcell uses the maximum care as is possible to ensure that all or any data / information in respect of electronic transfer of money does not fall in the wrong hands. For completing online transactions involving payments a user is directed to a secured payment gateway, EnggCell India Ltd does not store or keep financial data such as credit card numbers/passwords/PINs etc "Personal Account Related Information". Since the transaction happens on a third party network not controlled by EnggCell India Limited, once an online transaction has been completed, the Personal Account Related Information is not accessible to anyone at EnggCell (India) Limited after completion of the on-line transaction at the payment gateway, this ensures maximum security. 
				<br />
				EnggCell shall not be liable for any loss or damage sustained by reason of any disclosure (inadvertent or otherwise) of any information concerning the user's account and / or information relating to or regarding online transactions using credit cards / debit cards and / or their verification process and particulars nor for any error, omission or inaccuracy with respect to any information so disclosed and used whether or not in pursuance of a legal process or otherwise. 
				</p>
			</div>
			<div class="timeline-body">
				<h4 class="subheading">Contact Information</h4>
				<p class="text-muted"> ’EnggCell’ welcomes your comments regarding this privacy statement at the contact address given at the website. Should there be any concerns about contravention of this Privacy Policy, 'EnggCell’ will employ all commercially reasonable efforts to address the same. 
				<br />
				<strong>Note :</strong> The terms in this agreement may be changed by EnggCell at any time. EnggCell is free to offer its services to any client/prospective client without restriction
				</p>
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
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; EnggCell 2017. All Rights Reserved</span>
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="<%= request.getContextPath() %>/assets/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%= request.getContextPath() %>/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <!-- Contact Form JavaScript -->
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script src="script.js"></script>
    <!--<script src="js/jqBootstrapValidation.js"></script>-->
    <!--<script src="js/contact_me.js"></script>-->
    <!--&lt;!&ndash; Theme JavaScript &ndash;&gt;-->
    <!--<script src="js/agency.min.js"></script>-->

</body>

</html>
