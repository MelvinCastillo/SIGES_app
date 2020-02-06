<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00036.aspx.cs" Inherits="CAID.HCL00036" %>

<%--Acto Médico: Intervención Terapia Conductual--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="lblEvaluacion">
                        <i class="icon-edit"></i>Intervención Terapéutica</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label" style="color: Red">
                                    Especialidad</label>
                                <div class="controls">
                                    <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%--Objetivo--%>
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label">
                                    <strong>Objetivo</strong></label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbObjetivo" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="_Show">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbObjetivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label">
                                    <strong>Intervención</strong></label>
                                <div class="controls">
                                    <div class="span6">
                                        <div class="box box-color box-bordered">
                                            <div class="box-title">
                                                <h3>Actividades
                                                </h3>
                                            </div>
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>

                                                            <th>Actividad
                                                            </th>

                                                            <th>Acciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="rpIntervencion" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <%# Eval("NOMBRE")%>
                                                                    </td>

                                                                    <td>

                                                                        <asp:LinkButton ID="bntSI" rel="tooltip" title="Hizo la actividad" CssClass="btn btn-green" runat="server"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Lo hizo" OnClick="_Save">
                                                        <i class="icon-thumbs-up"></i>
                                                                        </asp:LinkButton>

                                                                        <asp:LinkButton ID="btnNO" rel="tooltip" title="No hizo la actividad" CssClass="btn btn-red" runat="server"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="No lo hizo" OnClick="_Save">
                                                        <i class="icon-thumbs-down"></i>
                                                                        </asp:LinkButton>



                                                                        <asp:LinkButton ID="btnSIiConAyuda" rel="tooltip" title="Hizo la actividad con ayuda" CssClass="btn btn-orange" runat="server"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Hizo con ayuda" OnClick="_Save">
                                                        <i class="icon-minus"></i>
                                                                        </asp:LinkButton>

                                                                        <asp:LinkButton ID="btnND" rel="tooltip" title="No se realizó esta actividad" CssClass="btn btn-info" runat="server"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="No Realizada" OnClick="_Save">
                                                        <i class="icon-remove"></i>
                                                                        </asp:LinkButton>

                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span6">
                                        <div class="box box-color box-bordered green">
                                            <div class="box-title">
                                                <h3>Evaluación
                                                </h3>
                                            </div>
                                            <div class="box-content nopadding">
                                                <table class=" table table-bordered ">
                                                    <thead>
                                                        <tr>

                                                            <th>Actividad
                                                            </th>
                                                            <th>Evaluación
                                                            </th>

                                                            <th>Acciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="rpEvaluacion" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <%# Eval("NOMBREACTIVIDAD")%> 
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("RESULTADO")%> 
                                                                    </td>

                                                                    <td>
                                                                        <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' OnClick="_Remove">
                                                        <i class="icon-remove"></i>
                                                                        </asp:LinkButton>
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

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>Histórico</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <div class='form-horizontal form-bordered'>
                        <%--Objetivo--%>
                        <div class="control-group">
                            <label for="textfield" class="control-label">Objetivo</label>
                            <div class="controls">

                                <asp:DropDownList ID="cmbObjetivo2" runat="server" CssClass="select2-me input-block-level"
                                    data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="_ShowH">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo2" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="valcmbObjetivo2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                            </div>
                        </div>
                        <div class="control-group">


                            <div class="box-content nopadding">

                                <table class="table table-bordered dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">
                                    <thead>
                                        <tr>
                                            <th>Actividad
                                            </th>
                                            <th>Fecha
                                            </th>
                                            <th>Evaluación
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpHistorico" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("ACTIVIDAD")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("FECHA")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("RESULTADO")%>
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
        </div>
    </div>



</asp:Content>
