<%@ Page Title="" Language="C#" MasterPageFile="~/SitePrint.Master" AutoEventWireup="true"
    CodeBehind="PAX00100_GR1.aspx.cs" Inherits="CAID.PAX00100_GR1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-content">
                    <div class="invoice-info">
                        <asp:Repeater ID="rpData" runat="server">
                            <ItemTemplate>
                                <%# Eval("HTML")%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
