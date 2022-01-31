<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Home_index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src=" https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet" />   
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<link href="../css/customcssfile.css" rel="stylesheet" />
    <script src="../js/customfile.js"></script>
<script type="text/javascript">
    function closeform() {
        document.getElementById('light').style.display = 'none';
        document.getElementById('fade').style.display = 'none'
        $("#txt_topic").val("");
        $("#txt_person").val("");
        $("#meetingid").text("");
        $("#linksnohidden").val("0");
        $('#<%=ddl_criteria.ClientID %>').val("0");
}
function canceltodoedit() {
    $("#txt_task").val("");
    $("#txt_assignto").val("");
    $("#txt_assigndate").val("");
    $("#txt_enddate").val("");
    $("#todoremark").val("");
    $("#todosno").text("");
    $('#<%=ddl_todocriteria.ClientID %>').val("0");
    $("#btn_doto").text("Add To Do");
    $("#btn_todocancel").hide();
}
    function gettodoedit(sno) {

        $.ajax({
            type: "POST",
            url: "index.aspx/gettodotaskdetails",
            data: '{id:"' + sno + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var customers = xml.find("Table");
                var rows = '';
                $.each(customers, function () {
                    $("#txt_task").val($(this).find("taskname").text());
                    $("#txt_assignto").val($(this).find("assignto").text());
                    $("#txt_assigndate").val($(this).find("assigndate").text());
                    $('#<%=ddl_todocriteria.ClientID %>').val($(this).find("criteriaid").text());
                $("#txt_enddate").val($(this).find("enddate").text());
                $("#todoremark").val($(this).find("todoremark").text());
                $("#todosno").text($(this).find("sno").text());

            });
            $("#btn_doto").text("Update");
            $("#btn_todocancel").show();

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}
    function addtodotask() {
        var id = $("#criteriaid").text();
        var criteriasno;
        var getcriteriavalue = $('#<%=ddl_todocriteria.ClientID %> option:selected').val();
    if (getcriteriavalue != "0") {
        criteriasno = getcriteriavalue;
    }
    else {
        criteriasno = $("#criteriaid").text();
    }
    
    var vmtodoobj = {};

    vmtodoobj.criteriaid = criteriasno;
    vmtodoobj.sno = $("#todosno").text();
    vmtodoobj.taskname = $("#txt_task").val();
    vmtodoobj.assignto = $("#txt_assignto").val();
    vmtodoobj.assigndate = $("#txt_assigndate").val();
    vmtodoobj.enddtae = $("#txt_enddate").val();
    vmtodoobj.remark = $("#todoremark").val();
    var jsonData = JSON.stringify({
        vmtodoobj: vmtodoobj
    });

    $.ajax({
        type: "POST",
        url: "index.aspx/addtodo",
        data: jsonData,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        error: OnErrorCall
    });

    function OnSuccess(response) {
        var result = response.d;
        if (result == "success") {
            $('#accordion').remove();
            dototask(id);
            getmeeting(id);
            getcompetionssr(id);
            getfaq(id);
            dotocomtask(id);
            $("#txt_task").val("");
            $('#<%=ddl_todocriteria.ClientID %>').val("0");
            $("#txt_assignto").val("");
            $("#todoremark").val("");
            $("#txt_assigndate").val("mm/dd/yyyy");
            $("#txt_enddate").val("mm/dd/yyyy");
            var sno = $("#todosno").text();
            if (sno != "") {
                $("#success").show();
                $("#btn_doto").text("Add To Do");
                $("#btn_todocancel").hide();
            }
            alert("todo task create successfully.. !");
        }

    }
    function OnErrorCall(response) {
        $('#success').hide();
        $('#error').show();
    }
}

function addmeeting() {

    var selecteduser = "";
    var selectedcriteria = "";
    var hiddenvalue = $("#linksnohidden").val();
    if (hiddenvalue != "0" && hiddenvalue != "") {

        selecteduser = $('#<%=ddl_updateuser.ClientID %> option:selected').val();
        selectedcriteria = $('#<%=ddl_updatecriteria.ClientID %> option:selected').val();

    }
    else {
        $('#<%=txt_person.ClientID %> option:selected').each(function () {
            selecteduser += $(this).val() + ",";
        });
        $('#<%=ddl_criteria.ClientID %> option:selected').each(function () {
            selectedcriteria += $(this).val() + ",";
        });
    }
    var id = $("#criteriaid").text();
    var vmmeetingobj = {};
    vmmeetingobj.meetingcriteria = selectedcriteria;
    vmmeetingobj.meetingtopic = $("#txt_topic").val();
    vmmeetingobj.meetingdate = $("#meetingdate").val();
    vmmeetingobj.meetingtime = $("#meetingtime").val();
    vmmeetingobj.contactperson = selecteduser;
    vmmeetingobj.meetingsno = $("#meetingid").text();
    vmmeetingobj.remark = $("#remark").val();
    vmmeetingobj.linksno = hiddenvalue;
    var jsonData = JSON.stringify({
        vmmeetingobj: vmmeetingobj
    });
    $.ajax({
        type: "POST",
        url: "index.aspx/addmeeting",
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
            $('#<%=ddl_criteria.ClientID %>').val("0");
            $('#<%=txt_person.ClientID %>').val("0");
            if (hiddenvalue != "0" && hiddenvalue != "") {
                $('#meetingsuccess').show();
            }
            alert("Meeting Create Successfully..!");
        }

    }
    function OnErrorCall(response) {
    }
}
function getmeetingdetails(sno) {
    document.getElementById('light').style.display = 'block';
    document.getElementById('fade').style.display = 'block'

    $.ajax({
        type: "POST",
        url: "index.aspx/getmeetingdetails",
        data: '{id:"' + sno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $("#remark").val("");
            $('#meetingsuccess').hide();
            $.each(customers, function () {
                $('#<%=ddl_updateuser.ClientID %>').val($(this).find("userid").text());
                $('#<%=ddl_updatecriteria.ClientID %>').val($(this).find("criteriaid").text());
                $("#selectedstaff").text($(this).find("name").text());
                $("#updatemeeting").text($(this).find("meetingname").text());
                $("#selectedcriteria").text($(this).find("Menuname").text());
                $("#linksnohidden").val($(this).find("sno").text());
                $("#meetingid").text($(this).find("meetingid").text());
                var wiki = $(this).find("remark").text();
                $("#remark").summernote("code", wiki);
            });
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}

function canceledit() {
    $("#txt_topic").val("");
    $("#meetingid").text("");
    $('#ContentPlaceHolder1_txt_person').text("");
    $('#<%=ddl_criteria.ClientID %>').val("");

}
</script>
    <style>
        #accordion_1 ul{
    padding-left:15px !important;
}
           #accordion ul{
    padding-left:15px !important;
}
           .overlay{
    display: none;
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 999;
    background: rgba(255,255,255,0.8) url("/Img/oader.gif") center no-repeat;
}
/* Turn off scrollbar when body element has the loading class */
#accordion.loading{
    overflow: hidden;   
}
/* Make spinner image visible when body element has the loading class */
#accordion.loading .overlay{
    display: block;
}
#loaderdiv.loading{
    overflow: hidden;   
}
/* Make spinner image visible when body element has the loading class */
#loaderdiv.loading .overlay{
    display: block;
}
    </style>
  <script>
  
  </script>

      <div style="text-align: center; font-size: 18px;margin-bottom: 15px;font-weight:600;color: #3f6791;background-color: #efefef;" id="criteriapathdiv">
     <span id="criteriapath"></span>
     <ul class="navbar-nav ml-auto" style="float:right;padding-right:15px;list-style:none">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a data-toggle="dropdown" style="text-decoration:none;cursor:pointer">
         <asp:Label ID="lbl_user_1" runat="server" style="color:red;"></asp:Label> 
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="width: 18%;">

            <!-- Message Start -->
            <div class="media">
              <img src="../dist/img/avatar5.png" alt="User Avatar" class="img-size-50 mr-3 img-circle" style="width:80px;padding-left: 5px; height:auto" />
              <div class="media-body">
                <h3 style="font-size:18px;font-weight: 600;">
                <asp:Label ID="lbl_user_2" runat="server"></asp:Label>
                  
                </h3>
                 
              </div>
            </div>
             <p style="padding-left:15px;margin-bottom: 0px;">
                      Email Id : <asp:Label ID="lblemail" runat="server"></asp:Label>
                  </p>
                    <p style="padding-left:15px;margin-bottom: 0px;">
                      Contact No : <asp:Label ID="lblcontact" runat="server"></asp:Label>
                  </p>
                <p style="padding-left:15px;">Last Login : <asp:Label ID="lbllastlogin" runat="server"></asp:Label> </p>
                  <asp:LinkButton ID="lnklogout" runat="server" class="nav-link" Text="LogOut" style="float:right; padding-right:15px;color: #be3131;font-size: 16px;" OnClick="lnklogout_Click"> Log Out</asp:LinkButton>
            <!-- Message End -->
       
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
    </ul>
              <span style="float:right;margin-right:15px;font-size:15px;">Welcome : </span>  
           <span style="float:right;margin-right:15px;font-size:15px;"> <asp:LinkButton ID="lblgoback" runat="server" class="nav-link" Text="Go Back" style="font-size: 16px;" Visible="false" OnClick="lblgoback_Click">Go Back</asp:LinkButton>
 <span style="padding-left: 10px;" runat="server" visible="false" id="spanid">| </span></span>
             <!-- Right navbar links -->
 
 </div>
      <div class="content_resize" style="padding-left: 15px;">
         
            <div class="sidebar">
              
        <div class="gadget navbar-side">
           <h4 style="padding-bottom: 10px;">
               <img src="../Img/Logo.png" alt="Logo" class="brand-image elevation-3" style="width: 100%;" />
           </h4>
          <div class="clr"></div>

             <div class="container-fluid">
    <div class="row">
        <div class="col-2 collapse show d-md-flex bg-light pt-2 pl-0 min-vh-100" id="sidebar" style="overflow:scroll;height:450px">
              <ul class="nav flex-column flex-nowrap overflow-hidden" id="menudemo" style="font-size: 16px;">
               <li class="nav-item"><a class="nav-link text-truncate" onclick="visibledashboard();"  id="lidashboard"><i class="fa fa-tachometer"></i> Dashboard</a></li>
               <li class="nav-item"><a class="nav-link text-truncate" onclick="visiblemeetingtab();" style="cursor:pointer" id="linoteslink"><i class="fa fa-group"></i> Meeting Notes</a></li>
               <li class="nav-item"><a class="nav-link text-truncate" onclick="visibletodotab();" style="cursor:pointer" id="litodo"><i class="fa fa-tasks"></i> To Do</a></li>
            </ul>
       
        </div>
    
    </div>
</div>
            <br />
            <h4 style="font-size: 22px;font-weight: 700;">Useful Links</h4>
            <ul class="nav flex-column flex-nowrap overflow-hidden" style="font-size: 14px;">
                <li class="ui-menu-item">
                <a href="../UpLoad/SOP-General-University-as-on-01-01-2021.pdf" target="_blank">SOP General University</a>
                </li>
                <li class="ui-menu-item">
                <a href="../UpLoad/NAAC Easy.docx" target="_blank">NAAC Easy</a>
                </li>
                <li class="ui-menu-item">
                <a href="../UpLoad/NAAC Revised University Manual 06.4.2021.pdf" target="_blank">NAAC Revised University Manual</a>
                </li>
            </ul>
               <div class="col-md-12">
               
               </div>
        </div>
      </div>
      <div class="mainbar" style="padding-left: 30px;">
   <div class="container">
      <%-- <div style="width: 80%;margin-bottom: 5px;">
   <a href="#">Previous</a>
                <a style="float: right;" onclick="shownext();">Next</a>
       </div>--%>
    
  <ul class="nav nav-tabs" style="font-weight:600;display:none" id="tabmenu">
<%--    <li class="active"><a data-toggle="tab" href="#naacdashboard">Dashboard</a></li>--%>
    <li class="active" id="hometab"><a data-toggle="tab" href="#home">Manual</a></li>
    <li id="soptab"><a data-toggle="tab" href="#sop">SOP</a></li>
    <li id="Guidelinestab"><a data-toggle="tab" href="#Guidelines">Guidelines</a></li>
    <li id="competitiontab"><a data-toggle="tab" href="#competition">Competition SSR</a></li>
    <li id="faqtab"><a data-toggle="tab" href="#faq">FAQ</a></li>
    <li id="todotab"><a data-toggle="tab" href="#todo">To Do</a></li>
    <li id="meetingtab"><a data-toggle="tab" href="#Meeting">Meeting Notes</a></li>
    <li id="datatab"><a data-toggle="tab" href="#data">Data</a></li>
    
  </ul>
  
   
       <div class="wrapper" id="dashboardtab" style="padding-top: 10px;">
   <div class="content-wrapper">
               <!-- Content Wrapper. Contains page content -->

    <!-- Content Header (Page header) -->
  
   
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
            <div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Menu</span>
                <span class="info-box-number">
                  10
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Wiki Title</span>
                <span class="info-box-number">10</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
      

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Link With Menu</span>
                <span class="info-box-number">760</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Unique Visitors</span>
                <span class="info-box-number">2,000</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
     
        <!-- /.row -->

           <!-- Main row -->
    
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
  
       </div></div>
  <div class="tab-content" style="width: 80%;display:none" id="contenttab">
         <input type="hidden" name="treeid" id="treeid" />
         <input type="hidden" name="treename" id="treename" />
    <div id="home" class="tab-pane fade in active">
     <input type="hidden" id="hidediv" name="hidediv" />
           
            <asp:DataList ID="dl_wikidetails" runat="server"  EnableViewState="true">
             <ItemTemplate>
                  <span class="rid" style="display: none"><%# Eval("wikiid") %></span>
             <span class="rtitle" style="display: none"><%# Eval("title") %></span>
             <span class="rwiki" style="display: none"><%# Eval("wiki") %></span>
        <div class="article" id="<%#Eval("menusno") %>_div" style="display:none;width: 842px;">
        <div style="margin-top:15px;font-size: 20px;font-weight: 600;"> <span><%#Eval("title") %></span><span style="margin-left:190px;">Marks : <span><%#Eval("value") %></span> | <span><%#Eval("quantity") %></span> </span><span style="float:right">Benchmark : <%#Eval("benchmark") %></span></div> 
          <%--<p class="infopost">Posted <span class="date">on <%#Eval("createddate") %></span> by <a href="#"><%#Eval("CreatedBy") %></a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under 
           <a href="#"><%#Eval("Menuname") %></a>
               <a class="rm" id="a_btn" style="cursor:pointer">Edit</a>
                 <a id="a_btn" style="cursor:pointer" class="com">Edit</a>
          </p>--%>
          <div class="clr"></div>
          <div class="post_content" style="text-align: justify;    width: 100%;">
             <p> <%#Eval("wiki") %></p>
          <p class="spec">

          </p>
          </div>
          <div class="clr"></div>
        </div>
           </ItemTemplate>
       </asp:DataList>
    </div>
        <div id="sop" class="tab-pane fade">
            
              <asp:DataList ID="DataList1" runat="server"  EnableViewState="true">
             <ItemTemplate>
        <div class="article" id="<%#Eval("menusno") %>_divsop" style="display:none">
          <div class="clr"></div>
          <div class="post_content" style="text-align: justify;    width: 100%;padding-top:15px;">
            <%#Eval("sopdetails") %>
          <p class="spec">

          </p>
          </div>
          <div class="clr"></div>
        </div>
           </ItemTemplate>
       </asp:DataList>
            </div>
    <div id="Guidelines" class="tab-pane fade" style="padding-left: 15px;">
      <asp:DataList ID="DataList2" runat="server"  EnableViewState="true">
             <ItemTemplate>
        <div class="article" id="<%#Eval("menusno") %>_divguide" style="display:none">
          <div class="clr"></div>
          <div class="post_content" style="text-align: justify;    width: 100%;">
             <p> <%#Eval("krmuguide") %></p>
          <p class="spec">

          </p>
          </div>
          <div class="clr"></div>
        </div>
           </ItemTemplate>
       </asp:DataList>
    </div>
    <div id="Meeting" class="tab-pane fade">
       <div class="row container d-flex justify-content-center" style="padding-top: 15px;width: 100%;">
                <div class="card col-sm-12">
                    <div class="card-body">
        <h5 class="modal-title" id="meetingLabel">
                  <span id="meetingid" style="display:none"></span>
              <span id="meetingcriteriaid" style="display:none"></span>
            <span id="meetingcriterianame" style="font-size:16px; font-weight:600"></span>
           </h5>
                        <div class="add-items d-flex" style="padding-top: 15px;margin-bottom: 0px;">
                              <label>Notes</label>
                             <label style="margin-left:230px;">Select Meeting Attendees</label>
                                 <label style="margin-left:85px;">Select Criteria</label>
                            </div>
                        <div class="add-items d-flex" style="margin-bottom: 0px;">
                          
                            <input type="text" id="txt_topic" class="form-control todo-list-input" placeholder="Notes" />&nbsp;
                           <asp:DropDownList ID="txt_person" runat="server" class="selectpicker" multiple data-live-search="true" style="width:100%"></asp:DropDownList>&nbsp;
                             <asp:DropDownList ID="ddl_criteria" runat="server" class="selectpicker" multiple data-live-search="true" style="width:100%"></asp:DropDownList>&nbsp;

                        </div>
                           <div class="add-items d-flex" style="padding-top: 10px;margin-bottom: 0px;">
                              <label>Time</label>
                             <label style="margin-left:125px;">Date</label>
                                 
                            </div>
                          <div class="add-items d-flex">
                            <input type="time" class="form-control todo-list-input" id="meetingtime" style="width: 150px;"/>&nbsp;
                            <input type="date" class="form-control todo-list-input" id="meetingdate" style="width: 200px;"/>&nbsp;
                              <span style="margin-left: 230px;"></span>
                            <button type="button" class="add btn btn-primary font-weight-bold todo-list-add-btn" onClick="addmeeting()" id="meetingbtn">Add Notes</button>
                            <button type="button" class="add btn btn-info font-weight-bold todo-list-add-btn" onClick="canceledit()" id="cancel_btn">Cancel</button>
                              </div>
                          <div class="list-wrapper">
                      <ul class="d-flex flex-column-reverse todo-list" id="meetinglist">
                             
                      </ul>
                                </div>
                    </div>
                </div>
           <div id="light" class="white_content">
     <div class="row">
         <div class="col-sm-12">
               <div class="alert alert-success" role="alert" id="meetingsuccess" style="display:none">
          Meeting Update Successfully...!
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
         </div>
         </div>
       <div class="col-sm-12">
           <input type="hidden" id="linksnohidden" />
           <span id="updatemeeting" style="font-size:18px; font-weight:600;color:#337ab7"></span>
           </div>
         <div class="col-sm-6">
              <label>Staff  </label><%-- ( <span id="selectedstaff" style="font-size:14px; font-weight:600"></span> )--%>
             <asp:DropDownList ID="ddl_updateuser" runat="server" class="form-control"></asp:DropDownList>
         </div>
          
         <div class="col-sm-6">
               <label>Criteria  </label> <%--( <span id="selectedcriteria" style="font-size:14px; font-weight:600"></span> )--%>
             <asp:DropDownList ID="ddl_updatecriteria" runat="server" class="form-control"></asp:DropDownList>
         </div>
         <div class="row"></div>
            <div class="col-sm-12" style="padding-top:15px;">
                     <label>Add Remark</label>
             
                  <textarea id="remark" class="form-control todo-list-inp"></textarea>
                </div>
            <div class="col-sm-12">
                   <hr />
                </div>
      
           <div class="col-sm-12" style="padding-top:15px;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float:right;margin-left: 15px;" onclick="closeform();">Close</button>
        <button type="button" class="btn btn-primary" style="float:right" onClick="addmeeting()" id="meetingupdate">Update</button>
               </div>
        
     </div>
  </div>
  <div id="fade" class="black_overlay"></div>
        </div>
        
    </div>
    <div id="todo" class="tab-pane fade" style="margin-top: 15px;">
        <div class="row container d-flex justify-content-center" style="padding-top: 15px;width: 100%;">
                <div class="card col-sm-12">
                    <div class="card-body">
                         <div class="alert alert-success" role="alert" id="success" style="display:none">
          Task Create Successfully...!
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
         </div>
          <div class="alert alert-danger" role="alert" id="error" style="display:none">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
 Something is Wrong Please try again later...!
</div>
        <h5 class="modal-title" id="exampleModalLabel">
                  <span id="criteriaid" style="display:none"></span>
             <span id="todosno" style="display:none"></span>
            <span id="criterianame" style="font-size:16px; font-weight:600"></span>
           </h5>
                             <div class="add-items d-flex" style="padding-top: 15px;margin-bottom: 0px;">
                              <label>Task Name</label>
                             <label style="margin-left:187px;">Assign To</label>
                                 <label style="margin-left:190px;">Select Criteria</label>
                            </div>
                        <div class="add-items d-flex">
                              <input type="text" id="txt_task" class="form-control todo-list-input"/>&nbsp;
                             <input type="text" class="form-control todo-list-input" id="txt_assignto"/> &nbsp;
                              <asp:DropDownList ID="ddl_todocriteria" runat="server" class="form-control"></asp:DropDownList>
                        </div>
                            <div class="add-items d-flex" style="padding-top: 10px;margin-bottom: 0px;">
                              <label>Assign Date</label>
                             <label style="margin-left:148px;">End Date</label>
                                 <label style="margin-left:167px;">Reamrk</label>
                            </div>
                            <div class="add-items d-flex"  >
                             <input type="date" class="form-control todo-list-input" id="txt_assigndate" style="width:70%"/> &nbsp;
                             <input type="date" class="form-control todo-list-input" id="txt_enddate" style="width:70%"/> &nbsp;
                             <textarea id="todoremark" class="form-control todo-list-input"></textarea> &nbsp;
                            
                        </div>
                        <div class="add-items d-flex" style="margin-bottom: 0px; float:right">
                             <button type="button" class="add btn btn-primary font-weight-bold todo-list-add-btn" id="btn_doto" onClick="addtodotask()">Add To Do</button>
                             <button type="button" class="add btn btn-info font-weight-bold todo-list-add-btn" id="btn_todocancel" onClick="canceltodoedit()" style="display:none">Cancel</button>
                           
                            </div>
                     
                    </div>
                </div>
         
        </div>
         <div class="row container d-flex justify-content-center" style="padding-top: 15px;width: 100%;">
                <div class="card col-sm-12" style="display:none !important" id="pendingdiv">
                    <div class="card-body">
                          <div class="list-wrapper">
                            <h3 style="color:#bd1c1c">Pending Task</h3>
                            <ul class="d-flex flex-column-reverse todo-list" id="tasklist">
                             
                            </ul>
                        </div>
                    </div>
                </div>
        </div>
    <div class="row container d-flex justify-content-center" style="padding-top: 100px;width: 100%;">
                <div class="card col-sm-12" id="completediv" style="display:none !important">
                    <div class="card-body">
                        <div class="list-wrapper">
                            <h3 style="color:#19661c">Complete Task</h3>
                            <ul class="d-flex flex-column-reverse todo-list" id="completelist">
                             
                            </ul>
                        </div>
                    </div>
                </div>
        </div>
    </div>
       <div id="data" class="tab-pane fade">
            <div class="row container d-flex justify-content-center" style="padding-top: 15px;width: 100%;">
                <div class="card col-sm-12">
                    <div class="card-body">
                         <h5 class="modal-title" id="exampleModalLabeldata">
                  <span id="criteriaiddata" style="display:none"></span>
            <span id="datacriterianame" style="font-size:16px; font-weight:600"></span>
           </h5>
                        <div class="add-items d-flex" style="padding-top: 15px;margin-bottom: 0px;">
                              <label>Upload File</label>
                             <label style="margin-left:187px;">Title</label>
                                 <label style="margin-left:225px;">Criteria</label>
                            </div>
                        <div class="add-items d-flex">
                            <asp:FileUpload ID="FileUpload1" class="form-control todo-list-input" runat="server" ClientIDMode="Static" />&nbsp;
                             <input type="text" id="txt_title" class="form-control todo-list-input"/>&nbsp;
                             <asp:DropDownList ID="ddl_datacriteria" runat="server" class="form-control" ClientIDMode="Static">
                                
                             </asp:DropDownList>
                        </div>
                        <div class="add-items d-flex" style="margin-bottom: 0px;">
                              <label>Description</label>
                          
                            </div>
                        <div class="add-items d-flex" style="margin-bottom: 0px;">
                         
                <asp:TextBox ID="txt_description" runat="server"  class="form-control todo-list-input" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
             
                            </div>
                        <div class="add-items d-flex" style="margin-bottom: 0px;float:right">
                            <button type="button" class="btn btn-primary" style="float:right ; margin-top:15PX;" id="fileuploadbtn">Submit</button>
                              </div>
                        <div class="list-wrapper" style="margin-top: 65px;">
                      <ul class="d-flex flex-column-reverse todo-list" id="filelist">
                             
                      </ul>
                                </div>
      </div></div></div>
           </div>
        <div id="competition" class="tab-pane fade">
            <h3 id="ssrcriterianame"></h3>
      <div class="panel-group" id="accordion">
   
      </div> 
     </div>
        <div id="faq" class="tab-pane fade">
        <h3 id="faqcriterianame"></h3>
     <div class="panel-group" id="accordion_1">
   
  </div> 
    </div>
  </div>

</div>


      </div>
      <div class="clr"></div>
    </div>
 
        <script>
            $(document).ready(function () {
                $('#remark').summernote(
                  {
                      height: 200
                  });

            });
        </script>

</asp:Content>

