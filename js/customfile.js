$(document).ready(function () {
    getmeeting(0);
    dototask(0);
    dotocomtask(0);
 //   filelist();
    $("#lidashboard").addClass("addbackground");


});

function visibledashboard() {
    $("#addtododiv").hide();
    $("#todoaddsec").hide();
    $("#Dashboardtab").show();
    $("#meetingtoptitlediv").hide();
    $("#meetinglistdiv").hide();
    $("#meetinglistsec").hide();
    $("#todotasktoptitlediv").hide();
    $("#todotasklistdiv").hide();
    $("#todolistsec").hide();
    $("#meetingaddsec").hide();
    $("#addmeetingdiv").hide();
    //getmeeting(0);
    //dototask(0);
    //dotocomtask(0);
    //$(".content_resize").addClass("loading");
    //$('#dashboardtab').show();
    //$('#tabmenu').hide();
    //$('#contenttab').hide();
    //$("#linoteslink").removeClass("addbackground");
    //$("#lidashboard").addClass("addbackground");
    //$("#litodo").removeClass("addbackground");
    //$(".content_resize").removeClass("loading");
    // $('#criteriapathdiv').hide();

}
function visiblemeetingtab() {
    
    $("#todoaddsec").hide();
    $("#addtododiv").hide();
    $("#meetingtoptitlediv").show();
    $("#meetinglistdiv").show();
    $("#meetinglistsec").show();
    $("#Dashboardtab").hide();
    $("#todotasktoptitlediv").hide();
    $("#todotasklistdiv").hide();
    $("#todolistsec").hide();
    $("#meetingaddsec").hide();
    $("#addmeetingdiv").hide();
    
    //    $('#criteriapathdiv').hide();
    //$('#dashboardtab').hide();
    //$("#linoteslink").addClass("addbackground");
    //$("#litodo").removeClass("addbackground");
    //$("#lidashboard").removeClass("addbackground");
    //$("#Meeting").addClass("active in");
    //$("#home").removeClass("active in");
    //$("#todo").removeClass("active in");
    //$("#Guidelines").removeClass("active in");
    //$("#sop").removeClass("active in");
    //$("#competition").removeClass("active in");
    //$("#data").removeClass("active in");
    //$("#todo").removeClass("active in");

    //$("#hometab").removeClass("active");
    //$("#soptab").removeClass("active");
    //$("#Guidelinestab").removeClass("active");
    //$("#competitiontab").removeClass("active");
    //$("#faqtab").removeClass("active");
    //$("#todotab").removeClass("active");
    //$("#meetingtab").addClass("active");
    //$("#datatab").removeClass("active");

    //getmeeting(0);
    //dototask(0);
    //dotocomtask(0);

    //$("#criteriaid").text("");
    //$("#meetingcriterianame").text("");
    //$('#tabmenu').show();
    //$('#contenttab').show();
}
function visibletodotab() {
    $("#addtododiv").hide();
    $("#todoaddsec").hide();
    $("#meetingtoptitlediv").hide();
    $("#meetinglistdiv").hide();
    $("#meetinglistsec").hide();
    $("#Dashboardtab").hide();
    $("#todotasktoptitlediv").show();
    $("#todotasklistdiv").show();
    $("#todolistsec").show();
    $("#meetingaddsec").hide();
    $("#addmeetingdiv").hide();
    
   // $("#todotasklistsec").show();
    //getmeeting(0);
    //dototask(0);
    //dotocomtask(0);

    ////  $('#criteriapathdiv').hide();
    //$('#dashboardtab').hide();
    //$("#litodo").addClass("addbackground");
    //$("#linoteslink").removeClass("addbackground");
    //$("#lidashboard").removeClass("addbackground");
    //$("#Meeting").removeClass("active in");
    //$("#home").removeClass("active in");
    //$("#todo").addClass("active in");
    //$("#Guidelines").removeClass("active in");
    //$("#sop").removeClass("active in");
    //$("#competition").removeClass("active in");
    //$("#data").removeClass("active in");


    //$("#hometab").removeClass("active");
    //$("#soptab").removeClass("active");
    //$("#Guidelinestab").removeClass("active");
    //$("#competitiontab").removeClass("active");
    //$("#faqtab").removeClass("active");
    //$("#todotab").addClass("active");
    //$("#meetingtab").removeClass("active");
    //$("#datatab").removeClass("active");


    //$("#criterianame").text("");
    //$("#criteriaid").text("");
    //$('#tabmenu').show();
    //$('#contenttab').show();
}
function updatemeeting(meetingid) {
    document.getElementById('light').style.display = 'block';
    document.getElementById('fade').style.display = 'block'


}

var checkbox;
function dototask(sno) {

    $.ajax({
        type: "POST",
        url: "index.aspx/gettodotask",
        data: '{id:"' + sno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $.each(customers, function () {
                $('#tasklist li').remove();
                $('#pendingdiv').show();

                var task = $(this).find("taskname").text();
                var taskstatus = $(this).find("taskstatus").text();
                var assignto = $(this).find("assignto").text();
                var assigndate = $(this).find("assigndate").text();
                var criterianame = $(this).find("Menuname").text();
                var enddate = $(this).find("enddate").text();
                var todoremark = $(this).find("todoremark").text();
                var tasksno = $(this).find("sno").text();

                checkbox = "<label class='form-check-label' style='color:#bd1c1c'><input class='checkbox' type='checkbox' id='filechecked' onclick='ShowHideDiv(" + tasksno + ")'> &nbsp; " + task + "";

                rows += "<li> <div class='form-check'><span class='mytooltip tooltip-effect-5'><span class='tooltip-item'>" + checkbox + "<i class='input-helper'></i><span style='color:green'> (" + criterianame + ")</span></span></label><span class='tooltip-content clearfix'><span class='tooltip-text'><span><b>Task Name :</b> " + task + " </span><br><span><b> Assign To :</b> " + assignto + " </span><br><span><b> Assign Date :</b> " + assigndate + "</span><br><span><b> Enddate : </b>" + enddate + "</span><br><span><b> Reamrk : </b>" + todoremark + "</span></span></span></span></div><span style='color: #337ab7;font-size: 15px;margin-left: auto !important;'>(" + assignto + ")</span><i class='fas fa-edit' style='margin-top: 5px;margin-left: 5px !important; font-size: 10px;' onclick='gettodoedit(" + tasksno + ")'></i><i class='remove mdi mdi-close-circle-outline' style='margin-left:5px !important;' onclick='deletetodo(" + tasksno + ")'></i></li>";
            });
            if (rows == "") {
                $('#tasklist li').remove();
                $('#pendingdiv').hide();
            }
            else {
                $('#tasklist').append(rows);
            }

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}


function deletemeeting(meetingid) {
    var alert = confirm("Are you sure want to delete this meeting?");
    if (alert) {
        var id = $("#criteriaid").text();
        $.ajax({
            type: "POST",
            url: "index.aspx/deletemeeting",
            data: '{id:"' + meetingid + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = response.d;
                if (result == "success") {
                    getmeeting(id);
                   
                    dototask(id);
                    getcompetionssr(id);
                    getfaq(id);
                    dotocomtask(id);
                    filelist(id);
                }
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
    }
    else {

        return false;

    }
}
function deletetodo(meetingid) {
    var alert = confirm("Are you sure want to delete this Task?");
    if (alert) {
        var id = $("#criteriaid").text();
        $.ajax({
            type: "POST",
            url: "index.aspx/deletetodo",
            data: '{id:"' + meetingid + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = response.d;
                if (result == "success") {
                    getmeeting(id);
                    dototask(id);
                    getcompetionssr(id);
                    getfaq(id);
                    filelist(id);
                    dotocomtask(id);
                }
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
    }
    else {

        return false;

    }
}
function getmeeting(sno) {

    $.ajax({
        type: "POST",
        url: "index.aspx/getmeetingtask",
        data: '{id:"' + sno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $.each(customers, function () {
                $('#meetinglist li').remove();
                $('#notes').show();

                var meetingname = $(this).find("meetingname").text();
                var contactperson = $(this).find("contactperson").text();
                var Menuname = $(this).find("Menuname").text();
                var username = $(this).find("name").text();
                var meetingid = $(this).find("meetingid").text();
                var linksno = $(this).find("sno").text();
                rows += "<li style='border-radius: 7px;color: #004085;border-color: #cce5ff;background-color: #cce5ff;margin-bottom: 5px;'> <div class='form-check'><label class='form-check-label' onclick='getmeetingdetails(" + linksno + ")'>" + meetingname + "<span style='color:green'> (" + Menuname + ") </span><span style='color:green'> (" + username + ") </span></label></div><i class='remove mdi mdi-close-circle-outline' onclick='deletemeeting(" + linksno + ")'></i></li>";
            });
            if (rows == "") {
                $('#meetinglist li').remove();
                $('#notes').hide();
            }
            else {
                $('#meetinglist').append(rows);
            }

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}
function getcompetionssr(criteriaid) { 
    $.ajax({
        type: "POST",
        url: "index.aspx/getcompssr",
        data: '{id:"' + criteriaid + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            //   $('#accordion').remove();
            $('#accordion').empty();
            $('#ssrcriterianame').text("");
            $.each(customers, function () {

                var serialno = $(this).find("rowno").text();
                var ssrsno = $(this).find("sno").text();
                var universityname = $(this).find("universityname").text();
                var criteriadetails = $(this).find("criteiradetails").text();
                var criterianame = $(this).find("criteria").text();
                $('#ssrcriterianame').text(criterianame);

                rows += "<div class='panel panel-default'>";
                rows += "<div class='panel-heading'><h4 class='panel-title'>";
                rows += "<a data-toggle='collapse' data-parent='#accordion' href=" + '#compssr' + ssrsno + ">" + serialno + ". " + universityname + "</a>";
                rows += "</h4>";
                rows += "</div>";
                rows += " <div id=" + 'compssr' + ssrsno + " class='panel-collapse collapse'>";
                rows += "<div class='panel-body'>" + criteriadetails + "</div></div></div>";
              //  $("#accordion").addClass("loading");
            });

            $('#accordion').append(rows);
            //$("#accordion").removeClass("loading");
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}
function getfaq(criteriaid) {

    $.ajax({
        type: "POST",
        url: "index.aspx/getfaq",
        data: '{id:"' + criteriaid + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            //   $('#accordion').remove();
            $('#accordion_1').empty();
            $('#faqcriterianame').text("");
            $.each(customers, function () {

                var serialno = $(this).find("rowno").text();
                var faqsno = $(this).find("faqsno").text();
                var faqquestion = $(this).find("faqquestion").text();
                var faqanswer = $(this).find("faqanswer").text();
                var criterianame = $(this).find("criteria").text();
                $('#faqcriterianame').text(criterianame);

                rows += "<div class='panel panel-default'>";
                rows += "<div class='panel-heading'><h4 class='panel-title'>";
                rows += "<a data-toggle='collapse' data-parent='#accordion_1' href=" + '#faq' + faqsno + ">Q " + serialno + ". " + faqquestion + "</a>";
                rows += "</h4>";
                rows += "</div>";
                rows += " <div id=" + 'faq' + faqsno + " class='panel-collapse collapse'>";
                rows += "<div class='panel-body'>" + faqanswer + "</div></div></div>";

            });

            $('#accordion_1').append(rows);

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}

function dotocomtask(sno) {

    $.ajax({
        type: "POST",
        url: "index.aspx/getcomtodotask",
        data: '{id:"' + sno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $.each(customers, function () {
                $('#completelist li').remove();
                //$('#completelist li').remove();
                $('#completediv').show();
                var task = $(this).find("taskname").text();
                var taskstatus = $(this).find("taskstatus").text();
                var assignto = $(this).find("assignto").text();
                var tasksno = $(this).find("sno").text();
                var criterianame = $(this).find("Menuname").text();
                if (taskstatus == 1) {
                    //checkbox = "<input type='checkbox' checked='checked' id='filechecked' onclick='ShowHideDiv(" + tasksno + ")' /> <span style='color:green'>" + task + "</span>";
                    checkbox = "<label class='form-check-label_com' style='color:#19661c'><input type='checkbox' checked='checked' id='filechecked' onclick='ShowHideDiv(" + tasksno + ")'> &nbsp; " + task + "";
                }

                rows += "<li> <div class='form-check'>" + checkbox + "<i class='input-helper'></i><span style='color:green'> (" + criterianame + ")</span></label></div><span style='color: #337ab7;font-size: 15px;margin-left: auto !important;'>(" + assignto + ")</span></li>";
            });
            if (rows == "") {
                $('#completelist li').remove();
                $('#completediv').hide();
            }
            else {
                $('#completelist').append(rows);
            }

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}
function ShowHideDiv(checkid) {
    var treesno = document.getElementById("treeid").value;
    var treename = document.getElementById("treename").value;
    var checkbox = document.getElementById('filechecked');
    if (checkbox.checked != false) {
        $.ajax({
            type: "POST",
            url: "index.aspx/updatetodo",
            data: '{id:"' + checkid + '",taskstatus:"' + "1" + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                // alert("Record Update Successfully...!");
                //$("#tasklist").find("li").empty();
                $('#tasklist li').remove();
                $('#completelist li').remove();
                someFunction(treesno, treename);
                $("#home").removeClass("active in");
                $("#hometab").removeClass("active");
                $("#todo").addClass("active in");
                $("#todotab").addClass("active");
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });

    } else {

        $.ajax({
            type: "POST",
            url: "index.aspx/updatetodo",
            data: '{id:"' + checkid + '",taskstatus:"' + "0" + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //   alert("Record Update Successfully...!");
                $('#completelist li').remove();
                $('#tasklist li').remove();
                someFunction(treesno, treename);
                $("#home").removeClass("active in");
                $("#hometab").removeClass("active");
                $("#todo").addClass("active in");
                $("#todotab").addClass("active");
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
    }


}

$(document).ready(function () {
    $.ajax({
        url: "../MenuHandler.ashx",
        method: "get",
        dataType: "json",
        success: function (data) {
            var lastdiv = localStorage.getItem("lastopendiv");
            if (lastdiv == null) {
                // $('#welcomdiv').show();
            }
            else {
                //  $('#welcomdiv').hide();
                $('#' + lastdiv + '_div').show();
            }
            localStorage.clear();
           buildmenu_demo($('#menudemo'), data);
        }

    });

    function buildmenu(parent, items) {
        $.each(items, function () {
            var li = $('<li style="cursor:pointer"><a id=' + this.id + ' onclick="return someFunction(this.id,this.text)" style="cursor:pointer">' + this.text + '</a></li>');
            li.appendTo(parent);
            if (this.list && this.list.length > 0) {
                var ul = $('<ul></ul>');
                ul.appendTo(li);
                buildmenu(ul, this.list);
            }
        })
    }
    function buildmenu_demo(parent, items) {
        $.each(items, function () {
            var i = this.menuparentid;
            if (i != 0 && i != 3 && i != 4 && i != 5 && i != 6 && i != 7 && i != 8 && i != 9) {
                var li = $("<li class='nav-item'><a class='text-truncate' href=" + '#DIVM' + this.id + " id=" + this.id + " onclick='return someFunction(this.id,this.text," + i + ")' data-toggle='collapse'>" + this.text + " <i class='d-none d-sm-inline'></i></a>");
                li.appendTo(parent);
            }
            else {
                var li = $("<li class='nav-item'><a class='nav-link collapsed text-truncate' href=" + '#DIVM' + this.id + " id=" + this.id + " onclick='return someFunction(this.id,this.text," + i + ")' data-toggle='collapse'>" + this.text + " <i class='d-none d-sm-inline'></i></a>");
                li.appendTo(parent);
            }
            if (this.list && this.list.length > 0) {
                var ul = $("<ul class='flex-column pl-2 nav collapse paddingdiv' id=" + "DIVM" + this.id + " aria-expanded='false'></ul>");
                ul.appendTo(li);
                buildmenu_demo(ul, this.list);
            }
        })
    }
});

function someFunction(id, text, menuparentid) {
    // $('#accordion').remove();
    document.getElementById("treeid").value = id;
    document.getElementById("treename").value = text;
    $("#ddl_datacriteria option[value="+id+"]").attr('selected', 'selected');
 
    $("#criteriapath").text(text);

    $('#dashboardtab').hide();
    if (menuparentid != "0" && menuparentid != "3" && menuparentid != "4" && menuparentid != "5" && menuparentid != "6" && menuparentid != "7" && menuparentid != "8" && menuparentid != "9") {
        $('#tabmenu').show();
        $('#contenttab').show();
    }
    else {
        $('#tabmenu').hide();
        $('#contenttab').hide();
    }
    $("#litodo").removeClass("addbackground");
    $("#linoteslink").removeClass("addbackground");
    $("#lidashboard").removeClass("addbackground");
    $("#Meeting").removeClass("active in");
    $("#meetingtab").removeClass("active");
    $("#hometab").addClass("active");
    $("#home").addClass("active in");
    $("#faq").removeClass("active in");
    $("#Meeting").removeClass("active in");
    //  $('#criteriapathdiv').show();
    $("#todo").removeClass("active in");
    $("#Guidelines").removeClass("active in");
    $("#sop").removeClass("active in");
    $("#competition").removeClass("active in");
    $("#data").removeClass("active in");
    $("#todo").removeClass("active in");
    $("#Guidelinestab").removeClass("active");
    $("#soptab").removeClass("active");
    $("#competitiontab").removeClass("active");
    $("#todotab").removeClass("active");
    $("#faqtab").removeClass("active");
    $("#datatab").removeClass("active");
    dototask(id);
    getmeeting(id);
    getcompetionssr(id);
    getfaq(id);
    dotocomtask(id);
    filelist(id);
    var hiddendivvalue = $('#hidediv').val();
    if (id != "") {
        if (hiddendivvalue == "") {
            //  $('#welcomdiv').hide();
            $('#' + id + '_div').show();
            $('#' + id + '_divsop').show();
            $('#' + id + '_divguide').show();
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);
            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);


        }
        else if (hiddendivvalue == id) {
            //   $('#welcomdiv').hide();
            $('#' + id + '_div').show();
            $('#' + id + '_divsop').show();
            $('#' + id + '_divguide').show();
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);
            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);
        }
        else {
            //   $('#welcomdiv').hide();
            $('#' + id + '_div').show();
            $('#' + id + '_divsop').show();
            $('#' + id + '_divguide').show();
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);
            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);
            $('#' + hiddendivvalue + '_div').hide();
            $('#' + hiddendivvalue + '_divsop').hide();
            $('#' + hiddendivvalue + '_divguide').hide();
        }
    }
    else {
        var lastdiv = localStorage.getItem("lastopendiv");
        if (lastdiv == null) {
            $('.article').hide();
        }
        else {
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);

            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);
            $('#' + hiddendivvalue + '_div').hide();
            $('#' + hiddendivvalue + '_divsop').hide();
            $('#' + hiddendivvalue + '_divguide').hide();

        }
        //  $('#welcomdiv').show();
    }
    $("#hidediv").val(id);

}
//$(function () {
//    $("a[class='Update']").click(function () {
//        $("#exampleModal").modal("show");
//        return false;
//    });
//});

var wikiid = 0;
$(function () {
    $('[id*=a_btn]').bind('click', function () {
        var row = $(this).closest('tr');
        var id = $(row).find('.rid').html().trim();
        var title = $(row).find('.rtitle').html().trim();
        var wiki = $(row).find('.rwiki').html().trim();
        wikiid = id;
        //   $("#summernote").summernote("code", wiki);
        $("#title").text(title);
        $("#criterianame").text(title);
        $("#meetingcriterianame").text(title);

        $('#exampleModalCenter').modal('show');

    });
});

function showMessage() {
    //alert(wikiid);

    var Details = {};
    //     Details.details = $("#summernote").val();
    Details.wikiid = wikiid;
    var jsonData = JSON.stringify({
        Details: Details
    });

    $.ajax({
        type: "POST",
        url: "index.aspx/adddetails",
        data: jsonData,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        error: OnErrorCall
    });

    function OnSuccess(response) {
        var result = response.d;
        if (result == "success") {

            localStorage.setItem("lastopendiv", $('#hidediv').val());
            //   var divvalue = $('#hidediv').val();
            $('#exampleModalCenter').modal('hide');
            location.reload();
            $('#' + divvalue + '_div').show();
        }

    }
    function OnErrorCall(response) {
        alert("Failed in Updating Details.");
    }
}

function getPath(a) {
    var path = $(a).text();
    var $parent = $(a).parents("li").eq(1).find("a:first");

    if ($parent.length == 1) {
        path = getPath($parent) + " > " + path;
    }

    return path;
}
//$(document).on('click', '#menudemo a', function () {
//    $("#criteriapath").text(getPath(this));
//    event.preventDefault();
//});


$(document).ready(function () {
    $("#fileuploadbtn").click(function () {
        var filename = $("#txt_title").val();
        var description = $("#txt_description").val();
        var getcriteriavalue = $('#ddl_datacriteria option:selected').val();
        var fileUpload = $("#FileUpload1").get(0);
        var files = fileUpload.files;
        var id = $("#criteriaid").text();
    //    alert(id);
        var data = new FormData();
        if (files.length > 0) {
            data.append('filepath', files[0]);
        }
        data.append('filename', filename);
        data.append('description', description);
        data.append('getcriteriavalue', getcriteriavalue);
        $.ajax({
            url: "../fileupload.ashx",
            type: "POST",
            data: data,
            contentType: false,
            processData: false,
            success: function (result) {
                alert(result);
                filelist(id)
            },
            error: function (err) {
                alert(err.statusText)
            }
        });

     //   evt.preventDefault();
        //   alert(files);
    });
});


function filelist(id) {
  //  var sno = '<%= Session["LoginID"].ToString() %>';
 //   document.getElementById("treeid").value = value;
    //    alert(sno);
    $.ajax({
        type: "POST",
        url: "index.aspx/filelist",
        data: '{id:"' + id + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $.each(customers, function () {
                $('#filelist li').remove();
                $('#notes').show();

                var filename = $(this).find("filename").text();
                var filepath = $(this).find("filepath").text();
                var CreatedBy = $(this).find("CreatedBy").text();
                var filecriteria = $(this).find("filecriteria").text();
                var Menuname = $(this).find("Menuname").text();
                var Mefile_descriptionnuname = $(this).find("file_description").text();             
                var fileid = $(this).find("fileid").text();
                rows += "<li style='border-radius: 7px;color: #004085;border-color: #cce5ff;background-color: #cce5ff;margin-bottom: 5px;'> <div class='form-check'><label class='form-check-label'><a href='/upload/" + filepath + "' target='_blank'>View File</a><span style='color:green'> (" + Menuname + ") </span><span style='color:green'> (" + filename + ") </span></label></div><i class='remove mdi mdi-close-circle-outline' onclick='deletefile(" + fileid + ")'></i></li>";
            });
            if (rows == "") {
                $('#filelist li').remove();
                $('#notes').hide();
            }
            else {
                $('#filelist').append(rows);
            }

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
    // $('#myModal').modal('show');
}
function deletefile(listid) {
    var alert = confirm("Are you sure want to delete this meeting?");
    if (alert) {
        var id = $("#criteriaid").text();
        $.ajax({
            type: "POST",
            url: "index.aspx/deletelist",
            data: '{id:"' + listid + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = response.d;
                if (result == "success") {
                    getmeeting(id);
                    dototask(id);
                    getcompetionssr(id);
                    getfaq(id);
                    dotocomtask(id);
                    filelist(id);
                }
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
    }
    else {

        return false;

    }
}
// Initiate an Ajax request on button click
//$(document).on("click", "button", function () {
//    $.get("customers.php", function (data) {
//        $("body").html(data);
//    });
//});
