<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>JobEntry - Job Portal Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <spring:url value="/resources/img/favicon.ico" var="favicon" htmlEscape="true"/>
    <spring:url value="/resources/script/animate/animate.min.css" var="animateCss" htmlEscape="true"/>
    <spring:url value="/resources/script/owlcarousel/assets/owl.carousel.min.css" var="owl" htmlEscape="true"/>
    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrap" htmlEscape="true"/>
    <spring:url value="/resources/css/style.css" var="style" htmlEscape="true"/>

    <!-- Favicon -->
    <link rel="icon" href="${favicon}">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <spring:url value="https://cdnjs.cloudflare.com/ajax/scripts/font-awesome/5.10.0/css/all.min.css" var="ajaxcss" htmlEscape="true"/>
    <link href="${ajaxcss}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!--scriptraries Stylesheet -->
    <link rel="stylesheet" href="${animateCss}">
    <link rel="stylesheet" href="${owl}">

    <!-- Customized Bootstrap Stylesheet -->
    <link rel="stylesheet" href="${bootstrap}">

    <!-- Template Stylesheet -->
    <link rel="stylesheet" href="${style}">
<style>

    .styled-table thead tr {
        background-color: #009879;
        color: #ffffff;
        text-align: left;
    }

    .styled-table th,
    .style-table td {
        padding: 12px 15px;
        text-align: center;
    }

    .styled-table tbody tr {
        border-bottom: 1px solid #dddddd;
    }

    .styled-table tbody tr:nth-of-type(even){
        background-color: #f3f3f3;
    }

    .styled-table tbody tr: last-of-type{
        border-bottom: 2px solid #009879;
    }

    .styled-table tbody tr.active-row {
        font-weight: bold;
        color: #009879;
    }
.modaljob { /* Hidden by default */
display:none;
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content-job {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.closejob {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.closejob:hover,
.closejob:focus {
  color: red;
  cursor: pointer;
}
.imgcontainerjob {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

/* Add Zoom Animation */
.animatejob {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)}
  to {-webkit-transform: scale(1)}
}

@keyframes animatezoom {
  from {transform: scale(0)}
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
.containerjob {
  padding: 16px;
}
</style>
</head>
<body>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="index.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary">JobEntry</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="home.jsp" class="nav-item nav-link">Home</a>
                    <a href="about.jsp" class="nav-item nav-link">About</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Jobs</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="job-list.jsp" class="dropdown-item">Job List</a>
                            <a href="job-detail.jsp" class="dropdown-item">Job Detail</a>
                            <a href="category.jsp" class="dropdown-item">Job Category</a>
                        </div>
                    </div>

                    <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                </div>
                <button class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" onclick="document.getElementById('id01').style.display='block'">Post A Job</button><i class="fa fa-arrow-right ms-3"></i>
            </div>
        </nav>
        <!-- Navbar End -->
<!-- Post A Job Model -->
<div id="id01" class="modaljob">

  <form class="modal-content-job animatejob" action="/JobFinder/postJob" method="get">
    <div class="imgcontainerjob">
      <span onclick="document.getElementById('id01').style.display='none'" class="closejob" title="Close Modal"><a href="index.jsp" style="text-decoration:none;color:red">&times;</a></span>
      <center><h2>Login</h2></center>
    </div>

    <div class="containerjob">
                <h1>Create a job </h1>
                <p>Please fill in this form to create a job</p>
                <hr>
                <label for="jobname"><b>Job Position</b></label>
                <input type="text" placeholder="Enter job position" name="jobname" id="jobname" required>

                <label for="jobdescription"><b>Job Description</b></label>
                <input type="text" placeholder="Enter a job Description" name="jobdescription" id="jobdescription" required>

                <label for="jobtype"><b>Job Type</b></label>
                <input type="text" placeholder="Enter a job Type" name="jobdescription" id="jobtype" required>

                <label for="salary"><b>Salary</b></label>
                <input type="text" placeholder="Enter Salary" name="salary" id="salary" required>

                <label for="jobqualification"><b>Job Qualification</b></label>
                <input type="text" placeholder="Enter a job Qualification" name="jobqualification" id="jobqualification" required>

                <label for="jobresponsibility"><b>Job Responsibility</b></label>
                <input type="text" placeholder="Enter a job Responsibility" name="jobresponsibility" id="jobresponsibility" required>

                <label for="address"><b>Address</b></label>
                <input type="text" placeholder="Enter a job location" name="address" id="address" required>

                <label for="companydetails"><b>Company Details</b></label>
                <input type="text" placeholder="Enter company Details" name="companydetails" id="companydetails" required>

                <button type="submit" class="registerbtn" onclick="myFunction()">Update</button>
                <script>
                    function myFunction(){
                    	var modal = document.getElementById('id01');
                    	model.style.display="none";
                        alert("Update Successful !!");
                    }
                </script>
            </div>
  </form>
</div>
<!-- End of Post A Job Model -->
        <!-- -->
             <table class="styled-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Mail</th>
                        <th>Position</th>
                        <th>File</th>

                    </tr>
                </thead>

                <tbody>
                    <tr class="active-row">
                        <td>1</td>
                        <td>Dom</td>
                        <td>dom@gmail.com</td>
                        <td>Software Enginer</td>
                    </tr>
                </tbody>

            </table>
        <!-- -->

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Company</h5>
                        <a class="btn btn-link text-white-50" href="">About Us</a>
                        <a class="btn btn-link text-white-50" href="">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="">Our Services</a>
                        <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link text-white-50" href="">About Us</a>
                        <a class="btn btn-link text-white-50" href="">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="">Our Services</a>
                        <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Contact</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>No-169,MTP Condo, 9th Floor, AinSein Road, Hlaing Township, Yangon</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+95 9795519692</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>htetarkarkyaw88@gmail.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>

                </div>
            </div>

        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

<spring:url value="/resources/script/wow/wow.min.js" var="wow" htmlEscape="true"/>
<spring:url value="/resources/script/easing/easing.min.js" var="easing" htmlEscape="true"/>
<spring:url value="/resources/script/waypoints/waypoints.min.js" var="waypoints" htmlEscape="true"/>
<spring:url value="/resources/script/owlcarousel/owl.carousel.min.js" var="carouseljs" htmlEscape="true"/>

    <!-- JavaScript scriptraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${wow}"></script>
    <script src="${easing}"></script>
    <script src="${waypoints}"></script>
    <script src="${carouseljs}"></script>

    <!-- Template Javascript -->
    <spring:url value="/resources/js/main.js" var="main" htmlEscape="true"/>
    <script src="${main}"></script>
</body>
</html>