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
        <title>الخريطة</title>
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

    <style>
               #map{
                width:800px;
                height:800px;
            }
        </style>
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
        
//        check for login
       String role="";
        Object o=session.getAttribute(Client.IS_LOGIN);
        if(o!=null){
            role=(String)session.getAttribute(Client.ROLE);
           
        }else{
            response.sendRedirect("index.jsp");
        }
        
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
                                 <li><a class="join_bt" href="Logout.jsp">Logout</a></li>
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
                           <ul class="navbar-nav">
                        <%if (role.equals(Client.ADMIN)){%>
                      <li><a class="nav-link" href="AdminProjects.jsp">المشاريع</a></li>
                        <li><a class="nav-link" href="AdminAddProject.jsp">إضافة مشروع</a></li>
                        <li><a class="nav-link" href="AdminViewQuestions.jsp">الاستفسارات</a></li>
                        <%}else{%>
                      
                        <li><a class="nav-link" href="ClientProjects.jsp">المشاريع</a></li>
                        <li><a class="nav-link" href="ClientProjects.jsp">العقارات</a></li>
                        <li><a class="nav-link" href="ClientQuestions.jsp">الاستفسارات</a></li>
                        <li><a class="nav-link" href="ClientAddQuestion.jsp">إضافة استفسار</a></li>
                        <%}%>
                         <li><a class="nav-link" href="Map.jsp">الخريطة</a></li>
                         
                    </ul>
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
                            <h3>خريطة تظهر توزع   العقارات   في سوريا</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Banner -->



        <div class="section contact_form_nophoto">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12 offset-lg-3">
                        <div class="full">
                            <div class="contact_form_inner">
                         <div id="map"></div>
                             <script>
                                 var map;
                                 function InitializeMap() {
                                     var latlngc = new google.maps.LatLng(35.216667, 38.583333);
                                     var myOptions = {
                                         zoom: 7,
                                         center: latlngc,
                                         mapTypeId: google.maps.MapTypeId.ROADMAP,

                                         scaleControl: false,
                                         draggable: false
                                     };

                                     map = new google.maps.Map(document.getElementById("map"), myOptions);


                                     //multiple markers
                                     var marker;
                                     var infowindow;
                                     var ltlng = [];
                                     var contents = [
                                         " الحسكة <br/>العقار 1 ",
                                         " ديرالزور <br/>العقار 2",
                                         " حلب <br/>العقار3",
                                         " اللاذقية <br/>العقار4",
                                         " حماة<br/>العقار5",
                                         " طرطوس<br/>العقار6",
                                         " حمص <br/>العقار7",
                                         " دمشق<br/>العقار 8",
                                         " ريف دمشق<br/>  العقار 9",
                                         " درعا<br/> العقار 10",
                                         " السويداء<br/>العقار 12 ",
                                     "القنيطرة<br/>العقار 11  "]
                                     //الحسكة
                                     ltlng.push(new google.maps.LatLng(36.468403, 40.765659));
                                     //دير الزور
                                     ltlng.push(new google.maps.LatLng(35.344246, 40.151922));
                                     //حلب
                                     ltlng.push(new google.maps.LatLng(36.204734, 37.141808));
                                     //اللاذقية
                                     ltlng.push(new google.maps.LatLng(35.52441, 35.817887));
                                     //حماة
                                     ltlng.push(new google.maps.LatLng(35.140105, 36.754390));
                                     //طرطوس
                                     ltlng.push(new google.maps.LatLng(34.797898, 35.970443));
                                     //حمص
                                     ltlng.push(new google.maps.LatLng(34.758272, 36.735500));
                                     //دمشق
                                     ltlng.push(new google.maps.LatLng(33.513862, 36.282803));
                                     //دمشق ريف
                                     ltlng.push(new google.maps.LatLng(33.2, 36.282803));
                                     //درعا
                                     ltlng.push(new google.maps.LatLng(32.620061, 36.110768));
                                     //السويداء
                                     ltlng.push(new google.maps.LatLng(32.709851,36.574718));
                                      //القنيطرة
                                     ltlng.push(new google.maps.LatLng(32.9,35.99));

                                     //map.setCenter(ltlng[0]);
                                     for (var i = 0; i < ltlng.length; i++) {
                                         marker = new google.maps.Marker({
                                             map: map,
                                             position: ltlng[i]
                                         });

                                         (function (i, marker) {

                                             google.maps.event.addListener(marker, 'click', function () {

                                                 if (!infowindow) {
                                                     infowindow = new google.maps.InfoWindow();
                                                 }

                                                 infowindow.setContent(contents[i]);

                                                 infowindow.open(map, marker);

                                             });

                                         })(i, marker);

                                     }
                                 }
                                 window.onload = InitializeMap;
                             </script>
                             <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
                         </div>
                        </div>
                    </div>



                </div>

            </div>
        </div>

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

        <div class="footer_bottom">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                    </div>
                </div>
            </div>
        </div>

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
