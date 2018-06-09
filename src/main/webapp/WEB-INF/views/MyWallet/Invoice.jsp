<%@page import="com.instamojo.wrapper.exception.InvalidPaymentOrderException"%>
<%@page import="com.instamojo.wrapper.response.CreatePaymentOrderResponse"%>
<%@page import="com.instamojo.wrapper.exception.ConnectionException"%>
<%@page import="com.instamojo.wrapper.api.InstamojoImpl"%>
<%@page import="com.instamojo.wrapper.api.Instamojo"%>
<%@page import="com.instamojo.wrapper.model.PaymentOrder"%>
<%@page import="com.enggcell.utilities.Constant"%>
<%@page import="java.util.List"%>
<%@page import="com.enggcell.entities.Cities"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="com.enggcell.entities.Registrations"%>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>


<%
Cities citt = null;
String regIdd = "";
String preferedCityCollegee = "";
String preferedCityAddresss = "";
String preferedCityDatee = "";
String preferedCityFeee = "";
String firstNameFull = "";
String emaill = "";
if (request.getAttribute("registration") != null && !request.getAttribute("registration").equals("") && request.getAttribute("prefcities") != null && !request.getAttribute("prefcities").equals("prefcities")) {
    Registrations registrations = (Registrations) request.getAttribute("registration");
    firstNameFull = registrations.getFullName();
    emaill = registrations.getEmail();
    citt = (Cities)request.getAttribute("prefcities");
    preferedCityCollegee = citt.getCollege();
    preferedCityAddresss = citt.getAddress();
    preferedCityDatee = citt.getDate();
    preferedCityFeee = citt.getRegPrice();
    regIdd = registrations.getRegId();
}

%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <link rel="icon" href="<%= request.getContextPath() %>/assets/img/icon.png" type="image/png" sizes="16x16">
        <meta name="author" content="" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <title>Invoice</title>
            <link href="<%= request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />
            <link href="<%= request.getContextPath()%>/assets/vendor/bootstrap/css/custom-style.css" rel="stylesheet" />
            <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
            <style>
                .alert {
                    text-shadow: 0 1px 0 rgba(255, 255, 255, .2);
                    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .25), 0 1px 2px rgba(0, 0, 0, .05);
                    box-shadow: inset 0 1px 0 rgba(255, 255, 255, .25), 0 1px 2px rgba(0, 0, 0, .05);
                }
                .alert-success {
                    background-image: -webkit-linear-gradient(top, #dff0d8 0%, #c8e5bc 100%);
                    background-image:      -o-linear-gradient(top, #dff0d8 0%, #c8e5bc 100%);
                    background-image: -webkit-gradient(linear, left top, left bottom, from(#dff0d8), to(#c8e5bc));
                    background-image:         linear-gradient(to bottom, #dff0d8 0%, #c8e5bc 100%);
                    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdff0d8', endColorstr='#ffc8e5bc', GradientType=0);
                    background-repeat: repeat-x;
                    border-color: #b2dba1;
                }
                .alert-danger {
                    background-image: -webkit-linear-gradient(top, #f2dede 0%, #e7c3c3 100%);
                    background-image:      -o-linear-gradient(top, #f2dede 0%, #e7c3c3 100%);
                    background-image: -webkit-gradient(linear, left top, left bottom, from(#f2dede), to(#e7c3c3));
                    background-image:         linear-gradient(to bottom, #f2dede 0%, #e7c3c3 100%);
                    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2dede', endColorstr='#ffe7c3c3', GradientType=0);
                    background-repeat: repeat-x;
                    border-color: #dca7a7;
                }
                
                label{
                    text-align:left;
                }
            </style>
    </head>
    
                                
                            <%!
                            public boolean empty(String s)
                            	{
                            		if(s== null || s.trim().equals(""))
                            			return true;
                            		else
                            			return false;
                            	}
                            %>
                            <%!
                            	public String hashCal(String type,String str){
                            		byte[] hashseq=str.getBytes();
                            		StringBuffer hexString = new StringBuffer();
                            		try{
                            		MessageDigest algorithm = MessageDigest.getInstance(type);
                            		algorithm.reset();
                            		algorithm.update(hashseq);
                            		byte messageDigest[] = algorithm.digest();
                                        
                            		

                            		for (int i=0;i<messageDigest.length;i++) {
                            			String hex=Integer.toHexString(0xFF & messageDigest[i]);
                            			if(hex.length()==1) hexString.append("0");
                            			hexString.append(hex);
                            		}
                            			
                            		}catch(NoSuchAlgorithmException nsae){ }
                            		
                            		return hexString.toString();


                            	}
                            %>
                            <% 	
                            	String merchant_key="MsRcLc0U";
                            	String salt="VYnwvL0Jeu";
                            	String action1 ="";
                            	String base_url="https://test.payu.in";
                            	int error=0;
                            	String hashString="";
                            	
                             

                            	
                            	Enumeration paramNames = request.getParameterNames();
                            	Map<String,String> params= new HashMap<String,String>();
                                	while(paramNames.hasMoreElements()) 
                            	{
                                  		String paramName = (String)paramNames.nextElement();
                                  
                                  		String paramValue = request.getParameter(paramName);

                            		params.put(paramName,paramValue);
                            	}
                            	String txnid ="";
                            	if(empty(params.get("txnid"))){
                            		Random rand = new Random();
                            		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
                            		txnid=hashCal("SHA-256",rndm).substring(0,20);
                            	}
                            	else{
                            		txnid=params.get("txnid");
                            	}
                            	System.out.println(txnid);
                                    String udf2 = txnid;
                            	String txn="abcd";
                            	String hash="";// + "|" + 
                            	String hashSequence = merchant_key + "|" + txnid + "|" + preferedCityFeee + ".00" + "|" + "EnggCell Wallet" + "|" + firstNameFull + "|" + emaill + "|" + "udf1" + "|" + regIdd + "|" + "udf3" + "|" + "udf4" + "|" + "udf5" + "||||||" + "VYnwvL0Jeu";
                            	System.out.println(hashSequence);
                            	if(empty(params.get("hash")) && params.size()>0)
                            	{
                            		/*if( empty(params.get("key"))
                            			|| empty(params.get("txnid"))
                            			|| empty(params.get("amount"))
                            			|| empty(params.get("firstname"))
                            			|| empty(params.get("email"))
                            			|| empty(params.get("phone"))
                            			|| empty(params.get("productinfo"))
                            			|| empty(params.get("surl"))
                            			|| empty(params.get("furl"))
                            			|| empty(params.get("service_provider"))
                            	){*/
                            			
                            			error=1;
                            		    System.out.println("error------");
                            		//}
                            		//else{
                            			String[] hashVarSeq=hashSequence.split("\\|");
                            			
                            			for(String part : hashVarSeq)
                            			{
                            				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
                            				hashString=hashString.concat("|");
                            			}
                            			hashString=hashString.concat(salt);
                            			

                            			 hash=hashCal("SHA-512",hashString);
                            			action1=base_url.concat("/_payment");
                            		//}
                            	}
                            	else if(!empty(params.get("hash")))
                            	{
                            		hash=params.get("hash");
                            		action1=base_url.concat("/_payment");
                            	}
                            		

                            %>
                            <script>
                            
                            var hash='<%= hash %>';
                            //alert(hash);
                            /*function submitPayuForm() {
                            	
                            	if (hash == '')
                            		return;

                                  var payuForm = document.forms.payuForm;
                                  payuForm.submit();
                                }*/
                            </script>

<body>    
    

        <!-- Navigation -->
        <!-- <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top affix"> -->
        <!-- <div class="container"> -->
        <!-- <!-- Brand and toggle get grouped for better mobile display --> 
        <!-- <div class="navbar-header page-scroll"> -->
        <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
        <!-- <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i> -->
        <!-- </button> -->
        <!-- <a class="navbar-brand page-scroll" href="#page-top">EnggCell</a> -->
        <!-- </div> -->

        <!-- <!-- Collect the nav links, forms, and other content for toggling --> 
        <!-- <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
        <!-- <ul class="nav navbar-nav navbar-right"> -->
        <!-- <li class="hidden"> -->
        <!-- <a href="#page-top"></a> -->
        <!-- </li> -->
        <!-- <li class=""> -->
        <!-- <a class="page-scroll" href="#"></a> -->
        <!-- </li> -->
        <!-- <li class=""> -->
        <!-- <a class="page-scroll" href="#">Companies</a> -->
        <!-- </li> -->
        <!-- <li> -->
        <!-- <a class="page-scroll" href="#">About</a> -->
        <!-- </li> -->
        <!-- <li> -->
        <!-- <a class="page-scroll" href="#">Cities</a> -->
        <!-- </li> -->
        <!-- <li> -->
        <!-- <a class="page-scroll" href="#">Contact</a> -->
        <!-- </li> -->
        <!-- </ul> -->
        <!-- </div> -->
        <!-- <!-- /.navbar-collapse --> 
        <!-- </div> -->
        <!-- <!-- /.container-fluid --> 
        <!-- </nav> -->

        <br><br>
                <% if (request.getParameter("m") != null) {%>
                <%if (request.getParameter("m").equals("c")) {%>
                <div class="alert alert-success">
                    Payment has been completed successfully
                </div>
                <%} else if (request.getParameter("m").equals("perr")) {%>
                <div class="alert alert-danger">
                    Some error has occurred, please try again later.
                </div>
                <%}%>
                <%}%>
                <div class="container">
                    <% String regId = "0";
                        if (request.getAttribute("registration") != null && !request.getAttribute("registration").equals("") && request.getAttribute("prefcities") != null && !request.getAttribute("prefcities").equals("prefcities")) {
                            Registrations registrations = (Registrations) request.getAttribute("registration");
                            Cities cit = (Cities)request.getAttribute("prefcities");
                            String preferedCityCollege = cit.getCollege();
                            String preferedCityAddress = cit.getAddress();
                            String preferedCityDate = cit.getDate();
                            String preferedCityFee = cit.getRegPrice();
                            regId = registrations.getRegId();
                            

                    %>
                    <div class="row pad-top-botm ">
                        <div class="col-lg-6 col-md-6 col-sm-6 " style="text-align: center">
                            <img src="<%= request.getContextPath()%>/assets/logo.png" style="padding-bottom:20px;" />
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6" style="text-align: left">
                            <h2><strong><i>EnggCell</i></strong></h2>
                            <br />
                            <i>Address :</i> Noida, India.
                        </div>
                    </div>
                    <div  class="row text-center contact-info">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <hr />
                            <span>
                                <strong>Email : </strong>  contact@enggcell.in
                            </span>
                            <hr />
                        </div>
                    </div>
                    
                    
                    
              
    <div class = "row container">
       <div class = "col-lg-6 col-md-6 col-sm-12 col-xs-12">
       <h4><strong>Client Information</strong></h4>
           <form class="form-horizontal">
               <div class="form-group">
                   <label class="control-label col-sm-4" for="name" style = "text-align:left;"><span style = "font-weight:300;">Name</span></label>
                   <label class="control-label col-sm-6" for="name" style = "text-align:left;"><%=registrations.getFullName()%></label>
               </div>
               <div class="form-group">
                   <label class="control-label col-sm-4" for="address" style = "text-align:left;"><span style = "font-weight:300;">Address</span></label>
                   <label class="control-label col-sm-6" for="address" style = "text-align:left;"><%=registrations.getAddress()%></label>
               </div>
               <div class="form-group">
                   <label class="control-label col-sm-4" for="city" style = "text-align:left;"><span style = "font-weight:300;">City</span></label>
                   <label class="control-label col-sm-6" for="city" style = "text-align:left;"><%=registrations.getCity().toUpperCase()%></label>
               </div>
               <div class="form-group">
                   <label class="control-label col-sm-4" for="country" style = "text-align:left;"><span style = "font-weight:300;">Country</span></label>
                   <label class="control-label col-sm-6" for="country" style = "text-align:left;">India</label>
               </div>
               <div class="form-group">
                   <label class="control-label col-sm-4" for="mobile" style = "text-align:left;"><span style = "font-weight:300;">Call</span></label>
                   <label class="control-label col-sm-6" for="mobile" style = "text-align:left;"><%=registrations.getMobile()%></label>
               </div>
               <div class="form-group">
                   <label class="control-label col-sm-4" for="email" style = "text-align:left;"><span style = "font-weight:300;">Email</span></label>
                   <label class="control-label col-sm-6" for="email" style = "text-align:left;"><%=registrations.getEmail()%></label>
               </div>
               <div class="form-group">
                   <label class="control-label col-sm-4" for="college" style = "text-align:left;"><span style = "font-weight:300;">College</span></label>
                   <label class="control-label col-sm-6" for="college" style = "text-align:left;"><%=registrations.getCollege()%></label>
               </div>
               <div class="form-group">
                   <label class="control-label col-sm-4" for="id" style = "text-align:left;"><span style = "font-weight:300;">Registration Id</span></label>
                   <label class="control-label col-sm-6" for="id" style = "text-align:left;"><%=registrations.getRegId()%></label>
               </div>
           </form>
       </div>
       <div class = "col-lg-6 col-md-6 col-sm-12 col-xs-12">
           <h4>  <strong>Payment Details </strong></h4>
           <form class="form-horizontal">
           <div class="form-group">
               <label class="control-label col-sm-4" for="billAmount" style = "text-align:left;"><span style = "font-weight:300;">Bill Amount</span></label>
               <label class="control-label col-sm-6" for="billAmount" style = "text-align:left;">Rs. <%=preferedCityFee %></label>
           </div>
                            <%
                            String dayMonYear[] = registrations.getDate().split("/");
                            String day = dayMonYear[0];
                            int month = Integer.parseInt(dayMonYear[1]);
                            String year = dayMonYear[2];
                            String monthString = new DateFormatSymbols().getMonths()[month-1];
                            
                            %>
           <div class="form-group">
               <label class="control-label col-sm-4" for="billDate" style = "text-align:left;"><span style = "font-weight:300;">Bill Date</span></label>
               <label class="control-label col-sm-6" for="billDate" style = "text-align:left;"><%=day + " " + monthString + " " + year %></label>
           </div>
           <div class="form-group">
               <label class="control-label col-sm-4" for="paymentStatus" style = "text-align:left;"><span style = "font-weight:300;">Payment Status</span></label>
               <label class="control-label col-sm-6" for="paymentStatus" style = "text-align:left;"><%=registrations.getStatus() %></label>
           </div>
           <div class="form-group">
               <label class="control-label col-sm-4" for="billingId" style = "text-align:left;"><span style = "font-weight:300;">Booking Id</span></label>
               <label class="control-label col-sm-6" for="billingId" style = "text-align:left;"><%=registrations.getBookingId() %></label>
           </div>
           </form>
           <br>
           <h4>  <strong>Fair Details </strong></h4>
           <form class="form-horizontal">
           <div class="form-group">
               <label class="control-label col-sm-4" for="billAmount" style = "text-align:left;"><span style = "font-weight:300;">College</span></label>
               <label class="control-label col-sm-6" for="billAmount" style = "text-align:left;"><%=preferedCityCollege %></label>
           </div>
           <div class="form-group">
               <label class="control-label col-sm-4" for="billDate" style = "text-align:left;"><span style = "font-weight:300;">Address</span></label>
               <label class="control-label col-sm-6" for="billDate" style = "text-align:left;"><%=preferedCityAddress %></label>
           </div>
           <div class="form-group">
               <label class="control-label col-sm-4" for="paymentStatus" style = "text-align:left;"><span style = "font-weight:300;">Date of Fair</span></label>
               <label class="control-label col-sm-6" for="paymentStatus" style = "text-align:left;"><%=preferedCityDate %></label>
           </div>
           </form>
       </div>
    </div>
                    
                    
                    
                   <!--  <div  class="row pad-top-botm client-info">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <h4><strong>Client Information</strong></h4>
                            <strong id="name"></strong>
                            <br />
                            <b>Address :</b> <b id="address"></b> ,
                            <br />
                            <b>City :</b> <b id="location"></b> ,
                            <br />
                            India.
                            <br />
                            <b>Call :</b> <b id="contact"></b>
                            <br />
                            <b>E-mail :</b> <b id="email"></b>
                            <br />
                            <b>College Name :</b> <b id="email"></b>
                            <br />
                            <b>Registration id :</b> <b id="regId"></b>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <h4>  <strong>Payment Details </strong></h4>
                            <b>Bill Amount :  Rs. 1000 </b>
                            <br />
                            Bill Date :  
                            <br />
                            <b>Payment Status :  Pending </b>

                        </div>
                    </div>
                    -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <hr />
                            <div class="ttl-amts">
                                <h4> <strong>Bill Amount : Rs <%=preferedCityFee %></strong> </h4>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    
                    <form>
                    <div class="row pad-top-botm" style = "margin-left:0px;">
                    <input type=button name=print value="Print Invoice" onClick="window.print()" class="btn btn-alt btn-hover btn-info">
                    </div>
                    </form>
                    <br>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <strong> Important: </strong>
                            <ol>
                                <li>
                                    This is an electronic generated invoice so doesn't require any signature.

                                </li>          
                            </ol>
                            <input type="hidden" id="regIdC" name="regIdC" value="<%= registrations.getRegId()%>" class="col-md-4" placeholder="Registration Id"/>
                        </div>
                    </div>
                    <div class = "row">
                        <div class = "col-lg-12 col-md-12 col-sm-12">
                            <img src = "<%= request.getContextPath() %>/assets/img/sealOfTrust.png" alt = "Trust us" style = "width: 100%;">
                        </div>
                    </div>
                    
                    <%} else {%>
                    <%}%>

                </div>
                <!-- jQuery -->
                <script src="<%= request.getContextPath()%>/assets/vendor/jquery/jquery.min.js"></script>

                <!-- Bootstrap Core JavaScript -->
                <script src="<%= request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

                <!-- Plugin JavaScript -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

                <!-- Contact Form JavaScript -->
                <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
                <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
                <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
                <script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
                <script src="<%=request.getContextPath()%>/assets/script.js"></script>
                <script>
                
                if (window.print) {
                	//document.write('');
                	}
                
                
                            function printInvoice() {
                                var restorepage = document.body.innerHTML;
                                var printcontent = document.getElementById('print').innerHTML;
                                document.body.innerHTML = printcontent;
                                window.print();
                                document.body.innerHTML = restorepage;
                            }
                </script>
                <script>
//                    // Initialize Firebase
//                    var config = {
//                        apiKey: "AIzaSyBxAW0xlEZfW8PiYuGt1Ynqq9XblXwy4ns",
//                        authDomain: "clientdb-581ff.firebaseapp.com",
//                        databaseURL: "https://clientdb-581ff.firebaseio.com",
//                        projectId: "clientdb-581ff",
//                        storageBucket: "clientdb-581ff.appspot.com",
//                        messagingSenderId: "629508594814"
//                    };
//                    firebase.initializeApp(config);
//                    // Firebase connection established.
//                    console.log(firebase);
//                    var s = JSON.parse(localStorage.getItem("data"));
//                    $("#name").html(s.fullname);
//                    $("#location").html(s.location);
//                    $("#email").html(s.email);
//                    $("#contact").html(s.mobile);
//                  
                </script>
                </body>
                </html>
