
<%@page import="entity.Video"%>
<%@page import="controller.DbVideo"%>
<%@page import="entity.Picture"%>
<%@page import="entity.Service"%>
<%@page import="controller.DbPicture"%>
<%@page import="controller.DbService"%>
<%@page import="entity.Property"%>
<%@page import="controller.DbProperty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>معلومات المشروع</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="#" type="image/x-icon" />
    <link rel="apple-touch-icon" href="#" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Pogo Slider CSS -->
    <link rel="stylesheet" href="css/pogo-slider.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />
<link rel="stylesheet" href="css/my_style.css" />
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
 <%@page import="entity.Client"%>
 <%@page import="controller.DbClient"%>
 <%@page import="entity.Project"%>
 <%@page import="controller.DbProject"%>
 
 <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
    

<%       
    List<Project>projects=new ArrayList<Project>();
        
//        check for logi

        Object o=session.getAttribute(Client.IS_LOGIN);
        if(o!=null){
            String role=(String)session.getAttribute(Client.ROLE);
            if(!role.equals(Client.CLIENT))
                response.sendRedirect("index.jsp");
            else{
            }
        }else{
            response.sendRedirect("index.jsp");
        }

        String project_id=request.getParameter(Project.PROJECT_ID);
        if(project_id==null)
            response.sendRedirect("ClientProjects.jsp");
        
        int id=Integer.parseInt(project_id);
         List<Property>properties=DbProperty.get_all_properties(id);
         List<Service>services=DbService.get_project_services(id);
         List<Picture>pictures=DbPicture.get_all(id);
         List<Video>videos=DbVideo.get_all(id);
         
        %>
        
<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

    <!-- LOADER -->
    <div id="preloader">
        <div class="loader">
            <img src="images/loader.gif" alt="#" />
        </div>
    </div>
    <!-- end loader -->
    <!-- END LOADER -->

    <!-- Start header -->
    <header class="top-header">
        <div class="header_top">
            
            <div class="container">
                <div class="row">
                    <div class="logo_section">
                        <a class="navbar-brand" href="index.jsp"><img src="images/logo.jpg" alt="image"></a>
                    </div>
                    <div class="site_information">
                        <ul>
                            <li><a href=""><img src="images/mail_icon.png" alt="#"/></a></li>
                            <li><a href=""><img src="images/phone_icon.png" alt="#" /></a></li>
                            <li><a class="join_bt" href="Logout.jsp">تسجيل خروج</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        
        </div>
        <div class="header_bottom">
          <div class="container">
            <div class="col-sm-12">
                <div class="menu_orange_section" style="background: #ff880e;">
                   <nav class="navbar header-nav navbar-expand-lg"> 
                     <div class="menu_section">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                    <ul class="navbar-nav">
                        
                        <li><a class="nav-link" href="ClientProjects.jsp">المشاريع</a></li>
                        <li><a class="nav-link" href="ClientProjects.jsp">العقارات</a></li>
                        <li><a class="nav-link" href="ClientQuestions.jsp">الاستفسارات</a></li>
                        <li><a class="nav-link" href="ClientAddQuestion.jsp">إضافة استفسار</a></li>
                         <li><a class="nav-link" href="Map.jsp">الخريطة</a></li>
                    </ul>
                </div>
                     </div>
                 </nav>
                 
                </div>
            </div>
          </div>
        </div>
        
    </header>
    <!-- End header -->

 <!-- Start Banner -->
    <div class="section inner_page_banner">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="banner_title">
                        <h3>
                            ِِAll Information About Project : 
                            <%=DbProject.get_project(Integer.parseInt(project_id)).project_name%>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner -->
    <div class="section layout_padding_register">
        <div class="container-fluid">
           
            <div class="row">
                <div class="col-md-12 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                     <table id="customers">
  <tr>
    <th>العقار</th>
    <th>السعر </th>
    <th>العنوان</th>
    <th>المساحة</th>
    <th>النوع</th>
    <th>عدد الغرف</th>
  </tr>
  <% for(Property p : properties){%>
  <tr>
      <td><%= p.property_id %></td>
      <td>
          <%= p.price%>
      </td>
      <td>
          <%= p.address%>
      </td>
       <td>
          <%= p.area%>
      </td>
       <td>
          <%= p.kind%>
      </td>
       <td>
          <%= p.room%>
      </td>
   
  </tr>
  <% }%>
  
                     </table>
                    </div>
                </div>
                
                
                
            </div>
         
        </div>
    </div>
  <div class="section layout_padding_register">
        <div class="container-fluid">
           
            <div class="row">
                <div class="col-md-12 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                     <table id="customers">
  <tr>
    <th>الخدمة</th>
    <th>معلومات الخدمة </th>
  </tr>
  <% for(Service s : services){%>
  <tr>
      <td><%= s.service_id %></td>
      <td>
          <%= s.service_title%>
      </td>
   
  </tr>
  <% }%>
  
                     </table>
                    </div>
                </div>
                
                
                
            </div>
         
        </div>
    </div>
  
        <div class="container">
           
            <div class="row">
                <%for(Picture p :pictures){%>
                <div class="col-sm-4" style="width:30%">
                    <img  style="width:300px;height: 300px" src="<%=p.picture_path%>">
                </div>
                <%}%>
                
           
                
            </div>
         
        </div>
                
                  <div class="container">
           
            <div class="row">
                <%for(Video v :videos){%>
                <div class="col-sm-4" style="width:30%">
                    <video width="320" height="240" controls>
                        <source src="<%=v.video_path%>" type="video/<%=v.video_path.substring(v.video_path.lastIndexOf(".")+1)%>">
  Your browser does not support the video tag.
</video>
                </div>
                <%}%>
                
           
                
            </div>
         
        </div>
    <!-- end contact_form -->
   
    <!-- Start Footer -->
    <footer class="footer-box">
        <div class="container">
            <div class="row">
               <div class="col-md-12 white_fonts">
                    <div class="row">
                       
                      
                  
					</div>
                </div>
			 </div>
        </div>
    </footer>
    <!-- End Footer -->

    
    <a href="#" id="scroll-to-top" class="hvr-radial-out"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.pogo-slider.min.js"></script>
    <script src="js/slider-index.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/custom.js"></script>
	<script>
	/* counter js */

(function ($) {
	$.fn.countTo = function (options) {
		options = options || {};
		
		return $(this).each(function () {
			// set options for current element
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);
			
			// how many times to update the value, and how much to increment the value on each update
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;
			
			// references & variables that will change with each update
			var self = this,
				$self = $(this),
				loopCount = 0,
				value = settings.from,
				data = $self.data('countTo') || {};
			
			$self.data('countTo', data);
			
			// if an existing interval can be found, clear it first
			if (data.interval) {
				clearInterval(data.interval);
			}
			data.interval = setInterval(updateTimer, settings.refreshInterval);
			
			// initialize the element with the starting value
			render(value);
			
			function updateTimer() {
				value += increment;
				loopCount++;
				
				render(value);
				
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}
				
				if (loopCount >= loops) {
					// remove the interval
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;
					
					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}
			
			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.html(formattedValue);
			}
		});
	};
	
	$.fn.countTo.defaults = {
		from: 0,               // the number the element should start at
		to: 0,                 // the number the element should end at
		speed: 1000,           // how long it should take to count between the target numbers
		refreshInterval: 100,  // how often the element should be updated
		decimals: 0,           // the number of decimal places to show
		formatter: formatter,  // handler for formatting the value before rendering
		onUpdate: null,        // callback method for every time the element is updated
		onComplete: null       // callback method for when the element finishes updating
	};
	
	function formatter(value, settings) {
		return value.toFixed(settings.decimals);
	}
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
	formatter: function (value, options) {
	  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
	}
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
	var $this = $(this);
	options = $.extend({}, options || {}, $this.data('countToOptions') || {});
	$this.countTo(options);
  }
});
	</script>
</body>

</html>
