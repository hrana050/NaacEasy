<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage/Admin.master" AutoEventWireup="true" CodeFile="Wikilist.aspx.cs" Inherits="SetUp_Wikilist" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <script src="http://code.jquery.com/jquery-1.11.3.js" type="text/javascript"></script>
     <script src="../plugins/jquery/jquery.min.js"></script>
      <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Criteria List</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Manage Criteria</a></li>
            <li class="breadcrumb-item active">Criteria List</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <!-- Main content -->
    <section class="content" style="padding-left: 15px;padding-right: 15px;">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header" style="background-color: #ffffff;">
                <div class="card-body">
         <asp:GridView ID="grdrecord" runat="server" AutoGenerateColumns="false" OnRowCommand="grdrecord_RowCommand" AllowPaging="true" PageSize="130" Width="100%" class="table table-bordered table-striped">
                          
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="Black" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="#FFFFFF"/>
                            <RowStyle HorizontalAlign="Center" BackColor="#f2f2f2"/>
                            <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
                            <Columns>
                                <%-- <asp:BoundField HeaderText="LevelID" DataField="LevelID" />--%>
                                  <asp:TemplateField HeaderText="S.No.">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Menu" DataField="Menuname" />
                                <asp:BoundField HeaderText="Title" DataField="title" />
                                <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
                               <asp:BoundField HeaderText="Status" DataField="menustatus" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="lnkEdit" CommandArgument='<%#Eval("wikiid") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                No Record Found
                            </EmptyDataTemplate>
                        </asp:GridView>
                  </div>
              </div>
              
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
            <div class="col-md-2">
                </div>
        </div>
    
      </section>

  </ContentTemplate>
                      </asp:UpdatePanel>
</asp:Content>

