<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTX00000_A.aspx.cs" Inherits="CAID.FTX00000_A" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>FACTURAS
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable">
                            <thead>
                                <tr>
                                    <th># Factura
                                    </th>
                                    <th>Fecha 
                                    </th>
                                    
                                    <th>Record
                                    </th>
                                    <th>Paciente
                                    </th>
                                    <th>Acciones
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("FTNUMERO")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDateTime(Eval("FTFECHA")).ToString("dd-MM-yyyy")%>
                                            </td>
                                            

                                            <td>
                                                <%# Eval("PACIENTERECORD")%>
                                            </td>
                                            <td>
                                                <%# Eval("FTPACIENTENOMBRE")%>
                                            </td>

                                            <td>
                                                <asp:LinkButton ID="btnEdit" CssClass="btn btn-red" runat="server" Text="Abrir Factura"
                                                 CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Edit" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea abrir esta factura?');"></asp:LinkButton>
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
    </asp:Panel>
</asp:Content>
