<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage/Admin.master" AutoEventWireup="true" CodeFile="Competitionssr.aspx.cs" Inherits="SetUp_Competitionssr" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
        <script type="text/javascript">
            $(document).ready(function () {
                var baseUrl = (window.location).href; // You can also use document.URL
                var koopId = baseUrl.substring(baseUrl.lastIndexOf('=') + 1);
                if (koopId != "http://krmangalam.in/Naacinfo/SetUp/Competitionssr.aspx") {
                    getcompetitionssr(koopId);
                    $("#btn_save").val('Update');
                }
                else {
                    koopId = 0;
                }
                $("#btn_save").on('click', function (e) {
                    // alert(koopId);
                    var type = $("#btn_save").val();
                    e.preventDefault();
                    var vmcompetitionssrobj = {};
                    vmcompetitionssrobj.criteriasno = $('#<%=ddl_menu.ClientID %> option:selected').val();
                    vmcompetitionssrobj.universityname = $('#<%=txt_university.ClientID%>').val();
                    vmcompetitionssrobj.compssrdetails = $("#summernote").val();
                    vmcompetitionssrobj.status = $('#<%=ddl_status.ClientID %> option:selected').val();
                    vmcompetitionssrobj.type = type;
                    vmcompetitionssrobj.sno = koopId;
                    var jsonData = JSON.stringify({
                        vmcompetitionssrobj: vmcompetitionssrobj
                    });

                    $.ajax({
                        type: "POST",
                        url: "Competitionssr.aspx/addcompssr",
                        data: jsonData,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: OnSuccess,
                        error: OnErrorCall
                    });

                    function OnSuccess(response) {
                        var result = response.d;
                        if (result == "success") {
                            alert("Record Update Sucessfully");
                            var amountvalue = $("#number").val();

                        }
                    }

                    function OnErrorCall(response) {
                        alert("Failed in Updating Details.");
                    }

                });

            });
            function getcompetitionssr(sno) {

                $.ajax({
                    type: "POST",
                    url: "Competitionssr.aspx/Getdata",
                    data: '{id:"' + sno + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var xmlDoc = $.parseXML(response.d);
                        var xml = $(xmlDoc);
                        var customers = xml.find("Table");
                        var rows = '';
                        $.each(customers, function () {
                            $('#<%=ddl_menu.ClientID %>').val($(this).find("Menuid").text());
                            $('#<%=txt_university.ClientID%>').val($(this).find("universityname").text());
                            $('#<%=ddl_status.ClientID %>').val($(this).find("comstatus").text());
                            var wiki = $(this).find("criteiradetails").text();
                            $("#summernote").summernote("code", wiki);
                       
                            });

                        },
                        error: function (response) {
                            var r = jQuery.parseJSON(response.responseText);
                            alert("Message: " + r.Message);
                        }
                    });
                }
    </script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
  <!-- Theme style -->

  <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
  <!-- summernote -->
  <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.min.css" />

    <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Competition SSR</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Master</a></li>
            <li class="breadcrumb-item"><a href="#">Competition SSR</a></li>
            <li class="breadcrumb-item active">Competition  SSR</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  

    <!-- Main content -->
    <section class="content" style="padding-left: 15px;padding-right: 15px;">
        <div class="row">
               <div class="col-md-1">
                   </div>
          <div class="col-md-10">
            <div class="card card-primary">
            
              <div class="alert alert-success alert-dismissible fade show" role="alert" runat="server" id="successdiv" visible="false">
                <strong>Success!</strong> Record Saved Sucessfully.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="alert alert-danger alert-dismissible fade show" role="alert" runat="server" id="errordiv" visible="false">
                <strong>
                    <asp:Label ID="lblerrormsg" runat="server"></asp:Label>!</strong> Already Exist.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>

              <div class="card-header">
                <h3 class="card-title">Add</h3>
                <div class="card-tools">
                
                </div>
              </div>
                 
              <div class="update" id="validateform">
                
              <div class="card-body">
                <div class="form-group">
                       <div class="row">
                           
                            <div class="col-md-6">
                                  <label for="inputName">University Name</label>
                                 <asp:TextBox ID="txt_university" runat="server" class="form-control" AutoComplete="off"></asp:TextBox>
                                </div>
                            <div class="col-md-6">
                                  <label for="inputName">Select Criteria</label>
                                     <asp:DropDownList ID="ddl_menu" runat="server" class="form-control">
                             
                                     </asp:DropDownList>
                                </div>
                          
                           </div>
                    <div class="row" style="padding-top:15px;">
                    <div class="col-md-12">
                  <label for="inputName">Criteria Details</label>
                      
                            <textarea id="summernote" style="height:100px;">
             
              </textarea>
                   
                        </div>
                        
                         </div>
                     <div class="row">
                         <div class="col-md-4">
                  <label for="inputName">Status</label>
                           <asp:DropDownList ID="ddl_status" runat="server" class="form-control">
                               <asp:ListItem Value="1" Text="Active">Active</asp:ListItem>
                               <asp:ListItem Value="0" Text="Inactive">Inactive</asp:ListItem>
                  </asp:DropDownList>
                        </div>
                            <div class="col-md-8" id="Divhide" style="margin-top: 30px;">
                                  <input type="submit" class="btn btn-secondary float-right" style="margin-right: 15px;" value="Cancel" id="btn_cancel"/>
                           <input type="submit" class="btn btn-success float-right" style="margin-right: 15px;" value="Save" id="btn_save"/>
                    </div>
                  </div>
                
                </div>
              
              
              </div>
              </div>
           
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <div class="col-md-1">
                   </div>
        </div>
    
      </section>



   
    <!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<!-- Summernote -->
<script src="../plugins/summernote/summernote-bs4.min.js"></script>

<!-- Page specific script -->
<script>
    $(function () {
        $('#summernote').summernote({
            height: 300,                 // set editor height

        });
        $('#sopsummernote').summernote({
            height: 300,                 // set editor height

        });
        $('#guidelines').summernote({
            height: 300,                 // set editor height

        });

    })
</script>
</asp:Content>


