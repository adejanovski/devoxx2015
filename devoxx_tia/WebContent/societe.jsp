<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Devoxx 2015 - TIA Cassandra et SparkSQL</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
 <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>DEVOXX 2015 - TIA SparkSQL et Cassandra</b></a>
            <!--logo end-->
            
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">                            	  
              	  	
                  <li class="sub-menu">
                      <a href="index.html">
                          <i class="fa fa-dashboard"></i>
                          <span>Accueil</span>
                      </a>
                  </li>
                  

                  <li class="sub-menu">
                      <a href="speakers.html" >
                          <i class="fa fa-desktop"></i>
                          <span>Speakers</span>
                      </a>                      
                  </li>

                  <li class="sub-menu">
                      <a href="buzzwords.html" >
                          <i class="fa fa-cogs"></i>
                          <span>Buzzwords</span>
                      </a>                  
                  </li>
                  <li class="sub-menu" class="active" >
                      <a href="societe.html" >
                          <i class="fa fa-cogs"></i>
                          <span>Soci&eacute;t&eacute;s</span>
                      </a>                  
                  </li>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
      			
      			<div class="col-lg-12 main-chart">
                     
					
					<div class="row">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <h1><%out.print(request.getParameter("societe")); %></h1>
                      </div>
                      <div class="col-lg-12">
                          <div class="content-panel">							  
                              <div class="panel-body text-center" id="graph-container">
                                  <div id="societe-chart"  class="graph"></div>
                              </div>
                          </div>
                      </div>
                      <!--custom chart end-->
					</div><!-- /row -->	
					</div><!-- /col-lg-9 END SECTION MIDDLE -->
              <div class="row">
                  <div class="col-lg-12 main-chart">
                  	<div class="col-lg-12 main-chart">	                  		                                     
					
					<div class="row">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <h1><%out.print(request.getParameter("societe")); %></h1>
                      </div>
                      <div class="col-lg-12">
                          <div class="content-panel">							  
                              <div class="panel-body " >
                                  <div id="talks"></div>
                              </div>
                          </div>
                      </div>
                      <!--custom chart end-->
					</div><!-- /row -->	
					</div><!-- /col-lg-9 END SECTION MIDDLE -->
                  </div><!-- /col-lg-12 END SECTION MIDDLE -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  
              </div><! --/row -->
          </section>
      </section>

      <!--main content end-->

  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>
	 <!--script for this page-->
    
    <script src="assets/js/raphael-min.js"></script>	
    <script src="assets/js/morris.js"></script>
	<script src="js/devoxx.js"></script>
	
	<script type="text/javascript">
        $(document).ready(function () {
        	getSocieteTalks('<%out.print(request.getParameter("societe")); %>');
        	getSocieteChart('<%out.print(request.getParameter("societe")); %>');
        	        
        });
	</script>
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
  

  </body>
</html>
