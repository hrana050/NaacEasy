<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage/Naacmaster.master" AutoEventWireup="true" CodeFile="naacdashboard.aspx.cs" Inherits="Home_naacdashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="../NaacCustomFiles/css/font-awesome.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Addmeetingbtn").click(function () {
          
                $("#meetingaddsec").show();
                $("#addmeetingdiv").show();
                $("#meetinglistdiv").hide();
                $("#meetinglistsec").hide();
                
                
            });
            //$("#Addmeetingbtn").click(function () {
            //    $("#addmeetingdiv").show();
            //    $("#meetinglistdiv").hide();
            //    $("#meetinglistsec").show();
            //});
        });
        function opendiv()
        {
            $("#meetingaddsec").hide();
            $("#addmeetingdiv").hide();
            $("#meetinglistdiv").show();
            $("#meetinglistsec").show();
        }

    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var today = new Date(),
                year = today.getFullYear(),
                month = today.getMonth(),
                monthTag = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                day = today.getDate(),
                days = document.getElementsByTagName('td'),
                selectedDay,
                setDate,
                daysLen = days.length;
            // options should like '2014-01-01'
            function Calendar(selector, options) {
                this.options = options;
                this.draw();
            }

            Calendar.prototype.draw = function () {
                this.getCookie('selected_day');
                this.getOptions();
                this.drawDays();
                var that = this,
                //    reset = document.getElementById('reset'),
                    pre = document.getElementsByClassName('pre-button'),
                    next = document.getElementsByClassName('next-button');

                pre[0].addEventListener('click', function () { that.preMonth(); });
                next[0].addEventListener('click', function () { that.nextMonth(); });
             //   reset.addEventListener('click', function () { that.reset(); });
                while (daysLen--) {
                    days[daysLen].addEventListener('click', function () { that.clickDay(this); });
                }
            };

            Calendar.prototype.drawHeader = function (e) {
                var headMonth = document.getElementsByClassName('head-month');
                    headDay = document.getElementsByClassName('head-day'),
                    

               // e ? 
                headMonth[0].innerHTML = monthTag[month] + " - " + year;
            };

            Calendar.prototype.drawDays = function () {
                var startDay = new Date(year, month, 1).getDay(),
       
                    nDays = new Date(year, month + 1, 0).getDate(),

                    n = startDay;
                for (var k = 0; k < 42; k++) {
                    days[k].innerHTML = '';
                    days[k].id = '';
                    days[k].className = '';
                }

                for (var i = 1; i <= nDays ; i++) {
                    days[n].innerHTML = i;
                    n++;
                }

                for (var j = 0; j < 42; j++) {
                    if (days[j].innerHTML === "") {

                        days[j].id = "disabled";

                    } else if (j === day + startDay - 1) {
                        if ((this.options && (month === setDate.getMonth()) && (year === setDate.getFullYear())) || (!this.options && (month === today.getMonth()) && (year === today.getFullYear()))) {
                            this.drawHeader(day);
                            days[j].id = "today";
                        }
                    }
                    if (selectedDay) {
                        if ((j === selectedDay.getDate() + startDay - 1) && (month === selectedDay.getMonth()) && (year === selectedDay.getFullYear())) {
                            days[j].className = "selected";
                            this.drawHeader(selectedDay.getDate());
                        }
                    }
                }
            };

            Calendar.prototype.clickDay = function (o) {
                var selected = document.getElementsByClassName("selected"),
                    len = selected.length;
                if (len !== 0) {
                    selected[0].className = "";
                }
                o.className = "selected";
                selectedDay = new Date(year, month, o.innerHTML);
                this.drawHeader(o.innerHTML);
                this.setCookie('selected_day', 1);

            };

            Calendar.prototype.preMonth = function () {
                if (month < 1) {
                    month = 11;
                    year = year - 1;
                } else {
                    month = month - 1;
                }
                this.drawHeader(1);
                this.drawDays();
            };

            Calendar.prototype.nextMonth = function () {
                if (month >= 11) {
                    month = 0;
                    year = year + 1;
                } else {
                    month = month + 1;
                }
                this.drawHeader(1);
                this.drawDays();
            };

            Calendar.prototype.getOptions = function () {
                if (this.options) {
                    var sets = this.options.split('-');
                    setDate = new Date(sets[0], sets[1] - 1, sets[2]);
                    day = setDate.getDate();
                    year = setDate.getFullYear();
                    month = setDate.getMonth();
                }
            };

      

            Calendar.prototype.setCookie = function (name, expiredays) {
                if (expiredays) {
                    var date = new Date();
                    date.setTime(date.getTime() + (expiredays * 24 * 60 * 60 * 1000));
                    var expires = "; expires=" + date.toGMTString();
                } else {
                    var expires = "";
                }
                document.cookie = name + "=" + selectedDay + expires + "; path=/";
            };

            Calendar.prototype.getCookie = function (name) {
                if (document.cookie.length) {
                    var arrCookie = document.cookie.split(';'),
                        nameEQ = name + "=";
                    for (var i = 0, cLen = arrCookie.length; i < cLen; i++) {
                        var c = arrCookie[i];
                        while (c.charAt(0) == ' ') {
                            c = c.substring(1, c.length);

                        }
                        if (c.indexOf(nameEQ) === 0) {
                            selectedDay = new Date(c.substring(nameEQ.length, c.length));
                        }
                    }
                }
            };
            var calendar = new Calendar();


        }, false);
</script>
<style>

table {
	border-spacing: 2px;
}
.clearfix:before,
.clearfix:after {
    content: " "; /* 1 */
    display: table; /* 2 */
}

.clearfix:after {
    clear: both;
}
/**
 * For IE 6/7 only
 * Include this rule to trigger hasLayout and contain floats.
 */
.clearfix {
    *zoom: 1;
}
a, a:hover {
    text-decoration: none;
}

.elegant-calencar {
    height: 31em;
    text-align: center;
    position: relative;
}

#header {
    height: 5em;
    background-color: #FDFDFD;
    margin-bottom: 1em;
}

.pre-button, .next-button {
margin-top: 0.5em;
    font-size: 3em;

    -webkit-transition: -webkit-transform 0.5s;
    transition: transform 0.5s;
    cursor: pointer;
  
    line-height: 0em;
    color: #fdfdfd;
    border-radius: 50%;
}

/*.pre-button:hover, .next-button:hover {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
}

.pre-button:active,.next-button:active{
    -webkit-transform: scale(0.7);
    -ms-transform: scale(0.7);
    transform: scale(0.7);
}*/

.pre-button {
    background-color: #8a939f;
    height: 30px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    width: 30px;
    float: left;
    margin-left: 0.5em;
}

.next-button {
    background-color: #2A85FF;
    height: 30px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    width: 30px;
    margin-right: 0.5em;
    float: right;
  
}

.head-info {
    float: left;
    width: 18em;
}

.head-day {
    margin-top: 30px;
    font-size: 8em;
    line-height: 1;
    color: #2A85FF;
}

.head-month {
    font-weight:600;
      margin-left: 8px;
    font-size: 26px;
    margin-top:-8px;
    line-height: 1;
    color: #2A85FF;
}

#calendar {
    width: 90%;
    margin: 0 auto;
}

#calendar tr {
    height: 2em;
    line-height: 2em;
}

thead tr {
    color: #2A85FF;
	font-weight: 700;
	text-transform: uppercase;
}

tbody tr {
    color: #252a25;
}

tbody td{
    width:50px;
    height:50px;
    border-radius: 50%;
    cursor: pointer;
    -webkit-transition:all 0.2s ease-in;
    transition:all 0.2s ease-in;
}

tbody td:hover {
    color: black;
    background-color: #2A85FF;
    border: none;
}
.selected {
    color: white;
    background-color: #2A85FF;
    border: none;
}

tbody td:active {
    -webkit-transform: scale(0.7);
    -ms-transform: scale(0.7);
    transform: scale(0.7);
}

#today {
    border: 2px solid #2A85FF;
    background-color: #FFFFFF;
    color:black;
     width:50px;
    height:50px;
    border-radius:50%;
}

#disabled {
    cursor: default;
    background: #fff;
}

#disabled:hover {
    background: #fff;
    color: #c9c9c9;
}
.wysihtml5-sandbox
{
    border-radius:10px !important;
}
.select2-search__field
{
    width: 100% !important;
}


</style>
     <section>
      <div class="callout callout-info" id="meetinglistdiv">

        <h4>Meeting Notes</h4>
              <span style="margin-top: -30px;float:right"><button type="button" class="btn btn-primary pull-right" id="Addmeetingbtn"> <i class="fa fa-fw fa-plus"></i> Add New Note</button></span>
        <p style="font-size: 14px;color: #5697fd;">Create and manage notes to streamline workflow</p>
      </div>

           <div class="callout callout-info" id="addmeetingdiv" style="display:none">
               
        <h4><a id="showmeetingadddiv" style="color:#000; cursor:pointer" onclick="opendiv();"><i class="fa fa-fw fa-arrow-left"></i></a> Add New Note</h4>
              <span style="margin-top: -30px;float:right">
                    <button type="button" class="btn btn-success pull-right" style="float:right ; margin-top:15PX;margin-left: 15px;" id="savemeetingbtn"><i class="fa fa-fw fa-check"></i> Save</button>

                   <button type="button" class="btn btn-warning pull-right" style="float:right ; margin-top:15PX; margin-left:15px;" id="cancelbtn"><i class="fa fa-fw fa-trash"></i> Delete</button>

              </span>
        <p style="font-size: 14px;color: #2A85FF;">Create and manage notes to streamline workflow</p>
      </div>
         </section>
  
    <section class="content" id="meetinglistsec">
     <div class="row">
        <div class="col-md-4">
          <!-- DIRECT CHAT PRIMARY -->
          <div class="box box-primary direct-chat direct-chat-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Meeting notes for january 2022</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- Conversations are loaded here -->
              <div class="direct-chat-messages">
                <!-- Message. Default to the left -->
                <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix">
                 
               
                  </div>
                  <!-- /.direct-chat-info -->
                  <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                      <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                  <!-- /.direct-chat-text -->
                </div>
                   <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix" style="padding-top:15px;padding-bottom:15px;font-size:16px;">
                    <span class="direct-chat-name pull-left">METRICS</span><br />
                    <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span>&nbsp;&nbsp;
                       <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.2</span>&nbsp;&nbsp;
                       <span class="btn btn-info pull-left" style="border-radius:10px;">1.2.3</span><br />
                     
                   
                  </div>
                    <p> <span class="direct-chat-timestamp pull-left"><i class="fa fa-clock-o"></i> 23 Jan 2022 2:05 pm</span></p>
                  <!-- /.direct-chat-info -->
                
                  <!-- /.direct-chat-text -->
                </div>
                <!-- /.direct-chat-msg -->

                <!-- Message to the right -->
              <a  style="float:right;color: #2A85FF;" class="btn">Details <i class="fa fa-fw fa-arrow-right"></i></a>
                <!-- /.direct-chat-msg -->
              </div>
              <!--/.direct-chat-messages-->
            </div>
            <!-- /.box-body -->
        
            <!-- /.box-footer-->
          </div>
          <!--/.direct-chat -->
        </div>

          <div class="col-md-4">
          <!-- DIRECT CHAT PRIMARY -->
          <div class="box box-primary direct-chat direct-chat-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Monthly Meeting</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- Conversations are loaded here -->
              <div class="direct-chat-messages">
                <!-- Message. Default to the left -->
                <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix">
                 
               
                  </div>
                  <!-- /.direct-chat-info -->
                  <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                      <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                  <!-- /.direct-chat-text -->
                </div>
                   <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix" style="padding-top:15px;padding-bottom:15px;font-size:16px;">
                    <span class="direct-chat-name pull-left">METRICS</span><br />
                    <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span>&nbsp;&nbsp;
                       <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.2</span>&nbsp;&nbsp;
                       <span class="btn btn-info pull-left" style="border-radius:10px;">1.2.3</span><br />
                     
                   
                  </div>
                    <p> <span class="direct-chat-timestamp pull-left"><i class="fa fa-clock-o"></i> 23 Jan 2022 2:05 pm</span></p>
                  <!-- /.direct-chat-info -->
                
                  <!-- /.direct-chat-text -->
                </div>
                     <a  style="float:right;color: #2A85FF;" class="btn">Details <i class="fa fa-fw fa-arrow-right"></i></a>
                <!-- /.direct-chat-msg -->

                <!-- Message to the right -->
              
                <!-- /.direct-chat-msg -->
              </div>
              <!--/.direct-chat-messages-->
            </div>
            <!-- /.box-body -->
       
            <!-- /.box-footer-->
          </div>
          <!--/.direct-chat -->
        </div>

            <div class="col-md-4">
          <!-- DIRECT CHAT PRIMARY -->
          <div class="box box-primary direct-chat direct-chat-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Testing Meeting</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- Conversations are loaded here -->
              <div class="direct-chat-messages">
                <!-- Message. Default to the left -->
                <div class="direct-chat-msg">
                
                  <!-- /.direct-chat-info -->
                  <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                      <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                  <!-- /.direct-chat-text -->
                </div>
                   <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix" style="padding-top:15px;padding-bottom:15px;font-size:16px;">
                    <span class="direct-chat-name pull-left">METRICS</span><br />
                    <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span>&nbsp;&nbsp;
                       <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.2</span>&nbsp;&nbsp;
                       <span class="btn btn-info pull-left" style="border-radius:10px;">1.2.3</span><br />
                     
                   
                  </div>
                    <p> <span class="direct-chat-timestamp pull-left"><i class="fa fa-clock-o"></i> 23 Jan 2022 2:05 pm</span></p>
                  <!-- /.direct-chat-info -->
                
                  <!-- /.direct-chat-text -->
                </div>
                     <a  style="float:right;color: #2A85FF;" class="btn">Details <i class="fa fa-fw fa-arrow-right"></i></a>
                <!-- /.direct-chat-msg -->

                <!-- Message to the right -->
              
                <!-- /.direct-chat-msg -->
              </div>
              <!--/.direct-chat-messages-->
            </div>
            <!-- /.box-body -->
    
            <!-- /.box-footer-->
          </div>
          <!--/.direct-chat -->
        </div>
        <!-- /.col -->
</div>
        </section>

     <section class="content" id="meetingaddsec" style="display:none">
          <div class="row">
         <div class="col-md-8">
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
            
        <!-- /.box-header -->
        <div class="box-body">
       
            
            <div class="col-md-6">
              <div class="form-group">
                <label>Attendees</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i><br />
                <button type="button" data-toggle="modal" data-target="#staffpopup" class="btn btn-flat" style="box-shadow: 0 1px 1px rgb(0 0 0 / 8%);background-color: #fff;border-radius: 20px;">
                  <i class="fa fa-plus"></i>
                </button>
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group">
                <label>Metrics discussed</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i><br />
                     <button type="button" data-toggle="modal" data-target="#metricspopup" class="btn btn-flat" style="box-shadow: 0 1px 1px rgb(0 0 0 / 8%);background-color: #fff;border-radius: 20px;">
                  <i class="fa fa-plus"></i>
                </button>
           
              </div>
              <!-- /.form-group -->
        
              <!-- /.form-group -->
            </div>

                  <div class="col-md-12">
                       <div class="form-group">
                <label>Title</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                  <input type="text" class="form-control" id="title" placeholder="Enter metrics title..!" />
                </div>
             
                  </div>
                   <div class="col-md-12">
            <div class="form-group">
            <label>Description</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
            <!-- /.box-header -->
          
                <textarea class="textarea" placeholder="Place some text here"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
      
         
          </div>
                       </div>
            
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
             </div>
                <div class="col-md-4">
                      <div class="box box-default">
            
        <!-- /.box-header -->
        <div class="box-body">
              <label style="padding-left: 15px;">Meeting Date</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                   <div class="elegant-calencar">
            
        <div id="header" class="clearfix">
           <div class="pre-button"><p style="margin-top: -2px;margin-left: -2px;"><i class="fa fa-angle-left" style="margin-top:-5px;"></i></p></div>
            <div class="head-info">
                <div class="head-day"></div>
                <div class="head-month"></div>
            </div>
            <div class="next-button"><p style="margin-top: -2px;margin-right: -2px;"><i class="fa fa-angle-right" style="margin-top:-5px;"></i></p></div>
        </div>
                       <hr/>
        <table id="calendar">
            <thead>
                <tr>
                    <th>Su</th>
                    <th>Mo</th>
                    <th>Tu</th>
                    <th>We</th>
                    <th>Th</th>
                    <th>Fr</th>
                    <th>Sa</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

             </div>
                          </div></div>
        <!-- /.box-body -->
     
      </div>
         </section>

<!-- Modal -->
<div class="modal fade" id="staffpopup" tabindex="-1" role="dialog" aria-labelledby="staffpopupTitle" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width: 350px;margin: 200px auto;">
    <div class="modal-content" style="border-radius: 15px;">
      <div class="modal-header">
        <h5 class="modal-title" id="staffpopupTitle">  <label>Add Attendees</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></h5>
    
              <div class="form-group">
                  <select class="form-control select2" multiple="multiple" style="width: 100%;" data-placeholder="Select Staff">
                  <option>Hemant</option>
                  <option>Rahul</option>
                  <option>Sumit</option>
                  <option>Kiran</option>
                </select>
              </div>
            <div class="form-group">
                <label>Currently Added</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                     <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                  <!-- /.direct-chat-info -->
                  <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" /> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;">Hemant Singh</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i><br />

                         <!-- /.direct-chat-text -->
                </div>
                  <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                                           <img class="direct-chat-img" src="../Img/user2-160x160.jpg" alt="Message User Image" /> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;">Aman Prakash</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i><br />

                         </div>
                 <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                  <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" /> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;">Anju</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i>

                         </div>
                </div>
              <!-- /.form-group -->
            </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
    <style>
.dropdown-submenu {
  position: relative;
}

.dropdown-submenu .dropdown-menu {
  top: 0;
  left: 100%;
  margin-top: -5px;
}
</style>
    <div class="modal fade" id="metricspopup" tabindex="-1" role="dialog" aria-labelledby="metricspopupTitle" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width: 550px;margin: 200px auto;">
    <div class="modal-content" style="border-radius: 15px;">
      <div class="modal-header">
        <h5 class="modal-title" id="metricspopupTitle">  <label>Add Metrics</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></h5>
    
              <div class="form-group">
                  <div class="dropdown">
    <button class="form-control dropdown-toggle" type="button" data-toggle="dropdown" style="text-align:left">Select Criteria
    <span class="caret" style="float: right;margin-top: 5px;"></span></button>
    <ul class="dropdown-menu">
           <li class="dropdown-submenu">
        <a class="test" tabindex="-1" href="#">Criteria 1<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li class="dropdown-submenu">
            <a class="test" href="#">Criteria 1.1<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#"><input type="checkbox" /> Criteria 1.1.1</a></li>
              <li><a href="#"><input type="checkbox" /> Criteria 1.1.2</a></li>
            </ul>
          </li>
              <li class="dropdown-submenu">
            <a class="test" href="#">Criteria 1.2<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#"><input type="checkbox" /> Criteria 1.2.1</a></li>
              <li><a href="#"><input type="checkbox" /> Criteria 1.2.2</a></li>
            </ul>
          </li>
        </ul>
      </li>
      <li><a tabindex="-1" href="#">Criteria 2</a></li>
      <li><a tabindex="-1" href="#">Criteria 3</a></li>
      <li><a tabindex="-1" href="#">Criteria 4</a></li>
      <li><a tabindex="-1" href="#">Criteria 5</a></li>
      <li><a tabindex="-1" href="#">Criteria 6</a></li>
      <li><a tabindex="-1" href="#">Criteria 7</a></li>
   
    </ul>
  </div>
              
            
              </div>
            <div class="form-group">
                <label>Currently Added</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                     <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                  <!-- /.direct-chat-info -->
                   <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;    font-size: 13px;">Lorem Ipsum is simply dummy text</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i><br />

                         <!-- /.direct-chat-text -->
                </div>
                  <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                                           <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;    font-size: 13px;">Lorem Ipsum is simply dummy text</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i><br />

                         </div>
                 <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                   <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;    font-size: 13px;">Lorem Ipsum is simply dummy text</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i>

                         </div>
                </div>
              <!-- /.form-group -->
            </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
    
<script>
    $(document).ready(function () {
        $('.dropdown-submenu a.test').on("click", function (e) {
            $(this).next('ul').toggle();
            e.stopPropagation();
            e.preventDefault();
        });
    });
</script>
</asp:Content>

