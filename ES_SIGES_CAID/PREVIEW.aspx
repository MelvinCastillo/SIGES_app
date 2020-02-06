<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PREVIEW.aspx.cs" Inherits="CAID.PREVIEW" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
        <%--    <CR:CrystalReportViewer ID="mainReportViewer" runat="server" AutoDataBind="true"
                HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False" HasToggleGroupTreeButton="False"
                HasToggleParameterPanelButton="False" ToolPanelView="None" PrintMode="ActiveX" />--%>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <asp:Panel ID="MSGALERT" runat="server" Visible="false">
                <div class="wrapper orange">
                    <div class="box box-bordered red">
                        <div class="box-title">
                            <h3>
                                <i class="icon-bell"></i>Notificación
                            </h3>
                        </div>
                        <div class="box-content">
                            <br />
                            <p>
                                <asp:Label ID="lblMSG" runat="server" Text="NO EXISTEN DATOS PARA CARGAR EL REPORTE"></asp:Label>
                            </p>
                            <br />
                            <br />
                            <p>
                            </p>
                        </div>
                    </div>
     
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
