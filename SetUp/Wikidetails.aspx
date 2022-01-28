<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage/Admin.master" AutoEventWireup="true" CodeFile="Wikidetails.aspx.cs" Inherits="SetUp_Wikidetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
        <script type="text/javascript">
            $(document).ready(function () {
                var baseUrl = (window.location).href; // You can also use document.URL
                var koopId = baseUrl.substring(baseUrl.lastIndexOf('=') + 1);
                if (koopId != "http://localhost:62168/SetUp/Wikidetails.aspx") {
                    getwiki(koopId);
                    $("#btn_save").val('Update');
                }
                else {
                    koopId = 0;
                }
                $("#btn_save").on('click', function (e) {
                    // alert(koopId);
                    var user = '<%= Session["Username"].ToString() %>';
                    var type = $("#btn_save").val();
                    e.preventDefault();
                    var Details = {};
                    Details.menuid = $('#<%=ddl_menu.ClientID %> option:selected').val();
                    Details.title = $('#<%=txt_title.ClientID%>').val();
                    Details.value = $('#<%=txt_value.ClientID%>').val();
                    Details.benchmark = $('#<%=txt_benchmark.ClientID%>').val();
                    Details.qnt = $('#<%=txt_qnt.ClientID%>').val();
                    Details.details = $("#summernote").val();
                    Details.sop = $("#sopsummernote").val();
                    Details.guidelines = $("#guidelines").val();
                    Details.user = user;
                    Details.status = $('#<%=ddl_status.ClientID %> option:selected').val();
                    Details.type = type;
                    Details.wikiid = koopId;
                    var jsonData = JSON.stringify({
                        Details: Details
                    });

                    $.ajax({
                        type: "POST",
                        url: "Wikidetails.aspx/adddetails",
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
            function getwiki(sno) {

                $.ajax({
                    type: "POST",
                    url: "Wikidetails.aspx/Getdata",
                    data: '{id:"' + sno + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var xmlDoc = $.parseXML(response.d);
                        var xml = $(xmlDoc);
                        var customers = xml.find("Table");
                        var rows = '';
                        $.each(customers, function () {
                            $('#<%=ddl_menu.ClientID %>').val($(this).find("menusno").text());
                            $('#<%=txt_title.ClientID%>').val($(this).find("title").text());
                            $('#<%=txt_value.ClientID%>').val($(this).find("value").text());
                            $('#<%=txt_qnt.ClientID%>').val($(this).find("quantity").text());
                            $('#<%=txt_benchmark.ClientID%>').val($(this).find("benchmark").text());
                            $('#<%=ddl_status.ClientID %>').val($(this).find("isactive").text());
                            var wiki = $(this).find("wiki").text();
                            $("#summernote").summernote("code", wiki);
                            //   $("#summernote").val($(this).find("wiki").text());

                            //var summertext = $(this).find("wiki").text();
                            //alert(summertext);
                            var sopdetails = $(this).find("sopdetails").text();
                            $("#sopsummernote").summernote("code", sopdetails);
                            //$("#sopsummernote").val($(this).find("sopdetails").text());
                            var krmuguide = $(this).find("krmuguide").text();
                            $("#guidelines").summernote("code", krmuguide);
                            //    $("#guidelines").val($(this).find("krmuguide").text());

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
          <h1>Wiki Details</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Master</a></li>
            <li class="breadcrumb-item"><a href="#">Wiki Details</a></li>
            <li class="breadcrumb-item active">Wiki</li>
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
                            <div class="col-md-3">
                                  <label for="inputName">Select Criteria</label>
                                     <asp:DropDownList ID="ddl_menu" runat="server" class="form-control">
                             
                                     </asp:DropDownList>
                                </div>
                            <div class="col-md-2">
                                  <label for="inputName">Add Title</label>
                                 <asp:TextBox ID="txt_title" runat="server" class="form-control" AutoComplete="off"></asp:TextBox>
                                </div>
                            <div class="col-md-2">
                                  <label for="inputName">Add Marks</label>
                                 <asp:TextBox ID="txt_value" runat="server" class="form-control" AutoComplete="off"></asp:TextBox>
                                </div>
                               <div class="col-md-3">
                                  <label for="inputName">Add Type(Quality / Quantity)</label>
                                 <asp:TextBox ID="txt_qnt" runat="server" class="form-control" AutoComplete="off"></asp:TextBox>
                                </div>
                              <div class="col-md-2">
                                  <label for="inputName">BenchMark</label>
                                 <asp:TextBox ID="txt_benchmark" runat="server" class="form-control" AutoComplete="off"></asp:TextBox>
                                </div>
                           </div>
                    <div class="row" style="padding-top:15px;">
                    <div class="col-md-12">
                  <label for="inputName">Naac Details</label>
                      
                            <textarea id="summernote" style="height:100px;">
             
              </textarea>
                   
                        </div>
                           <div class="col-md-12">
                  <label for="inputName">SOP Details</label>
                            
                            <textarea id="sopsummernote" style="height:100px;">
             
              </textarea>
                   
                        </div>
                         <div class="col-md-12">
                  <label for="inputName">Guidelines</label>
                      
                            <textarea id="guidelines" style="height:100px;">
             
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

