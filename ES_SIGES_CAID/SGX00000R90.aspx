<%@ Page Title="" Language="C#" MasterPageFile="~/Free.Master" AutoEventWireup="true"
    CodeBehind="SGX00000R90.aspx.cs" Inherits="CAID.SGX00000R90" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <div class="box  box-bordered green">
        <div class="box-title">
            <h3>
                Programación del Día</h3>
        </div>
        <div class="box-content nopadding">
            <div class='form-horizontal form-bordered'>
                <div class="control-group">
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable-scroll-x">
                            <thead>
                                <tr>
                                    <th>
                                         &nbsp
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <h5>
                                                    Record #: &nbsp
                                                    <%# Eval("RECORDID")%></h5>
                                                <h5>
                                                    <%# Eval("FULLNAME")%>
                                                </h5>
                                                <%# Eval("ESPECIALIDAD")%>
                                                <br />
                                                <%# Eval("TERAPISTANOMBRE")%>
                                                <br />
                                                <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt")%>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
