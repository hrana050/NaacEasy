<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage/Naacmaster.master" AutoEventWireup="true" CodeFile="naaceasy.aspx.cs" Inherits="Home_naaceasy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
   
    <link href="../NaacCustomFiles/css/font-awesome.min.css" rel="stylesheet" />


    <script type="text/javascript">
        $(document).ready(function () {
            meetinglist();
          <%--  var binduserlistrows = '';
            $('#<%=txt_person.ClientID %>').change(function () {
                $('#bindstaff li').remove();
                var selectedValues = $('#<%=txt_person.ClientID %> option:selected').text();
                binduserlistrows += "<div class='direct-chat-msg' style='margin-top: 5px;margin-bottom: 5px;'>";
                binduserlistrows += "<img class='direct-chat-img' src='../Img/user1-128x128.jpg' alt='Message User Image' />";
                binduserlistrows += "<span class='direct-chat-name pull-left' style='padding-left: 15px;margin-top: 10px;'>" + selectedValues + "</span> <i class='fa fa-fw fa-trash' style='color: #F24E1E;float: right;padding-top: 10px;'></i><br /></div>";
                $('#bindstaff').append(binduserlistrows);
            });
          --%>

            getcriteriaparentlist();
            $("#Addmeetingbtn").click(function () {

                $("#meetingaddsec").show();
                $("#addmeetingdiv").show();
                $("#meetinglistdiv").hide();
                $("#meetinglistsec").hide();
            });
        });
        function opendiv() {
            $("#meetingaddsec").hide();
            $("#addmeetingdiv").hide();
            $("#meetinglistdiv").show();
            $("#meetinglistsec").show();
        }
        function getcriteriaparentlist() {

            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/criteriaparentlist",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                 
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    $.each(customers, function () {
                        var criterianame = $(this).find("Menuname").text();
                        var criteriaid = $(this).find("Menuid").text();
                        rows += "<li class='nav-item'><a class='nav-link text-truncate'  id="+ 'criteria_'+criteriaid + " onClick='criteria_select(" + criteriaid + ")' style='cursor: pointer;'><p1>" + criterianame + "</p1><img class='list_item_img' src='../img/chevron.right.svg' alt=''></a></li>";
                    });
                   
                    $('#parentcriterialist').append(rows);
                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });

        }
        function getcriteriakeylist(parentid) {
            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/criteriakeylist",
                data: '{id:"' + parentid + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                  
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    $.each(customers, function () {
                        var keyname = $(this).find("Menuname").text();
                        var keyid = $(this).find("Menuid").text();
                        rows += "<li class='nav-item'><a class='nav-link text-truncate'  id=" + 'criteria_' + keyid + " onClick='ki_select(" + keyid + ")' style='cursor: pointer;'><p1>" + keyname + "</p1><img class='list_item_img' src='../img/chevron.right.svg' alt=''></a></li>";
                    });
                    $('#crit_deselected').append(rows);
                  
                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });

        }
        function getcriteriametricslist(criterakeyid) {
            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/criteriametricslist",
                data: '{id:"' + criterakeyid + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
               
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    $.each(customers, function () {
                        var metricname = $(this).find("Menuname").text();
                        var metricid = $(this).find("Menuid").text();
                        checkbox = "<label style='font-weight:400;'><input class='checkbox' name='locationthemes' type='checkbox' value=" + metricid + ">";
                        rows += "<li class='nav-item'><a class='nav-link text-truncate'  id=" + 'criteria_' + metricid + " onClick='metric_select(" + metricid + ")' style='cursor: pointer;'><p1>" + checkbox + metricname + "</label></p1></a></li>";
                    });
                    $('#ki_deselected').append(rows);
                  
                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });

        }
        function addmeeting() {
     
            var todaydate = $("#today").text();
            var selecteddate = $(".selected").text();
            var meetingdate = "";
            var meetingmonth = $(".head-month").text();
            if (selecteddate == todaydate)
            {
                meetingdate = todaydate;
            }
            else if (selecteddate != todaydate)
            {
                meetingdate = selecteddate;
            }
         
       var selecteduser = "";
       var hiddenvalue = $("#linksnohidden").val();
       $('#<%=txt_person.ClientID %> option:selected').each(function () {
            selecteduser += $(this).val() + ",";
        });
      var checkboxValues = "";
      $('input[name=locationthemes]:checked').map(function () {
       checkboxValues += $(this).val() + ",";
      });
       
    var id = $("#criteriaid").text();
    var vmmeetingobj = {};
    vmmeetingobj.meetingcriteria = checkboxValues;
    vmmeetingobj.meetingtopic = $("#txt_topic").val();
    vmmeetingobj.meetingdate = meetingdate
    vmmeetingobj.contactperson = selecteduser;
    vmmeetingobj.meetingsno = $("#meetingid").text();
    vmmeetingobj.remark = $('iframe').contents().find('.textarea').html();
   // vmmeetingobj.linksno = hiddenvalue;
    var jsonData = JSON.stringify({
        vmmeetingobj: vmmeetingobj
    });
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/addmeeting",
        data: jsonData,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        error: OnErrorCall
    });

    function OnSuccess(response) {
        var result = response.d;
        if (result == "success") {
            dototask(id);
            getmeeting(id);
            getcompetionssr(id);
            getfaq(id);
            dotocomtask(id);
            $("#txt_topic").val("");
            $("#txt_person").val("");
            $('#<%=txt_person.ClientID %>').val("0");
            if (hiddenvalue != "0" && hiddenvalue != "") {
                $('#meetingsuccess').show();
            }
            meetinglist();
            alert("Meeting Create Successfully..!");
        }

    }
    function OnErrorCall(response) {
    }
  }
        function meetinglist() {

            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/getmeetingtask",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    $.each(customers, function (i, item) {
                        var meetingname = $(this).find("meetingname").text();
                        var username = $(this).find("name").text();
                        var userlist = username.split(',');
                        var j = userlist.length;
                        var i = 0;
                        var Menuname = $(this).find("Menuname").text();
                        var criterialist = Menuname.split(',');
                        var k = criterialist.length;
                        var l = 0;
                        var meetingid = $(this).find("meetingid").text();
                        rows += "<div class='col-md-4'><div class='box box-primary direct-chat direct-chat-primary'><div class='box-header with-border'>";
                        rows += "<h3 class='box-title'>" + meetingname + "</h3></div>";
                        rows+="<div class='box-body'><div class='direct-chat-messages'><div class='direct-chat-msg'>";
                        rows += "<div class='direct-chat-info clearfix'></div>";
                        for (i = 0; i < j; i++) {
                            rows += "<img class='direct-chat-img' src='../Img/user1-128x128.jpg' alt=" + userlist[i] + " title=" + userlist[i] + " />";
                        }
                        rows+= "</div>";
                        rows+= "<div class='direct-chat-msg'>";
                        rows+="<div class='direct-chat-info clearfix' style='padding-top:15px;padding-bottom:15px;font-size:16px;'>";
                        rows += "<span class='direct-chat-name pull-left'>METRICS</span><br />";
                        for (l = 0; l < k; l++) {
                            rows += "<span class='btn btn-info pull-left' style='border-radius:10px;margin-right: 5px;'>" + criterialist[l]+ "</span>&nbsp;&nbsp;";
                        }
                         rows+=  "<br />";
                        rows+= "</div><p> <span class='direct-chat-timestamp pull-left'><i class='fa fa-clock-o'></i> 23 Jan 2022 2:05 pm</span></p></div>";
                        rows+="<a  style='float:right;color: #2A85FF;' class='btn'>Details <i class='fa fa-fw fa-arrow-right'></i></a></div></div> </div> </div>";
                    });
                   
                    $('#meetingnotelist').append(rows);
                    

                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });

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
     <section id="Dashboardtab">
     <h2 style="font-size: 55px;padding-top: 150px;text-align: center;">Dashboard Panel</h2>
     </section>
     <section id="meetingtoptitlediv" style="display:none">
      <div class="callout callout-info" id="meetinglistdiv">

        <h4>Meeting Notes</h4>
              <span style="margin-top: -30px;float:right;padding-right: 30px;"><button type="button" class="btn btn-primary pull-right" id="Addmeetingbtn"> <i class="fa fa-fw fa-plus"></i> Add New Note</button></span>
        <p style="font-size: 14px;color: #5697fd;">Create and manage notes to streamline workflow</p>
      </div>

           <div class="callout callout-info" id="addmeetingdiv" style="display:none">
               
        <h4>
            <a id="showmeetingadddiv" style="color:#000; cursor:pointer" onclick="opendiv();"><i class="fa fa-fw fa-arrow-left"></i></a> Add New Note</h4>
              <span style="margin-top: -40px;float:right;padding-right: 30px;">
                    <button type="button" class="btn btn-success pull-right" style="float:right ; margin-top:15PX;margin-left: 15px;" id="savemeetingbtn" onClick="addmeeting()"><i class="fa fa-fw fa-check"></i> Save</button>

                   <button type="button" class="btn btn-warning pull-right" style="float:right ; margin-top:15PX; margin-left:15px;" id="cancelbtn"><i class="fa fa-fw fa-trash"></i> Delete</button>

              </span>
        <p style="font-size: 14px;color: #2A85FF;">Create and manage notes to streamline workflow</p>
      </div>
         </section>

       <section id="todotasktoptitlediv" style="display:none">
      <div class="callout callout-info" id="todotasklistdiv">

        <h4>To-Do List</h4>
              <span style="margin-top: -30px;float:right;padding-right:30px;"><button type="button" class="btn btn-primary pull-right" id="Addtodobtn"> <i class="fa fa-fw fa-plus"></i> Add New task</button></span>
        <p style="font-size: 14px;color: #5697fd;">Browse all task assigned to each staff member</p>
      </div>

           <div class="callout callout-info" id="addtododiv" style="display:none">
               
        <h4>
            <a id="showtodoadddiv" style="color:#000; cursor:pointer" onclick="opendiv();"><i class="fa fa-fw fa-arrow-left"></i></a> Add New task</h4>
              <span style="margin-top: -30px;float:right">
                    <button type="button" class="btn btn-success pull-right" style="float:right ; margin-top:15PX;margin-left: 15px;" id="savetodobtn"><i class="fa fa-fw fa-check"></i> Save</button>

                   <button type="button" class="btn btn-warning pull-right" style="float:right ; margin-top:15PX; margin-left:15px;" id="canceltodobtn"><i class="fa fa-fw fa-trash"></i> Delete</button>

              </span>
        <p style="font-size: 14px;color: #2A85FF;">Assign task and get work done faster</p>
      </div>
         </section>
   <section class="content" id="todolistsec" style="display:none">
     <div class="row">
        <div class="col-md-4">
            <h3 style="font-weight: 600;">Today</h3>
          <!-- DIRECT CHAT PRIMARY -->
          <div class="box box-primary direct-chat direct-chat-primary">
            <!-- /.box-header -->
            <div class="box-body">
              <!-- Conversations are loaded here -->
              <div class="direct-chat-messages">
                <!-- Message. Default to the left -->
                <div class="direct-chat-msg">
               
                  <!-- /.direct-chat-info -->
                <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span>&nbsp;&nbsp;
                <p style="font-size: 20px;margin-top: -15px;font-weight: 700;">Hemant Rana</p>
                </div>
                   <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix" style="font-size:16px;padding-top: 15px;">
                    <span class="direct-chat-name pull-left">Upload Naac easy file on server.</span><br />
                  </div>
                   
                  <!-- /.direct-chat-info -->
                
                  <!-- /.direct-chat-text -->
                </div>
                <!-- /.direct-chat-msg -->

                <!-- Message to the right -->
              <a  style="float:left;color: #2A85FF;padding-top: 80px;">All Task <i class="fa fa-fw fa-arrow-right"></i></a>
                <!-- /.direct-chat-msg -->
              </div>
              <!--/.direct-chat-messages-->
            </div>
            <!-- /.box-body -->
        
            <!-- /.box-footer-->
          </div>
          <!--/.direct-chat -->
        </div>

          <div class="col-md-8">
               <h3 style="font-weight: 600;">Summary</h3>
          <!-- DIRECT CHAT PRIMARY -->
          <div class="box box-primary direct-chat direct-chat-primary" style="padding-bottom: 25px;">
           
            <!-- /.box-header -->
            <div class="box-body">
                    <div class="col-md-8">
                              <div class="box-header with-border">
              <h3 class="box-title">Insights</h3>
            </div>
              <div class="direct-chat-msg col-md-5"  style="border-radius: 10px;border: 1px solid #0000004d;font-size: 18px;">
               <div style="font-size: 20px;padding-top: 15px;font-weight: 700;">
                  <!-- /.direct-chat-info -->
          <i class="fa fa-fw fa-check" style="border-radius: 50%;
    width: auto;
    font-size: 25px;
    border: 1px solid #0000004d;"></i> Completed <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                   </div>
                  <div style="padding-top: 30px;padding-bottom: 15px;font-size: 38px;font-weight: 700;">1</div>
                  <!-- /.direct-chat-text -->
                </div>
                <div class="direct-chat-msg col-md-5"  style="border-radius: 10px;border: 1px solid #0000004d;font-size: 18px;margin-left:15px;">
               <div style="font-size: 20px;padding-top: 15px;font-weight: 700;">
                  <!-- /.direct-chat-info -->
           <i class="fa fa-clock-o" style="border-radius: 50%;
    width: auto;
    font-size: 25px;
    border: 1px solid #0000004d;"></i> Assigned <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                   </div>
                  <div style="padding-top: 30px;padding-bottom: 15px;font-size: 38px;font-weight: 700;">4</div>
                  <!-- /.direct-chat-text -->
                </div>
           
                        </div>
                 <div class="col-md-1" style="padding-right: 0px; padding-bottom: 185px;border-left: 1px solid #b2b2b2;margin-top: 30px;padding-left: 0px;width: 0px;"></div>
                  <div class="col-md-3">
                  
                              <div class="box-header with-border">
              <h3 class="box-title">Your team</h3>
            </div>
          
              <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                      <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" />
                     <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" />
                  <!-- /.direct-chat-text -->
                   
             
                  <div class="direct-chat-msg col-md-12"  style="border-radius: 10px;border: 1px solid #0000004d;font-size: 16px;">
                      <p style="padding-top: 15px;color: #2a85ff;    margin: 0px;">Avg. completion time</p>
                      <p style="padding-bottom: 15px;font-weight:700;    margin: 0px;">1d 7h 32m</p>
                      </div>
            </div>
            <!-- /.box-body -->
       
            <!-- /.box-footer-->
          </div>
          <!--/.direct-chat -->
        </div>

     
        <!-- /.col -->
</div>
         </div>
       <div class="row">
               <div class="col-md-12" style="border-radius: 15px;">
            <h3 style="font-weight: 600;">Active tasks</h3>
                    <div class="box-footer clearfix box-body" style="border-radius: 15px;">
                        <div class="col-md-1" style="padding-top:5px">
                             <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span>
            </div>
                           <div class="col-md-3"  style="padding-top:5px">
                             <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" style="margin-right: 10px;" /> 
                                  <p style="font-size: 20px;margin-top: 5px;font-weight: 700;">Hemant Rana</p>
            </div>
                           <div class="col-md-2"  style="padding-top:5px">
                          <p style="font-weight: 500;color: #6c6b6b;margin: 0px;">Task Name</p>
                                  <p style="font-size: 16px;font-weight: 600;">Add New Excel..</p>
            </div>
                        <div class="col-md-2"  style="padding-top:5px">
                          <p style="font-weight: 500;color: #6c6b6b;margin: 0px;">Assigned On</p>
                                  <p style="font-size: 16px;font-weight: 600;"><i class="fa fa-clock-o"></i> 25 Jan 2022</p>
            </div>
                         <div class="col-md-2"  style="padding-top:5px">
                          <p style="font-weight: 500;color: #6c6b6b;margin: 0px;">Due by</p>
                                  <p style="font-size: 16px;font-weight: 600;"><i class="fa fa-clock-o"></i> 20 Feb 2022</p>
            </div>
                            <div class="col-md-2"  style="padding-top:15px">
                              
              <span class="btn btn-info pull-right"> <a href="#" style="color: white;"> Details</a></span>
            </div>
            <!-- /.box-body -->
          
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
             <div class="col-md-12" style="border-radius: 15px;margin-top: 15px;">
                    <div class="box-footer clearfix box-body" style="border-radius: 15px;">
                        <div class="col-md-1" style="padding-top:5px">
                             <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.2</span>
            </div>
                           <div class="col-md-3"  style="padding-top:5px">
                             <img class="direct-chat-img" src="../Img/user3-128x128.jpg" alt="Message User Image" style="margin-right: 10px;" /> 
                                  <p style="font-size: 20px;margin-top: 5px;font-weight: 700;">Deepak Kumar</p>
            </div>
                           <div class="col-md-2"  style="padding-top:5px">
                          <p style="font-weight: 500;color: #6c6b6b;margin: 0px;">Task Name</p>
                                  <p style="font-size: 16px;font-weight: 600;">Upload naac manual..</p>
            </div>
                        <div class="col-md-2"  style="padding-top:5px">
                          <p style="font-weight: 500;color: #6c6b6b;margin: 0px;">Assigned On</p>
                                  <p style="font-size: 16px;font-weight: 600;"><i class="fa fa-clock-o"></i> 15 Jan 2022</p>
            </div>
                         <div class="col-md-2"  style="padding-top:5px">
                          <p style="font-weight: 500;color: #6c6b6b;margin: 0px;">Due by</p>
                                  <p style="font-size: 16px;font-weight: 600;"><i class="fa fa-clock-o"></i> 20 Jan 2022</p>
            </div>
                            <div class="col-md-2"  style="padding-top:15px">
                              
              <span class="btn btn-info pull-right"> <a href="#" style="color: white;"> Details</a></span>
            </div>
            <!-- /.box-body -->
          
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
         </div>
        </section>
    <section class="content" id="meetinglistsec" style="display:none">
     <div class="row" id="meetingnotelist">
     
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
                  <input type="text" class="form-control" id="txt_topic" placeholder="Enter metrics title..!" />
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
                      <asp:DropDownList ID="txt_person" runat="server" class="form-control select2" multiple="multiple" style="width: 100%;" data-placeholder="Select Staff"></asp:DropDownList>&nbsp;
                 
              </div>
            <div class="form-group">
                <label>Currently Added</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                <div id="bindstaff">
                   <%--  <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                  <!-- /.direct-chat-info -->
                  <img class="direct-chat-img" src="../Img/user1-128x128.jpg" alt="Message User Image" /> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;">Hemant Singh</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i><br />

                         <!-- /.direct-chat-text -->
                </div>--%>
                    </div>
                </div>
              <!-- /.form-group -->
            </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
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
    <style>
.checkbox, .radio {
    position: relative;
    display: inherit;
    margin-top: 10px;
    margin-bottom: 10px;
}

/* width */
::-webkit-scrollbar {
  width: 4px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #F2F2F2;
  border-radius:2px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #BABABA;
  border-radius:2px;
  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.12);
}

.metricdropdiv{
  display:flex;
  flex-direction:column;
  width:507px;
  height:292px;
  background-color:#FFFFFF;
  border: 2px #DBDBDB solid;
  padding-bottom:0px;
  border-radius:16px;
  box-shadow: 0px 3px 36px rgba(0, 0, 0, 0.12);
  box-sizing: border-box;
  overflow:hidden;
  transition: 300ms all ease-in-out;
}

.title_img{
  transform: rotate(-180deg);
  transition: 300ms ease-in-out;
}

.title_icon{
  font-weight:500;
  font-size:20px;
  line-height:28px;
  color:#8A939F;

  cursor:pointer;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}
p1{
    font-size: 16px;
}

hr{
  border: 1px solid #DBDBDB;
  width:100%;
  margin-bottom:16px;
}

.dropdown_selection_table{
  display:flex;
  flex-direction:row;
  overflow:hidden;
  width:100%;
}

.criteria_selection{
  display:flex;
  flex-direction:column;
  height:100%;
  width:33.33%;
  margin-left:8px;
  overflow-y:auto;
}
#parentcriterialist.nav > li > a {
    position: relative;
    display: inherit;
    padding: 10px 15px;
}
 .nav > li {
    position: relative;
     display: inherit;
}

.dropdown_item{
  display:flex;
  flex-direction:row;
  justify-content: space-between;
  align-items: center;
  box-sizing: border-box;
  padding:8px 12px;
  margin-bottom:8px;
  color: #1A1A1A;
  font-size:16px;
  line-height:28px;
  font-weight:400;
  border-radius: 8px;
  cursor:pointer;
}

.criteria_selection:last-child{
  margin-bottom:0;
}


.item_deselected>.list_item_img{
  opacity:0;
}

.item_selected>.list_item_img{
  opacity:100%;
  filter: invert(47%) sepia(31%) saturate(7499%) hue-rotate(201deg) brightness(102%) contrast(102%);
}

.item_selected{
  background: #EAF3FF;
  box-shadow: inset 0px -3px 9px rgba(4, 13, 25, 0.06);
  font-weight:500;
  color:#2A85FF;
  border-radius:10px;
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
                <div class="metricdropdiv">
    <div class="title_icon" onClick="show_hide()">
      <p1 style="padding-top: 10px;
    padding-left: 10px;">Select metrics</p1>
      <img class="title_img" src="../Img/chevron.down.svg" alt="" style="padding-top: 10px;
    padding-left: 10px;">
    </div>
    <hr class="dropdown_hr">
    <div class="dropdown_selection_table">
          <input type="hidden" id="hidecriteria" name="hidecriteria" />
             <input type="hidden" id="hidekey" name="hidekey" />
      <ul class="nav flex-column flex-nowrap criteria_selection" id="parentcriterialist"> 
                
      </ul>
      <ul class="nav flex-column flex-nowrap criteria_selection" id="crit_deselected">
        
      </ul>
      <ul class="nav flex-column flex-nowrap criteria_selection metric_list" id="ki_deselected">
      
      </ul>
    </div>
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
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
      </div>
    </div>
  </div>
</div>
    
    <script type="text/javascript">

        var hr = document.getElementsByClassName("dropdown_hr")[0];
        var table = document.getElementsByClassName("dropdown_selection_table")[0];
        var dropdown = document.getElementsByClassName("metricdropdiv")[0];
        var title = document.getElementsByClassName("title_icon")[0];
        var title_img = document.getElementsByClassName("title_img")[0];
       // var criteria_btn = document.getElementsByClassName("crit_btn")[0]
        var ki_list = document.getElementsByClassName("ki_list")[0];
        var ki_btn = document.getElementsByClassName("ki_btn")[0];
        var metric_list = document.getElementsByClassName("metric_list")[0];
        var metric_btn = document.getElementsByClassName("metric_btn")[0];
        function show_hide() {
            if (dropdown.style.height != "auto") {
                hr.style.border = "none";
                title_img.style.transform = "rotate(0deg)";
                hr.style.marginBottom = "0";
                table.style.display = "none";
                dropdown.style.height = "auto";
                title.style.paddingBottom = "0";
                dropdown.style.boxShadow = "none";
            }

            else if (dropdown.style.height == "auto") {
                hr.style.border = "1px solid #DBDBDB";
                hr.style.marginBottom = "16px";
                title_img.style.transform = "rotate(-180deg)";
                table.style.display = "flex";
                dropdown.style.height = "292px";
                title.style.paddingBottom = "0px";
                dropdown.style.boxShadow = "0px 3px 36px rgba(0, 0, 0, 0.12)";
            }
        }

        function criteria_select(parentid) {
            $("#hidecriteria").val(parentid);
            $('#crit_deselected li').remove();
            $('#ki_deselected li').remove();
            $("#criteria_" + parentid).addClass("item_selected");
            var lastdiv = localStorage.getItem("ocriteriapendiv");
            if (lastdiv == null) {
               
            }
            else {

                $("#criteria_" + lastdiv).removeClass("item_selected");
                localStorage.clear();
            }
            localStorage.setItem("ocriteriapendiv", $('#hidecriteria').val());
            getcriteriakeylist(parentid);
        }

        function ki_select(criterakeyid) {
            $("#hidekey").val(criterakeyid);
            $('#ki_deselected li').remove();
            $("#criteria_" + criterakeyid).addClass("item_selected");
            var lastdiv = localStorage.getItem("keypendiv");
            if (lastdiv == null) {

            }
            else {

                $("#criteria_" + lastdiv).removeClass("item_selected");
                localStorage.clear();
            }
            localStorage.setItem("keypendiv", $('#hidekey').val());
            getcriteriametricslist(criterakeyid);
           
        }

        function metric_select() {
           
        }

      </script>

</asp:Content>

