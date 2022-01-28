<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage/Admin.master" AutoEventWireup="true" CodeFile="krmwiki.aspx.cs" Inherits="SetUp_krmwiki" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />

    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
  <!-- Theme style -->

  <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
  <!-- summernote -->
  <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.min.css" />
       
    <link href="../js/jquery-ui.css" rel="stylesheet" />
    <script src="../js/jquery-ui.js"></script>
      <script type="text/javascript">
          $(document).ready(function () {
              $.ajax({
                  url: "../MenuHandler.ashx",
                  method: "get",
                  dataType: "json",
                  success: function (data) {
                      var lastdiv = localStorage.getItem("lastopendiv");
                      if (lastdiv == null) {
                          $('#welcomdiv').show();
                      }
                      else {
                          $('#welcomdiv').hide();
                          $('#' + lastdiv + '_div').show();
                      }
                      localStorage.clear();
                      buildmenu($('#Memu'), data);
                      $('#Memu').menu();
                  }

              });

              function buildmenu(parent, items) {
                  $.each(items, function () {
                      var li = $('<li style="cursor:pointer"><a id=' + this.id + ' onclick="return someFunction(this.id)" style="cursor:pointer">' + this.menutext + '</a></li>');
                      li.appendTo(parent);
                      if (this.list && this.list.length > 0) {
                          var ul = $('<ul></ul>');
                          ul.appendTo(li);
                          buildmenu(ul, this.list);
                      }
                  })
              }
          });

          function someFunction(id) {
              var hiddendivvalue = $('#hidediv').val();
              if (id != "") {
                  if (hiddendivvalue == "") {
                      $('#welcomdiv').hide();
                      $('#' + id + '_div').show();
                  }
                  else if (hiddendivvalue == id) {
                      $('#welcomdiv').hide();
                      $('#' + id + '_div').show();
                  }
                  else {
                      $('#welcomdiv').hide();
                      $('#' + id + '_div').show();
                      $('#' + hiddendivvalue + '_div').hide();
                  }
              }
              else {
                  var lastdiv = localStorage.getItem("lastopendiv");
                  if (lastdiv == null) {
                      $('.article').hide();
                  }
                  else {
                      $('#' + hiddendivvalue + '_div').hide();

                  }
                  $('#welcomdiv').show();
              }
              $("#hidediv").val(id);

          }

    </script>
     
      <script type="text/javascript">
          var wikiid = 0;
          $(function () {
              $('[id*=a_btn]').bind('click', function () {
                  var row = $(this).closest('tr');
                  var id = $(row).find('.rid').html().trim();
                  var title = $(row).find('.rtitle').html().trim();
                  var wiki = $(row).find('.rwiki').html().trim();
                  wikiid = id;
                  $("#summernote").summernote("code", wiki);
                  $("#title").text(title);

                  $('#exampleModalCenter').modal('show');

              });
          });

          function showMessage() {
              //alert(wikiid);

              var Details = {};
              Details.details = $("#summernote").val();
              Details.wikiid = wikiid;
              var jsonData = JSON.stringify({
                  Details: Details
              });

              $.ajax({
                  type: "POST",
                  url: "krmwiki.aspx/adddetails",
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
                      var divvalue = $('#hidediv').val();
                      $('#exampleModalCenter').modal('hide');
                      location.reload();
                     $('#' + divvalue + '_div').show();
                  }
              }
              function OnErrorCall(response) {
                  alert("Failed in Updating Details.");
              }
          }
    </script>
    <style>
        .modal-dialog {
    max-width: 900px;
    margin: 1.75rem auto;
}
    </style>
          <!-- Content Wrapper. Contains page content -->

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Wikipedia</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Wikipedia</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
 
  
      <style>
        html {
  scroll-behavior: smooth;

}
       hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 2px solid #eee;
}
       .ui-widget .ui-widget {
    font-size: 1em;
    width: 100%;
    top: 29px! important;
    left: 7px ! important;
}
    </style>
    <div class="row">
          <div class="col-md-3">
               <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
            <ul id="Memu" style="width: 100%;" data-tag="channelList">
                <li class="ui-state-active"><a id="welcome" onclick="return someFunction(this)">Welcome</a></li>
            </ul>
        </div></div>
           <div class="col-md-9">
      <div class="content_resize" style="padding-left: 15px;">
      <div class="mainbar" style="padding-left: 30px;">
          <input type="hidden" id="hidediv" name="hidediv" />
           <div class="article" id="welcomdiv">
          <h2><span>Welcome Testing</span></h2>
          <p class="infopost">Posted <span class="date">on 12-Nov-2020</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under 
</p>
          <div class="clr"></div>
          <div class="post_content" style="text-align: justify;    width: 100%;">
             <p>Contrary to popular belief, Lorem Ipsum is not simply random text. 
                 It has roots in a piece of classical Latin literature from 45 BC, 
                 making it over 2000 years old. Richard McClintock, a Latin professor 
                 at Hampden-Sydney College in Virginia, looked up one of the more obscure 
                 Latin words, consectetur, from a Lorem Ipsum passage, and going through 
                 the cites of the word in classical literature, discovered the undoubtable source.
                 Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" 
                 (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on 
                 the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 
                 "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
                 The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. 
                 Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in 
                 their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. </p>
          <p class="spec">
          </p>
          </div>
          <div class="clr"></div>
        </div>
       <asp:DataList ID="dl_wikidetails" runat="server"  EnableViewState="true">

             <ItemTemplate>
                  <span class="rid" style="display: none"><%# Eval("wikiid") %></span>
             <span class="rtitle" style="display: none"><%# Eval("title") %></span>
             <span class="rwiki" style="display: none"><%# Eval("wiki") %></span>
        <div class="article" id="<%#Eval("menusno") %>_div" style="display:none;width: 930px;">
          <h2><span><%#Eval("title") %></span></h2>
          <p class="infopost">Posted <span class="date">on <%#Eval("createddate") %></span> by <a href="#"><%#Eval("CreatedBy") %></a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under 
           <a href="#"><%#Eval("Menuname") %></a>
              <%-- <a class="rm" id="a_btn" style="cursor:pointer">Edit</a>--%>
              <a id="a_btn" style="cursor:pointer;float: right;font-size: 20px;color: red;" class="com">Edit</a></p>
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
      <div class="clr"></div>
    </div>
              </div></div>
   
<!-- Modal -->


        <!-- /.row -->

           <!-- Main row -->
    
        <!-- /.row -->
      </div><!-- /.container-fluid -->

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document" style="width: 900px;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><span id="title" style="font-size:16px; font-weight:600"></span></h5>
      
      </div>
      <div class="modal-body">
        <textarea id="summernote"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_save" onClick="showMessage()">Update changes</button>
       
      </div>
    </div>
  </div>
</div>
    </section>
    <!-- /.content -->
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

    })
</script>
  <!-- /.content-wrapper -->
</asp:Content>

