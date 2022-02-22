<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage/Naacmaster.master" AutoEventWireup="true" CodeFile="naaceasy.aspx.cs" Inherits="Home_naaceasy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
   
    <link href="../NaacCustomFiles/css/font-awesome.min.css" rel="stylesheet" />

    <script type="text/javascript">
        var checkboxValues = "";
        $('input[name=locationthemes]:checked').map(function () {
            checkboxValues = $(this).val();
            alert(checkboxValues);
        });

        $(document).ready(function () {
            show_hide();
            show_hide_attendies();
            meetinglist();
            getstafflist();
            getcriteriaparentlist();
            todotasklist();
            $("#Addmeetingbtn").click(function () {
                $("#todoaddsec").hide();
                $("#meetingaddsec").show();
                $("#addmeetingdiv").show();
                $("#meetinglistdiv").hide();
                $("#meetinglistsec").hide();
            });
            $("#Addtodobtn").click(function () {
                $("#todoaddsec").show();
                $("#addtododiv").show();
                //$("#addmeetingdiv").show();
                $("#todotasklistdiv").hide();
                $("#todolistsec").hide();
            });
        });
        function opendiv() {
            $("#meetingaddsec").hide();
            $("#addmeetingdiv").hide();
            $("#meetinglistdiv").show();
            $("#meetinglistsec").show();
            $("#todoaddsec").hide();
            $('#selectedstaff img').remove();
            $('#selectedmetric span').remove();
            $('#previousstaff img').remove();
            $('#previousmetric span').remove();
            $("#savemeetingbtn").addClass("btn-success");
            $("#savemeetingbtn").removeClass("btn-primary");
            $("#meetingtitle").text("Add New Note");
            $("#staffpopbtn").show();
            $("#metricpopbtn").show();
            $("#txt_topic").val("").attr("disabled",false);
            $("#meetingdetailsdate").text("Create and manage notes to streamline workflow");
            $('iframe').contents().find('.textarea').html("");
        } 
        function updatemeeting() {
            $("#staffpopbtn").show();
            $("#metricpopbtn").show()
            $("#txt_topic").attr("disabled", false);
            $("#editmeeting").hide();
            $("#savemeetingbtn").show();
            $("#savemeetingbtn").text("Update");
       <%--     var selectedValues = new Array();
            selectedValues[0] = "Rahul";
            selectedValues[1] = "Sumit";
            $("#<%=txt_person.ClientID %>").val(selectedValues);--%>
            <%-- $('#<%=txt_person.ClientID %>').val("2");
            $('.select2').val("2");--%>
          //  addmeeting();

            
        }
        function detailsmeetingdiv(meetingid) {
            $("#meetingid").val(meetingid);
            
            $("#meetingaddsec").show();
            $("#addmeetingdiv").show();
            $("#meetinglistdiv").hide();
            $("#meetinglistsec").hide();
            $("#meetingtitle").text("Meeting Note");
          //  $("#meetingdetailsdate").text("17 Feb 2022");
            $("#savemeetingbtn").hide();
            $("#editmeeting").show();
            
            $("#savemeetingbtn").removeClass("btn-success");
            $("#savemeetingbtn").addClass("btn-primary");
            $("#staffpopbtn").hide();
            $("#metricpopbtn").hide();
            
            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/getmeetingtask",
                data: '{id:"' + meetingid + '",type:"Edit" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    var metricrows = '';
                    $('#selectedstaff img').remove();
                    $('#selectedmetric span').remove();
                    $('#previousstaff img').remove();
                    $('#previousmetric span').remove();
                    $.each(customers, function () {
                        var meetingname = $(this).find("meetingname").text();
                        var contactperson = $(this).find("contactperson").text();
                        var Menuname = $(this).find("criteriaid").text();
                        var description = $(this).find("description").text();
                        var meetingid = $(this).find("meetingid").text();
                        var date = $(this).find("displaydate").text();
                        $("#txt_topic").val(meetingname).attr("disabled", "disabled");
                        $("#meetingdetailsdate").text(date);
                        $('iframe').contents().find('.textarea').html(description);
                        var getpreviousmetric = '"' + Menuname + '"';
                        $("#previousmetric").text(getpreviousmetric);
                        $("#previousstaff").text(contactperson);
                        var userlist = contactperson.split(',');
                        var j = userlist.length;
                        var i = 0;
                        var criterialist = Menuname.split(',');
                        var k = criterialist.length;
                        var l = 0;
                        for (i = 0; i < j; i++) {
                            rows += "<img class='direct-chat-img' src='../Img/user1-128x128.jpg' alt=" + userlist[i] + " title=" + userlist[i] + " style='cursor:pointer'/>";
                        }
                  
                        for (l = 0; l < k; l++) {
                            metricrows += "<span class='btn btn-info pull-left' style='border-radius:10px;margin-right: 5px;'>" + criterialist[l] + "</span>&nbsp;&nbsp;";
                        }
                   
                        
                    });
                    $('#selectedstaff').append(rows);
                    $('#selectedmetric').append(metricrows);
                  
                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });
        }
        function opentododiv() {
            $("#todolistsec").show();
            $("#todotasklistdiv").show();
            $("#addtododiv").hide();
            $("#todoaddsec").hide();
            
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
                    var sidebarmenu = '';
                    $.each(customers, function () {
                        var criterianame = $(this).find("Menuname").text();
                        var criteriaid = $(this).find("Menuid").text();
                        rows += "<li class='nav-item'><a class='nav-link text-truncate metric_a'  id=" + 'criteria_' + criteriaid + " onClick='criteria_select(" + criteriaid + ")' style='cursor: pointer;'><p class='metric_p'>" + criterianame + "</p><img class='list_item_img' src='../img/chevron.right.svg' alt=''></a></li>";
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
                        rows += "<li class='nav-item'><a class='nav-link text-truncate metric_a'  id=" + 'criteria_' + keyid + " onClick='ki_select(" + keyid + ")' style='cursor: pointer;'><p class='metric_p'>" + keyname + "</p><img class='list_item_img' src='../img/chevron.right.svg' alt=''></a></li>";
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
                        var getsubstring = metricname.substr(7, 5);
                        var metricid = $(this).find("Menuid").text();
                        checkbox = "<label style='font-weight:400;'><input class='checkbox' name='locationthemes' id='metricchk_" + metricid + "' type='checkbox' value='" + getsubstring + "' style='appearance: none;'>";
                        rows += "<li class='nav-item'><a class='nav-link text-truncate  metric_a'  id=" + 'criteria_' + metricid + " onClick='metric_select(" + metricid + ")' style='cursor: pointer;'><p class='metric_p'>" + checkbox + metricname + "</label></p></a></li>";
                    });
                    $('#ki_deselected').append(rows);
                  
                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });

        }

        function getstafflist(criterakeyid) {
            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/getstafflist",
                data: '{id:"' + criterakeyid + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    $.each(customers, function () {
                        var name = $(this).find("name").text();
                        var Loginid = $(this).find("Loginid").text();
                        checkbox = "<label style='font-weight:400;'>";
                        rows += "<li class='nav-item'><img src='../img/user1-128x128.jpg' class='attendeesimg'> <a class='nav-link text-truncate attendees_a'  id=" + 'staff' + Loginid + " style='cursor: pointer;'><p class='attendees_p'>" + checkbox + name + "</label></p><input class='checkbox' name='stafflocationthemes' id='staffchk_" + Loginid + "' type='checkbox' value='" + Loginid + "' style='appearance: none; margin: 0px 16px;'></a></li>";
                    });
                    $('#txt_person').append(rows);

                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });

        }

        function addmeeting(){
     
            var todaydate = $("#today").text();
            var selecteddate = $(".selected").text();
            var meetingdate = "";
            var meetingmonth = $(".head-month").text();
            if (selecteddate == todaydate)
            {
                meetingdate = todaydate + " - " + meetingmonth;
            }
            else if (selecteddate != todaydate)
            {
                meetingdate = selecteddate + " - " + meetingmonth;
            }
         
       var selecteduser = "";
       var hiddenvalue = $("#linksnohidden").val();
       $('#txt_person option:selected').each(function () {
            selecteduser += $(this).text() + ",";
        });
      var checkboxValues = "";
      //$('input[name=locationthemes]:checked').map(function () {
      // checkboxValues += $(this).val() + ",";
      //});
       
    var id = $("#criteriaid").text();
    var vmmeetingobj = {};
    vmmeetingobj.previousstaff = $("#previousstaff").text();
    vmmeetingobj.previousmetric = $("#selectedmetric").text().replace(' ', ',');;
    vmmeetingobj.meetingcriteria = checkboxValues;
    vmmeetingobj.meetingtopic = $("#txt_topic").val();
    vmmeetingobj.meetingdate = meetingdate
    vmmeetingobj.contactperson = selecteduser;
    vmmeetingobj.meetingsno = $("#meetingid").val();
    vmmeetingobj.remark = $('iframe').contents().find('.textarea').html();
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
            $('#txt_person').val("0");
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
            $('#meetingnotelist div').remove();
            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/getmeetingtask",
                data: '{id:"' + 0 + '",type:"meetingnoteslist" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    $.each(customers, function (i, item) {
                        var meetingname = $(this).find("meetingname").text();
                        var username = $(this).find("contactperson").text();
                        var meetingdate = $(this).find("meetingdate").text();
                        var meetingid = $(this).find("meetingid").text();
                        var userlist = username.split(',');
                        var j = userlist.length;
                        var i = 0;
                        var Menuname = $(this).find("criteriaid").text();
                        var criterialist = Menuname.split(',');
                        var k = criterialist.length;
                        var l = 0;
                        var meetingid = $(this).find("meetingid").text();
                        rows += "<div class='col-lg-4'><div class='box box-primary direct-chat direct-chat-primary boxpadding'><div class='box-header with-border'>";
                        rows += "<h3 class='meetingtitle'>" + meetingname + "</h3></div>";
                        rows+="<div class='box-body'><div class='direct-chat-messages' style='padding:0px !important;'><div class='direct-chat-msg'>";
                        rows += "<div class='direct-chat-info clearfix'></div>";
                        for (i = 0; i < j; i++) {
                            if (i > 0) {
                                rows += "<img class='direct-chat-img' src='../Img/user1-128x128.jpg' alt=" + userlist[i] + " title=" + userlist[i] + " style='cursor:pointer;margin-left: -16px; border:3px solid #FDFDFD;'/>";

                            }
                            else
                            {
                                rows += "<img class='direct-chat-img' src='../Img/user1-128x128.jpg' alt=" + userlist[i] + " title=" + userlist[i] + " style='cursor:pointer; border:3px solid #FDFDFD;'/>";

                            }
                        }
                        rows+= "</div>";
                        rows+= "<div class='direct-chat-msg'>";
                        rows += "<div class='direct-chat-info clearfix meetinglistpd' style='font-size:16px;'>";
                        rows += "<p class='meetingdirect-chat-name '>METRICS</p>";
                        for (l = 0; l < k; l++) {
                            if (l > 0) {
                                rows += "<p class='meetingptag pull-left' style='margin-left:8px;'>" + criterialist[l] + "</p>";
                            }
                            else
                            {
                                rows += "<p class='meetingptag pull-left'>" + criterialist[l] + "</p>";
                            }
                        }
                         rows+=  "<br />";
                         rows += "</div><p> <span class='direct-chat-timestamp pull-left'><img src='../img/clock.svg' style='margin-right:4px !important;'> " + meetingdate + " 2:05 pm</span></p></div>";
                         rows += "<div class='direct-chat-msg' style='padding-top:24px;'><a class='meeting_a' id=" + meetingid + " onclick='detailsmeetingdiv(" + meetingid + ")'>Details <img src='../img/arrow.forward.svg'></a></div></div></div> </div> </div>";
                    });
                   
                    $('#meetingnotelist').append(rows);
                    

                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });

        }

        function addtodotask() {
            var todaydate = $("#todotoday").text();
            var selecteddate = $(".todoselected").text();
            var meetingdate = "";
            var meetingmonth = $(".todohead-month").text();
            if (selecteddate == todaydate) {
                meetingdate = todaydate + " - " + meetingmonth;
            }
            else if (selecteddate != todaydate) {
                meetingdate = selecteddate + " - " + meetingmonth;
            }
        
            var gettodostaff = $('#<%=ddl_todostaff.ClientID %> option:selected').val();
            var criteriasno = $('#<%=ddl_todometric.ClientID %> option:selected').val();
        var vmtodoobj = {};

        vmtodoobj.criteriaid = criteriasno;
        vmtodoobj.taskname = $("#txt_title").val();
        vmtodoobj.assignto = gettodostaff;
        //vmtodoobj.assigndate = $("#txt_assigndate").val();
        vmtodoobj.enddtae = meetingdate;
        vmtodoobj.remark = $('iframe').contents().find('.todotextarea').html();
        var jsonData = JSON.stringify({
            vmtodoobj: vmtodoobj
        });

        $.ajax({
            type: "POST",
            url: "naaceasy.aspx/addtodo",
            data: jsonData,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            error: OnErrorCall
        });

        function OnSuccess(response) {
            var result = response.d;
            if (result == "success") {
                todotasklist();
            alert("todo task create successfully.. !");
        }

    }
    function OnErrorCall(response) {
        $('#success').hide();
        $('#error').show();
    }
}
        function todotasklist() {

            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/gettodotask",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                    $.each(customers, function () {
                        //$('#todotasklistshow').remove();
                        var task = $(this).find("taskname").text();
                        var taskstatus = $(this).find("taskstatus").text();
                        var assignto = $(this).find("name").text();
                        var assigndate = $(this).find("assigndate").text();
                        var criterianame = $(this).find("Menuname").text();
                        var enddate = $(this).find("enddate").text();
                        var todoremark = $(this).find("todoremark").text();
                        var tasksno = $(this).find("sno").text();
                        rows += "<div class='col-md-12' style='border-radius: 15px;padding-bottom: 15px;'><div class='box-footer clearfix box-body' style='border-radius: 15px;'>";
                        rows += "<div class='col-md-1' style='padding-top:5px'><span class='btn btn-info pull-left' style='border-radius:10px;margin-right: 5px;'>" + criterianame + "</span></div>";
                        rows+="<div class='col-md-3'  style='padding-top:5px'><img class='direct-chat-img' src='../Img/user3-128x128.jpg' alt='Message User Image' style='margin-right: 10px;' />";
                        rows += "<p style='font-size: 20px;margin-top: 5px;font-weight: 700;'>" + assignto + "</p></div>";
                        rows+="<div class='col-md-2'  style='padding-top:5px'><p style='font-weight: 500;color: #6c6b6b;margin: 0px;'>Task Name</p>";
                        rows += "<p style='font-size: 16px;font-weight: 600;'>" + task + "</p></div>";
                        rows+="<div class='col-md-2'  style='padding-top:5px'><p style='font-weight: 500;color: #6c6b6b;margin: 0px;'>Assigned On</p>";
                        rows += "<p style='font-size: 16px;font-weight: 600;'><i class='fa fa-clock-o'></i> " + assigndate + "</p></div>";
                        rows+="<div class='col-md-2'  style='padding-top:5px'><p style='font-weight: 500;color: #6c6b6b;margin: 0px;'>Due by</p>";
                        rows += "<p style='font-size: 16px;font-weight: 600;'><i class='fa fa-clock-o'></i> " + enddate + "</p></div>";
                        rows += "<div class='col-md-2'  style='padding-top:15px'><span class='btn btn-info pull-right'> <a href='#' style='color: white;'> Details</a></span></div></div></div>";
                    });
                   
                    $('#todotasklistshow').append(rows);
                  
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
        document.addEventListener('DOMContentLoaded', function () {
            var today = new Date(),
                year = today.getFullYear(),
                month = today.getMonth(),
                monthTag = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                day = today.getDate(),
                days = document.querySelectorAll('.todocal'),
                selectedDay,
                setDate,
                daysLen = days.length;
            function Calendar(selector, options) {
                this.options = options;
                this.draw();
            }

            Calendar.prototype.draw = function () {
                this.getCookie('selected_day');
                this.getOptions();
                this.drawDays();
                var that = this,
                    pre = document.getElementsByClassName('todopre-button'),
                    next = document.getElementsByClassName('todonext-button');

                pre[0].addEventListener('click', function () { that.preMonth(); });
                next[0].addEventListener('click', function () { that.nextMonth(); });
                while (daysLen--) {
                    days[daysLen].addEventListener('click', function () { that.clickDay(this); });
                }
            };

            Calendar.prototype.drawHeader = function (e) {
                var headMonth = document.getElementsByClassName('todohead-month');
                headDay = document.getElementsByClassName('todohead-day'),


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
                            days[j].id = "todotoday";
                        }
                    }
                    if (selectedDay) {
                        if ((j === selectedDay.getDate() + startDay - 1) && (month === selectedDay.getMonth()) && (year === selectedDay.getFullYear())) {
                            days[j].className = "todoselected";
                            this.drawHeader(selectedDay.getDate());
                        }
                    }
                }
            };

            Calendar.prototype.clickDay = function (o) {
                var selected = document.getElementsByClassName("todoselected"),
                    len = selected.length;
                if (len !== 0) {
                    selected[0].className = "";
                }
                o.className = "todoselected";
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
.todopre-button, .todonext-button {
margin-top: 0.5em;
    font-size: 3em;

    -webkit-transition: -webkit-transform 0.5s;
    transition: transform 0.5s;
    cursor: pointer;
  
    line-height: 0em;
    color: #fdfdfd;
    border-radius: 50%;
}


.todopre-button {
    background-color: #8a939f;
    height: 30px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    width: 30px;
    float: left;
    margin-left: 0.5em;
}
.todonext-button {
    background-color: #2A85FF;
    height: 30px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    width: 30px;
    margin-right: 0.5em;
    float: right;
  
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
.todohead-day {
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
.todohead-month {
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
#sopdetails tbody td:hover {
    color: black;
   background-color: #ffffff;
}

#ssrfileuploaded tbody td:hover {
    color: black;
   background-color: #ffffff;
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
.todoselected {
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
#todotoday {
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
.btn:active {
    -webkit-box-shadow: none;
    -moz-box-shadow:none;
    box-shadow: none;
}

</style>
         <div class="align-self-center someBlock"></div>
     <section id="Dashboardtab" style="display:none">
     <h2 style="font-size: 55px;padding-top: 150px;text-align: center;">Dashboard Panel</h2>
     </section>
     <section id="meetingtoptitlediv" style="display:none">
      <div class="callout callout-info row titlediv" id="meetinglistdiv">
          <div class="col-lg-8" style="padding-left: 0px;">
          <input type="hidden"id="meetingid" name="meetingid" />
           <h4>Meeting Notes</h4>
        <p>Create and manage notes to streamline workflow</p>
              </div>
            <div class="col-lg-4 paddingtop">
   <button type="button" class="pull-right addmeetingnotebtn" id="Addmeetingbtn"><img src="../Img/plus.svg" /> <span class="spanmargin"> Add New Note</span></button>

                </div>
      </div>

           <div class="callout callout-info row" id="addmeetingdiv" style="display:none">
            <div class="col-lg-7" style="padding-left: 0px;">
           <h4 class="meetingadd_h4"><a id="showmeetingadddiv" style="cursor:pointer" onclick="opendiv();"><img src="../Img/arrow.backward.svg" style="margin-right:16px;" /> </a>
              <div> <span id="meetingtitle">Add New Note</span>
                 <p id="meetingdetailsdate">Create and manage notes to streamline workflow</p>
                  </div>
           </h4>
          
              </div>
                <div class="col-lg-5" style="padding-left:0px; padding-right:0px;">
                
                    <button type="button" class="btn meetingsuccessbtn pull-right" style="" id="savemeetingbtn" onClick="addmeeting()"><img src="../Img/checkmark.shield.svg" /> <span class="sucbtn">Save</span></button>
                    <button type="button" class="btn btn-primary pull-right" style="float:right ; margin-top:15PX;margin-left: 15px; display:none" id="editmeeting" onClick="updatemeeting()"><i class="fa fa-fw fa-edit"></i>Edit</button>
                   <button type="button" class="meetingdltbtn btn pull-right" style="border-color:#F24E1E;border-radius: 16px;"><img src="../Img/trash.svg" /> <span class="dltbtn">Delete</span></button>

            
                    </div>
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
            <a id="showtodoadddiv" style="color:#000; cursor:pointer" onclick="opentododiv();"><i class="fa fa-fw fa-arrow-left"></i></a> Add New task</h4>
              <span style="margin-top: -30px;float:right">
                    <button type="button" class="btn btn-success pull-right" style="float:right ; margin-top:15PX;margin-left: 15px;" id="savetodobtn" onClick="addtodotask()"><i class="fa fa-fw fa-check"></i> Save</button>

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
       <div class="row" id="todotasklistshow">
           <h3 style="font-weight: 600;">Active tasks</h3>
       
         </div>
        </section>
    <section class="content" id="meetinglistsec" style="display:none">
     <div class="row" id="meetingnotelist">
     
</div>
        </section>
    <section class="content" id="meetingaddsec" style="display:none">
          <div class="row">
         <div class="col-lg-8">
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <!-- /.box-header -->
        <div class="box-body">
            <div class="col-lg-6" style="padding-left:0px;padding-right:0px;">
              <div class="form-group">
                <label class="addmeetinglabel">Attendees <img src="../Img/exclamationmark.circle.fill.svg" /></label> <br />
                   <span id="selectedstaff"></span>
                  <span id="previousstaff" style="display:none"></span>
                <button type="button" data-toggle="modal" data-target="#staffpopup" id="staffpopbtn" class="btn btn-flat" style="box-shadow:0px 3px 18px rgb(0 0 0 / 6%);;background-color: #fff;border-radius: 0px;padding:0PX !important;font-size:24px;line-height: 24px; width: 48px;font-weight: 600;font-weight: 600;height: 48px;border-radius: 24px;">
                +
                </button>
                 
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-lg-6" style="padding-left:0px;padding-right:0px;">
              <div class="form-group">
                <label class="addmeetinglabel">Metrics discussed <img src="../Img/exclamationmark.circle.fill.svg" /></label> <br />
                      <span id="selectedmetric"></span>
                    <span id="previousmetric" style="display:none"></span>
                   <button type="button" data-toggle="modal" data-target="#metricspopup" id="metricpopbtn" class="btn btn-flat" style="box-shadow:0px 3px 18px rgb(0 0 0 / 6%);;background-color: #fff;border-radius: 0px;padding:0PX !important;font-size:24px;line-height: 24px; width: 48px;font-weight: 600;font-weight: 600;height: 48px;border-radius: 24px;">
                     +
                </button>
           
              </div>
              <!-- /.form-group -->
        
              <!-- /.form-group -->
            </div>

                  <div class="col-lg-6" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="addmeetinglabel">Title <img src="../Img/exclamationmark.circle.fill.svg" /></label>
                  <input type="text" class="form-control" id="txt_topic" placeholder="Enter Meeting title..!" />
                </div>
             
                  </div>
                   <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
            <div class="form-group">
            <label class="addmeetinglabel">Description<img src="../Img/exclamationmark.circle.fill.svg" /></label>
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
                <div class="col-lg-4">
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

       <section class="content" id="todoaddsec" style="display:none">
          <div class="row">
         <div class="col-md-8">
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <!-- /.box-header -->
        <div class="box-body">
            <div class="col-md-6">
              <div class="form-group">
                <label>Staff</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i><br />
                  <asp:DropDownList ID="ddl_todostaff" class="form-control select2" style="width: 100%;" runat="server"></asp:DropDownList>
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group">
                <label>Metrics</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i><br />
                  <asp:DropDownList ID="ddl_todometric" runat="server" class="form-control select2" style="width: 100%;"></asp:DropDownList>
                    
              </div>
              <!-- /.form-group -->
        
              <!-- /.form-group -->
            </div>

                  <div class="col-md-12">
                       <div class="form-group">
                <label>Title</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                  <input type="text" class="form-control" id="txt_title" placeholder="Enter todo title..!" />
                </div>
             
                  </div>
                   <div class="col-md-12">
            <div class="form-group">
            <label>Description</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
            <!-- /.box-header -->
          
                <textarea class="todotextarea" placeholder="Place some text here"
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
              <label style="padding-left: 15px;">Due Date</label> <i class="fa fa-exclamation-circle" aria-hidden="true" style="color:#8A939F"></i>
                   <div class="elegant-calencar">
            
        <div id="todoheader" class="clearfix">
           <div class="todopre-button"><p style="margin-top: -2px;margin-left: -2px;"><i class="fa fa-angle-left" style="margin-top:-5px;"></i></p></div>
            <div class="head-info">
                <div class="todohead-day"></div>
                <div class="todohead-month"></div>
            </div>
            <div class="todonext-button"><p style="margin-top: -2px;margin-right: -2px;"><i class="fa fa-angle-right" style="margin-top:-5px;"></i></p></div>
        </div>
                       <hr/>
        <table id="todocalendar">
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
                    <td class="todocal"></td>
                    <td class="todocal"></td>
                   <td class="todocal"></td>
                    <td class="todocal"></td>
                <td class="todocal"></td>
                  <td class="todocal"></td>
                 <td class="todocal"></td>
                </tr>
                <tr>
                  <td class="todocal"></td>
                   <td class="todocal"></td>
                  <td class="todocal"></td>
                  <td class="todocal"></td>
                <td class="todocal"></td>
                   <td class="todocal"></td>
                   <td class="todocal"></td>
                </tr>
                <tr>
                    <td class="todocal"></td>
                  <td class="todocal"></td>
               <td class="todocal"></td>
                <td class="todocal"></td>
                 <td class="todocal"></td>
                  <td class="todocal"></td>
                  <td class="todocal"></td>
                </tr>
                <tr>
                     <td class="todocal"></td>
                 <td class="todocal"></td>
                   <td class="todocal"></td>
                 <td class="todocal"></td>
                     <td class="todocal"></td>
                    <td class="todocal"></td>
                   <td class="todocal"></td>
                </tr>
                <tr>
                    <td class="todocal"></td>
                   <td class="todocal"></td>
                  <td class="todocal"></td>
                  <td class="todocal"></td>
                <td class="todocal"></td>
                <td class="todocal"></td>
                    <td class="todocal"></td>
                </tr>
                <tr>
                    <td class="todocal"></td>
                   <td class="todocal"></td>
                  <td class="todocal"></td>
                   <td class="todocal"></td>
                   <td class="todocal"></td>
                  <td class="todocal"></td>
                  <td class="todocal"></td>
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
  <div class="modal-dialog" role="document" style="margin: 200px auto;background: #FDFDFD;border-radius: 24px;">
    <div class="modal-content" style="border-radius: 15px;">
      <div class="modal-header">
        <h5 class="modal-title" id="staffpopupTitle"> 
         <label class="addmeetinglabel">Add Attendees <img src="../Img/exclamationmark.circle.fill.svg" /></label>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></h5>
    
              <div class="form-group">
                   <div class="staffdropdiv">
    <div class="stafftitle_icon" onClick="show_hide_attendies()">
          <p style="padding-top: 10px;padding-left: 10px;">Select Attendies</p>
      <img class="stafftitle_img" src="../Img/chevron.down.svg" alt="" style="padding-top: 10px;
    padding-left: 10px;">
    </div>
    <hr class="staffdropdown_hr">
    <div class="staffdropdown_selection_table">
          <input type="hidden" id="hiddenstaff" name="hidecriteria" />
      <ul class="nav flex-column flex-nowrap staffcriteria_selection" id="txt_person"> 
                
      </ul>
    
    </div>
  </div>                 
              </div>
            <div class="form-group">
                <label class="addmeetinglabel">Currently Added <img src="../Img/exclamationmark.circle.fill.svg" /></label>
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
.staffdropdiv{
        flex: none;
    order: 1;
    flex-grow: 0;
    margin: 16px 0px;
    background: #FDFDFD;
    mix-blend-mode: normal;
    border: 2px solid #DBDBDB;
    box-sizing: border-box;
    box-shadow: 0px 3px 36px rgb(0 0 0 / 12%);
    border-radius: 16px;
  display:flex;
  flex-direction:column;
  padding-bottom:0px;
  box-sizing: border-box;
  overflow:hidden;
  transition: 300ms all ease-in-out;
}
.tododropdiv{
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
}
.stafftitle_img{
  transform: rotate(-180deg);
  /*transition: 300ms ease-in-out;*/
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
.stafftitle_icon{
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
.staffdropdown_selection_table{
  display:flex;
  flex-direction:row;
  overflow:hidden;
  width:100%;
}


.criteria_selection{
 padding-left: 0px !important;
  height:100%;
  width:100%;
  margin-left:8px;
  overflow-y:auto;
}
.staffcriteria_selection{
  display:flex;
  flex-direction:column;
  height:100%;
  width:100%;
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
staffcriteria_selection:last-child{
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
  <div class="modal-dialog" role="document" style="width: 550px;margin: 100px auto;">
    <div class="modal-content" style="border-radius: 15px;">
      <div class="modal-header">
        <h5 class="modal-title" id="metricspopupTitle">  <label class="addmeetinglabel">Add Metrics <img src="../Img/exclamationmark.circle.fill.svg" /></label> <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                <label class="addmeetinglabel">Currently Added <img src="../Img/exclamationmark.circle.fill.svg" /></label>
                  
                  <div class="direct-chat-msg" style="margin-top: 5px;margin-bottom: 5px;">
                    <span class="btn btn-info pull-left" style="border-radius:10px;margin-right: 5px;">1.2.1</span> <span class="direct-chat-name pull-left" style="padding-left: 15px;margin-top: 10px;    font-size: 13px;">Lorem Ipsum is simply dummy text</span> <i class="fa fa-fw fa-trash" style="color: #F24E1E;float: right;padding-top: 10px;"></i><br />
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
                title_img.style.transform = "rotate(90deg)";
                hr.style.marginBottom = "0";
                table.style.display = "none";
                dropdown.style.height = "auto";
                title.style.paddingBottom = "0";
                dropdown.style.boxShadow = "none";
            }

            else if (dropdown.style.height == "auto") {
                hr.style.border = "1px solid #DBDBDB";
                hr.style.marginBottom = "16px";
                title_img.style.transform = "rotate(270deg)";
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
    <script type="text/javascript">

        var staffhr = document.getElementsByClassName("staffdropdown_hr")[0];
        var stafftable = document.getElementsByClassName("staffdropdown_selection_table")[0];
        var staffdropdown = document.getElementsByClassName("staffdropdiv")[0];
        var stafftitle = document.getElementsByClassName("stafftitle_icon")[0];
        var stafftitle_img = document.getElementsByClassName("stafftitle_img")[0];
       
        function show_hide_attendies() {
            if (staffdropdown.style.height != "auto") {
                staffhr.style.border = "none";
                stafftitle_img.style.transform = "rotate(90deg)";
                staffhr.style.marginBottom = "0";
                stafftable.style.display = "none";
                staffdropdown.style.height = "auto";
                stafftitle.style.paddingBottom = "0";
                staffdropdown.style.boxShadow = "none";
            }

            else if (staffdropdown.style.height == "auto") {
                staffhr.style.border = "1px solid #DBDBDB";
                staffhr.style.marginBottom = "16px";
                stafftitle_img.style.transform = "rotate(270deg)";
                stafftable.style.display = "flex";
                staffdropdown.style.height = "292px";
                stafftitle.style.paddingBottom = "0px";
                staffdropdown.style.boxShadow = "0px 3px 36px rgba(0, 0, 0, 0.12)";
            }
        }
      </script>
     <section id="keyindicatordiv" style="display:none;">
      <div class="callout callout-info titlediv ">
           <h4 id="keyindicatorname"></h4>
        <p>Pick a Metric under this key indicator to proceed</p>
      </div>
     </section>
    <section class="content" id="keymetricdiv" style="display:none;padding-top: 0px;">
          <h3>Metric</h3>
              <div class="row" id="metriclistdiv">
                 
        
          </div>
        </section>
       <section id="metricdiv" style="display:none">
      <div class="callout callout-info row" style="display: flex;align-items: center;">
          <div class="col-lg-3">
           <h4 id="metricname"></h4>
        <p>Select a tab to view more</p>
              </div>
             <div class="col-lg-1 middleline">
                 </div>
             <div class="col-lg-1 div1type">
                   <span id="naactype" class="divcol1p"></span>
                  </div>
            <div class="col-lg-2">
                <p class="divcol2p">Marks Worth</p>
                   <span id="markworth" class="divcol2pval"></span>
                </div>
          <div class="col-lg-2" >
              <p class="divcol2p">Benchmark</p>
                  <span id="benchmark" class="divcol2pval"></span>
              </div>
         <%--    <div class="col-lg-1 middleline" style="margin:0px;">

                 </div>--%>
     
                  
      </div>
     </section>
       <section id="navtabsection" style="display:none;">
      <div class="callout callout-info row" style="display:flex">
        <div style="display:flex">
  <ul class="nav nav-tabs naactabmenu_ul" id="tabmenu">
       <li id="datatab"><a data-toggle="tab" href="#data" onclick="datatab()">Data</a></li>
    <li id="hometab"><a data-toggle="tab" href="#home" onclick="manualtab()">Manual</a></li>
    <li id="soptab"><a data-toggle="tab" href="#sop" onclick="soptab()">SOP</a></li>
    <li id="Guidelinestab"><a data-toggle="tab" href="#Guidelines" onclick="guidelinetab()">Guidelines</a></li>
    <li id="competitiontab"><a data-toggle="tab" href="#competition" onclick="ssrtab()">Competition SSR</a></li>
    <li id="faqtab"><a data-toggle="tab" href="#faq" onclick="faqtab()">FAQ</a></li>
   
    
  </ul>
      </div>
            <div style="display:flex;width: 40%;">
           <span class="middleline" style="margin:0px;height:52px;margin-left:150px"></span>
                  <div class="col-lg-12" id="metriclistspanid" style="width:100%;height:45px;overflow-y:scroll">
            
            </div>
                </div>
            </div>
     </section>
      
    <section class="content" id="metricdetailsdiv" style="display:none;padding:48px;padding-top:24px">
        <span id="metricid" style="display:none"></span>
         <span id="metricadddiv" style="display:none"></span>
          <span id="keyindicatorid" style="display:none"></span>
          
            <div class="row" id="naacmanualmaindiv" style="display:none">
                <div class="col-lg-8" style="padding-right:48px; padding-left:0px;">
                       <h3 class="h3class" style="margin-top:0px !important;">Details</h3>
<div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg divheight" id="naacmanual">

</div>

</div> </div> </div></div>

                 <div class="col-md-4" style="padding-right:0px; padding-left:0px;">
                       <h3 style="font-weight: 600;padding-left: 15px;margin-top:0px !important;">Data requirement</h3>
<div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg divheight" id="naacdatareq">
</div>


</div></div> </div> </div>
                    <div class="col-md-8" style="padding-right:48px; padding-left:0px;">
                           <h3 style="font-weight: 600;padding-left: 15px;">File description(upload)</h3>
<div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg divheight" id="naacfiledesc">

</div>


</div></div> </div> </div>
                 <div class="col-md-4" style="padding-right:0px; padding-left:0px;">
                         <h3 style="font-weight: 600;padding-left: 15px;">Additional Details</h3>
<div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
    <div class="col-lg-12 formuladata"><center style=" margin: 16px 16px !important;">
        <img src="../Img/123.rectangle.svg" /> 
          <a class="formula_a" data-toggle="modal" data-target="#formuladata" style="cursor:pointer;justify-content: space-around;align-items: center;">View Formula</a>
        </center>
    </div>
      <div class="col-lg-12 formuladata"><center style=" margin: 16px 16px !important;">
        <img src="../Img/rectangles.group.svg" /> 
          <a class="formula_a" style="cursor:pointer;justify-content: space-around;align-items: center;">View Table Formula</a>
        </center>
    </div>

</div></div> </div> </div>
            </div>
            <div class="row" id="naacsopmaindiv" style="display:none">
                <div class="col-md-12" style="padding-right:0px; padding-left:0px;">
<div class="box box-primary direct-chat direct-chat-primary" style="border: 2px solid #d2d6de;">

<div class="box-body">
<div class="direct-chat-messages" style="overflow:hidden;height: auto;">
<div class="direct-chat-msg" id="sopdetails">
</div>

</div> </div> </div></div>

            </div>           
      <div class="row" id="naacfaqdiv" style="display:none">
                <div class="col-md-8" style="padding-right:48px;">
                    <input type="hidden" id="faqhidenid" />
                    <div class="accordion md-accordion" id="accordionEx1" role="tablist" aria-multiselectable="true" style="overflow-x: hidden;overflow-y: scroll;height: 350px;">

</div>
                </div>

            </div>
          <div class="row" id="naacssrdiv" style="display:none">
                <div class="col-lg-6" style="padding-right:48px; padding-left:0px;">
                    <input type="hidden" id="ssrhidenid" />
                    <input type="hidden" id="getlastcarddiv" />
                    <div class="accordion md-accordion" id="accordionEx2" style="padding:16px;overflow-x: hidden; overflow-y: scroll;height: 350px;" role="tablist" aria-multiselectable="true">
                      
</div>
                </div>
                <div class="col-lg-6 box box-primary direct-chat direct-chat-primary" style="width: 50%; display:none;padding-right:0px; padding-left:0px;" id="ssrarea">

                       
                           <div class="col-lg-12" style="padding-right:0px; padding-left:0px;">
                                  <h3 class="divboxprimary">Description <img src="../Img/exclamationmark.circle.fill.svg" /></h3>
<div class="box-body divmargin" style="border-radius: 16px;border: 2px solid #DBDBDB;">
<div class="direct-chat-messages" style="height: 150px;">
<div class="direct-chat-msg" id="ssrcontentarea">

</div>


</div></div> </div>
                       <div class="col-lg-12" style="padding-right:0px; padding-left:0px;">
                            <h3 class="divboxprimary" padding-bottom: 0px !important;>File uploaded <img src="../Img/exclamationmark.circle.fill.svg" /></h3>
                           <div class="box-body">
<div class="direct-chat-messages" padding-top: 0px;>
<div class="direct-chat-msg" id="ssrfileuploaded" >

</div>


</div></div>
                           </div>
                   
                    </div>
            </div>
        <div class="row" id="naacmaindatadiv">
            <input type="hidden" id="dataid" />
              <input type="hidden" id="metrictype" />
            <input type="hidden" id="showdatalistbymetric" />
                <div class="col-lg-8" id="naac_132_133_div" style="padding-right:48px; padding-left:0px;display:none">
<div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg" id="naadatadetails">
    <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel"> Name of value added course offered <img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" name="txtcourseoffered" id="txtcourseoffered" placeholder="Eg: Introduction to Machine Learning" />
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Course code<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_coursecode" placeholder="Eg: CSE101" />
                </div>
             
                  </div>
     <div class="col-lg-6" style="padding-left:3px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Course duration (hrs)<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_courseduration" placeholder="Eg: 45" />
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Year of offering<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_year" placeholder="Eg: 2022" />
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:3px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">No. of times offered<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_timeoffered" placeholder="Eg: 02" />
                </div>
             
                  </div>
       <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">No. of students enrolled<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_stuenrolled" placeholder="Eg: 42" />
                </div>
             
                  </div>
     <div class="col-lg-6" style="padding-left:3px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">No. of students completing<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_completing" placeholder="Eg: 42" />
                </div>
             
                  </div>
</div>

</div> </div> </div>
               </div>
                <div class="col-lg-8" id="naac_112_122_div" style="padding-right:48px; padding-left:0px;display:none">
                 <div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg">
    <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Programme Name <img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_112_122_name" placeholder="Eg: B.Tech. in Computer Science with specialisation in AI and Machine Learning" />
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Programme Code<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_112_122_code" placeholder="Eg: 0023" />
                </div>
                  </div>
     <div class="col-lg-6" style="padding-left:3px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Year of introduction<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_112_122_intro" placeholder="Eg: 2016" />
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">CBCS/ECS implementation Status <img src="../Img/exclamation_small.svg" /></label>
                           <select id="txt_112_122_status" class="metricdropcss">
                                <option value="0">Select</option>
                               <option value="Yes">Yes</option>
                                <option value="No">No</option>
                           </select>
                <%--  <input type="text" class="form-control" id="txt_112_122_status" placeholder="Eg: Yes" />--%>
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:3px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Year of CBCS/ECS implementation <img src="../Img/exclamation_small.svg" /></label>
                             <select id="txt_112_122_yearimp" class="metricdropcss">
                                  <option value="0">Select</option>
                               <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                           </select>
               
                </div>
             
                  </div>
       <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Year of revision (if any)<img src="../Img/exclamation_small.svg" /></label>
                           <select id="txt_112_122_revision" class="metricdropcss">
                                <option value="0">Select</option>
                               <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                           </select>
                </div>
             
                  </div>
     <div class="col-lg-6" style="padding-left:3px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">% of content change in past 5 yrs<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_112_122_content" placeholder="Eg: 42" />
                </div>
             
                  </div>
</div>

</div> </div> </div>
               </div>
                <div class="col-lg-8" id="naac_113_121_div" style="padding-right:48px; padding-left:0px;display:none">
                 <div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg">
    <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Name of course<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_113_121_name" placeholder="Eg: B.Tech. in Computer Science with specialisation in AI and Machine Learning" />
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Course code<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_113_121_code" placeholder="Eg: ETCS101" />
                </div>
                  </div>
     <div class="col-lg-6" style="padding-left:3px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Year of introduction<img src="../Img/exclamation_small.svg" /></label>
                             <select id="txt_113_121_intro" class="metricdropcss">
                                <option value="0">Select</option>
                               <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                           </select>                </div>
             
                  </div>
      <div class="col-lg-12" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Activities/Content on employability/entrepeneurship/skill <img src="../Img/exclamation_small.svg" /></label>
                            <input type="text" class="form-control" id="txt_113_121_content" placeholder="Eg: Hackathon, Amazon S3" />
                           
                <%--  <input type="text" class="form-control" id="txt_112_122_status" placeholder="Eg: Yes" />--%>
                </div>
             
                  </div>

</div>

</div> </div> </div>
               </div>
                <div class="col-lg-8" id="naac_134_div" style="padding-right:48px; padding-left:0px;display:none">
                 <div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg">
    <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Program Name<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_134_name" placeholder="Eg: B.Tech. in Computer Science with specialisation in AI and Machine Learning" />
                </div>
             
                  </div>
      <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Program code<img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_134_code" placeholder="Eg: ETCS101" />
                </div>
                  </div>
      <div class="col-lg-6" style="padding-left:0px;padding-right:3px;">
                       <div class="form-group">
                <label class="datastylelabel">Name of the students<img src="../Img/exclamation_small.svg" /></label>
                            <input type="text" class="form-control" id="txt_134_student" placeholder="Eg: Hemant" />
                           
                <%--  <input type="text" class="form-control" id="txt_112_122_status" placeholder="Eg: Yes" />--%>
                </div>
             
                  </div>

</div>

</div> </div> </div>
               </div>
              <div class="col-lg-8" id="nodata_div" style="padding-right:48px; padding-left:0px;display:none">
                 <div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg">
    <center>
    <img src="../Img/Group 2.svg" style="height:250px;" />
        <p style="font-weight: 700;padding-top: 15px;font-size: 20px;">Oops !</p>
        <p style="color: #8A939F;font-size: 18px;">No data has been added</p>
        <p style="color: #8A939F;font-size: 18px;">To this metric so far.</p>
        </center>
</div>

</div> </div> </div>
               </div>

            <div class="col-lg-8" id="naac_141_div" style="padding-right:48px; padding-left:0px;display:none">
                 <div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg">
        <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group" id="main">
                <label class="datastylelabel"><b>Q.</b> <span id="feedbackmcq" style="line-height: 24px;font-size:16px;font-weight:400"></span></label>
                           <div class="col-lg-12" style="padding-left:0px;justify-content: space-between;display: flex;padding-left: 0px;align-items: center;padding-bottom: 10px;">
                                     
                                <div class="col-lg-4" style="padding-left:0px;">
                                      <span class="file-field">
                                         <input type="file" name="mcq_file" id="mcq_file" style="width: 15px;top: 2px;height: 20px; display:none" onchange="uploadmcqfile()"/>
                                        </span>
                                   <p style="padding-bottom: 5px;"><input type="checkbox" name="chkboxcount" id="studentchk" style="height:15px;width:15px;"/> 
                                       <span style="font-weight:600;font-size: 18px;">Student</span></p>

                                       <p style="padding-bottom: 5px;"> <input type="checkbox" name="chkboxcount" id="teacherchk" style="height:15px;width:15px;"/> 
                                  <span style="font-weight:600;font-size: 18px;">Teachers</span></p>

                                            <p style="padding-bottom: 5px;"> <input type="checkbox" name="chkboxcount" id="employerchk" style="height:15px;width:15px;"/> 
                                       <span style="font-weight:600;font-size: 18px;">Employers</span></p>
                                       <p style="padding-bottom: 5px;"> <input type="checkbox" name="chkboxcount" id="alumnichk" style="height:15px;width:15px;"/>
                                       <span style="font-weight:600;font-size: 18px;">Alumni</span></p>
                                </div>  
                                 <div class="col-lg-4" style="padding-left:0px;">
                                     <div id="stulink" style="height: 30px;padding-bottom: 5px;width:150px;"></div>
                                     <div id="teachlink" style="height: 30px;padding-bottom: 5px;width:150px;"></div>
                                     <div id="emplink" style="height: 30px;padding-bottom: 5px;width:150px;"></div>
                                     <div id="alumlink" style="height: 30px;padding-bottom: 5px;width:150px;"></div>
                                     </div>
                                    <div class="col-lg-4" style="padding-left:0px;">
                                            <p style="padding-bottom: 5px;">
                                                <input type="radio" name="radio" id="select_1" style="height:15px;width:15px;" disabled="disabled"/>
                                                <span style="font-weight:600;font-size: 18px;">All 4 of the above</span></p>
                                           <p style="padding-bottom: 5px;"> <input type="radio" name="radio" id="select_2" style="height:15px;width:15px;" disabled="disabled"/>
                                                <span style="font-weight:600;font-size: 18px;">Any 3 of the above</span></p>
                                            <p style="padding-bottom: 5px;">
                                                <input type="radio" name="radio" id="select_3" style="height:15px;width:15px;" disabled="disabled"/> 
                                                <span style="font-weight:600;font-size: 18px;">Any 2 of the above</span></p>
                                           <p style="padding-bottom: 5px;">
                                                <input type="radio" name="radio" id="select_4" style="height:15px;width:15px;" disabled="disabled"/>
                                                <span style="font-weight:600;font-size: 18px;">Any 1 of the above</span></p>

                                         </div>
                               
                           </div>
             

                </div>
             
                  </div>
</div>

</div> </div> </div>
               </div>
               <div class="col-lg-8" id="Qualitative" style="padding-right:24px; padding-left:0px;display:none">
                 <div class="box box-primary direct-chat direct-chat-primary">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg">
    <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel"><b>Q.</b> <span id="qualitativequestion" style="line-height: 24px;font-size:16px;font-weight:400"></span></label>
                            <textarea id="txt_qualitative" class="form-control" placeholder="Eg: Enter the metric qualitative inforamtion..."
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 2px solid #dddddd; padding: 10px;border-radius: 16px;font-size: 16px !important;"></textarea>
                <%--  <input type="text" class="form-control" id="txt_qualitative" placeholder="Eg: Enter the metric qualitative inforamtion..." />--%>
                </div>
             
                  </div>
</div>

</div> </div> </div>
               </div>
                <div class="col-lg-4" style="padding-right:0px; padding-left:0px; display:none" id="fileupload">
                  <div class="box box-primary direct-chat direct-chat-primary" style="height: 400px;padding-right: 0px;padding-left: 0px; overflow-y: scroll;">

<div class="box-body">
<div class="direct-chat-messages">
<div class="direct-chat-msg">
    <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Link to relevant documents <img src="../Img/exclamation_small.svg" /></label>
                  <input type="text" class="form-control" id="txt_linktodocument" placeholder="Eg: https://testing.pdf" />
                </div>
             <div class="col-lg-12" style="padding-left:0px;padding-right:0px;padding-bottom: 15px;" id="linkshow">

              </div>
                  </div>
     <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
                       <div class="form-group">
                <label class="datastylelabel">Files uploaded<img src="../Img/exclamation_small.svg" /></label>
                      
  <div class="file-field">
    <div class="btn btn-outline-primary waves-effect float-left">
      <span style="font-weight: 600;font-size: 16px;line-height: 20px;"><img src="../Img/arrow.up.doc.svg" /> File Upload</span>
           <input type="file" name="fuUpload" id="fuUpload" onchange="uploaddatafile()" />
    </div>
  </div>
                </div></div>
      <div class="col-lg-12" style="padding-left:0px;padding-right:0px;">
             <div class="progress-group" style="display:none" id="progressreport">
<div class="progress sm">
<div class="progress-bar progress-bar-aqua" style="width:0%">0%</div>
     <div class="msg" style="display:none"></div>
</div>
</div>
           </div> 
    <div class="col-lg-12" style="padding-left:0px;padding-right:0px;" id="filelistshow">

                  </div>
    </div>
    </div>
    </div>
    </div>
                  </div>

               
            <div class="col-lg-8" id="datalist" style="padding-left:0px;padding-right:48px;display:none">
                 <div class="accordion md-accordion" id="accordionEx3" style="overflow-x: hidden; overflow-y: scroll;height: 350px;" role="tablist" aria-multiselectable="true">
                      
</div>
            </div>
        </div>
         <div class="row">
                <div class="col-lg-8" style="padding-right:48px">
            <button type="button" class="btn meetingsuccessbtn pull-right" style="display:none" id="savedata"><img src="../Img/checkmark.shield.svg" /> <span class="sucbtn">Save</span></button>
            <button type="button" class="meetingdltbtn btn pull-right" style="border-color:#F24E1E;border-radius: 16px;display:none;" id="datadiscard" onclick="discardbtn()"><span class="btnspan">X</span><span class="dltbtn">Discard</span></button>
            <button type="button" class="addmeetingnotebtn pull-right" style="display:none" id="Add_data" onclick="showmetricadddiv()"><img src="../Img/plus.svg" /> <span class="sucbtn">Add Data</span></button>
             <button type="button" class="meetingdltbtn btn pull-right" style="border-color:#F24E1E;border-radius: 16px;display:none;" id="deletemetricdata"><img src="../Img/trash.svg" /><span class="dltbtn">Delete</span></button>
             <button type="button" class="addmeetingnotebtn pull-right" style="display:none" id="edit_metricdata" onclick="editbutton()"><img src="../Img/pencil.svg"/> <span class="sucbtn">Edit</span></button>
             <button type="button" class="addmeetingnotebtn pull-right" style="display:none" id="update_metricdata" onclick="updatebutton()"><img src="../Img/checkmark.shield.svg" /> <span class="sucbtn">Update</span></button>
             </div>
         </div>
        </section>
       <div class="modal fade" id="formuladata" tabindex="-1" role="dialog" aria-labelledby="formulaModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="border-radius: 16px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="../Img/xmark.svg" /></button>
                    </div>
                <div class="modal-body">
                    <center>
                      <div class="direct-chat-msg" id="naacadditional">

</div>
                    </center>
                   
                </div>
              
            </div>
        </div>
    </div>

</asp:Content>

