<%@page import="java.text.DateFormatSymbols"%>
<%@page import="com.enggcell.entities.Cities"%>
<%@page import="com.enggcell.entities.Registrations"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
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
            </style>
    </head>
    <body>

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
                        if (request.getAttribute("registrations") != null && !request.getAttribute("registrations").equals("") && request.getAttribute("prefcities") != null && !request.getAttribute("prefcities").equals("prefcities")) {
                            Registrations registrations = (Registrations) request.getAttribute("registrations");
                            Cities cit = (Cities)request.getAttribute("prefcities");
                            String preferedCityCollege = cit.getCollege();
                            String preferedCityAddress = cit.getAddress();
                            String preferedCityDate = cit.getDate();
                            String preferedCityFee = cit.getRegPrice();
                            regId = registrations.getRegId();
                    %>
                    <div id="print">
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
                        <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <hr />
                            <div class="ttl-amts">
                                <h4> <strong>Bill Amount : Rs <%=preferedCityFee %></strong> </h4>
                            </div>
                        </div>
                    </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <strong> Important: </strong>
                                <ol>
                                    <li>
                                        This is an electronic generated invoice so doesn't require any signature.

                                    </li>
                                    <li>
                                        Please read all terms and polices on <a href="http://www.enggcell.in">www.enggcell.in</a> for any queries and other issues.

                                    </li>
                                    
                                    <p>
                                Note that the Date and Venue mentioned on the website 
                                or on invoice or any social advertisement can be changed 
                                if any mishappening happens during or before the 
                                commencement date of fair. The registration fee is one 
                                time fee and non-refundable. If any candidates could not 
                                attend fair and have registered already, EnggCell is not 
                                responsible for that, and EnggCell will not refund his 
                                registration fee at any cost. Companies listed here may 
                                change if companies opt-out at the last moment. EnggCell 
                                will allow the registerd candidates to participate in 
                                another company available at that time, Candidates can 
                                choose as per his/her choice. If EnggCell cancels the 
                                fair(Due to unavoidable circumstances) in any particular 
                                city, Registration fee of candidates of that city will 
                                be refunded in next 45 days from the date on which fair 
                                was about to organize. If Companies do not select or don't 
                                provide offer letter to any candidates, EnggCell is not 
                                responsible for any such type of issues. Please not that 
                                EnggCell is only a fair organizer whose aim to increase 
                                employment opportunities for the students and offer wider 
                                choice for selection to the recruiters under one roof. 
                                There is no any connection or relation between EnggCell and 
                                Students or EnggCell and Companies or EnggCell and Colleges. 
                                If any mishappening happens between students and companies or 
                                students and colleges or companies and colleges, EnggCell is 
                                not responsible for such type of issues, victims need to solve 
                                their pro by own. Students are advised to Select companies very 
                                carefully and at the time of registration and at the time 
                                joining check and verify companies and their profiles very 
                                carefully. Customer Solicitation: Unless you notify our third 
                                party call center reps or direct EnggCell sales reps, while they 
                                are calling you, of your desire to opt out from further direct
                                company communications and solicitations, you are agreeing to 
                                continue to receive further emails and call solicitations EnggCell 
                                and its designated in house or third party call team(s).
                                </p>
                                <p>Opt Out Procedure: We provide 3 easy ways to opt out of from future solicitations.</p>
                                <ol>
                                <li>1. You may use the opt out link found in any email solicitation that you may receive.</li>
                                <li>2. You may also choose to opt out, via sending your email address to: hr@enggcell.in.</li>
                                </ol>
                                </ol>
                                <input type="hidden" id="regIdC" name="regIdC" value="<%= registrations.getRegId()%>" class="col-md-4" placeholder="Registration Id"/>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <div class="row pad-top-botm">
                        <button onclick="printInvoice()" class="btn btn-alt btn-hover btn-info">
                            <span>Print Invoice</span>
                            <i class="glyph-icon icon-print"></i>
                        </button>
                        <br/>
                    </div>
                </div>
                    <br/>
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
                <script src="<%= request.getContextPath()%>/assets/script.js"></script>
                <script>
                            function printInvoice() {
                                var restorepage = document.body.innerHTML;
                                var printcontent = document.getElementById('print').innerHTML;
                                document.body.innerHTML = printcontent;
                                window.print();
                                document.body.innerHTML = restorepage;
                            }
                </script>
                </body>
                </html>
