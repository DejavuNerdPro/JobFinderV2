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
    body {
        font-family: Arial, Helvetica, sans-serif;
        background-color: white;
    }

    *{
        box-sizing: border-box;
    }

    /* Add padding to containers */
    .container{
        padding: 0pax;
        background-color: ;
    }

    /* Full-width input fileds */
    input[type=text] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    input[type=text]:focus,
    input[type=password]:focus{
        background-color: #ddd;
        outline: none;
    }

    /* Overwrite default styles of hr */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    /* Set a style for the submit button */
    .registerbtn {
        background-color: #04AA6D;
        color: white;
        padding: 16px 20px;
        margin: 6px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .registerbtn:hover {
        opacity: 1;
    }

    /* Add a blue text color to links */
    a {
        color: dodgerblue;
    }

/* */
    .create {
        background-color: #f1f1f1;
        text-align: center;
           }

    </style>
</head>
<body>
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
            <a href="adminHome.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary">Admin</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="adminHome.jsp" class="nav-item nav-link">Home</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Jobs</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="joblist.jsp" class="dropdown-item">Job List</a>
                            <a href="jobdetail.jsp" class="dropdown-item">Job Detail</a>
                            <a href="category.jsp" class="dropdown-item">Job Category</a>
                        </div>
                    </div>

                    <a href="remove-update-job.jsp" class="nav-item nav-link">Remove | Update Jobs</a>
                </div>
                <a href="adminHome.jsp" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">Job Seeker<i class="fa fa-arrow-right ms-3"></i></a>
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Create a job Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gy-5 gx-4">
                    <div class="col-lg-8">
                        <div class="d-flex align-items-center mb-5">

        <form action="/JobFinder/updateJob" method="get">
            <div class="container">
                <h1>Update a job </h1>
                <p>Please fill in this form to create a job</p>
                <hr>
                <div class="row"><div class="col-md-3"></div><div class="col-md-6">
                <table cellspacing="20">
                <tr>
                <td><label for="jobname"><b>Job ID</b></label></td>
                <td><input type="text" placeholder="Enter job position" name="jobId" id="jobname" required value="${param.jobId}"></td>
                </tr>
                <tr>
                <td><label for="jobname"><b>Job Position</b></label></td>
                <td><input type="text" placeholder="Enter job position" name="title" id="jobname" required value="${param.position}"></td>
                </tr>
                <tr>
                <td><label for="jobdescription"><b>Job Description</b></label></td>
                <td><input type="text" placeholder="Enter a job Description" name="description" id="jobdescription" required value="${param.description}"></td>
                </tr>
                <tr>
                <td><label for="jobtype"><b>Job Type</b></label></td>
                <td><input type="text" placeholder="Enter a job Type" name="type" id="jobtype" required value="${param.type}"></td>
                </tr>
                <tr>
                <td><label for="salary"><b>Salary</b></label></td>
                <td><input type="text" placeholder="Enter Salary" name="salary" id="salary" required value="${param.salary}" ><br/></td>
                </tr>
                <tr>
                <td><label for="jobqualification"><b>Job Qualification</b></label></td>
                <td><input type="text" placeholder="Enter a job Qualification" name="qualification" id="jobqualification" required value="${param.qualification}"></td>
                </tr>
                <tr>
                <td><label for="jobresponsibility"><b>Job Responsibility</b></label></td>
                <td><input type="text" placeholder="Enter a job Responsibility" name="responsibility" id="jobresponsibility" required value="${param.responsibility}"><br/></td>
                </tr>
                <tr>
                <td><label for="address"><b>Address</b></label></td>
                <td><input type="text" placeholder="Enter a job location" name="location" id="address" required value="${param.address}"></td>
                </tr>
                <tr>
                <td><label for="companydetails"><b>Company Details</b></label></td>
                <td><input type="text" placeholder="Enter company Details" name="company" id="companydetails" required value="${param.companydetails}"></td>
                </tr>
                </table>
                <center><button class="btn btn-sm btn-primary" type="submit" class="registerbtn">Post</button></center>
                </div></div><div class="col-md-3"></div>
                <script>
                    function myFunction(){
                        alert("Update Successful !!")
                    }
                </script>


            </div>
        </form>
    </div>
</div>
</div>
</div>
</div>

        <!-- Create a job End -->


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