<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00044.aspx.cs" Inherits="CAID.HCL00044" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
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
                        <i class="icon-edit"></i>Evaluación Multidisciplinaria</h3>
                    <div class="actions">
                        <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <a href="#" class="btn content-slideUp"><i class="icon-angle-down"></i></a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group">
                                <label for="cmbTipo" class="control-label" style="color: red; font-size: small;">
                                    <strong>Especialidad</strong></label>
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

                            <%--PREOCUPACIONES/DEMANDAS DE LA FAMILIA--%>
                            <div class="control-group">
                                <label for="ckPreocupaciones" class="control-label">
                                    Preocupaciones / Demandas de la Familia</label>
                                <div class="controls" style="text-align: left; text-align: center;">

                                    <asp:CheckBoxList ID="ckPreocupaciones" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                            <%-- Impresión Diagnostica--%>
                            <div class="control-group">
                                <label for="txtAntecFam" class="control-label">
                                    Impresión Diagnóstica</label>
                                <div class="controls">
                                    <input runat="server" name="txtImpresionDiagnostica" id="txtImpresionDiagnostica" type="text" class="input-block-level">
                                </div>
                            </div>

                            <%-- CRITERIOS DIAGNÓSTICOS DE INCLUSIÓN AL CAID --%>
                            <div class="control-group">
                                <label for="cmbCriterios" class="control-label">
                                    Criterios diagnósticos de inclusión al CAID</label>
                                <div class="controls">
                                    <select runat="server" id="cmbCriterios" name="cmbCriterios" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Si">Si</option>
                                        <option value="No">No</option>
                                        <option value="En duda">En duda</option>
                                    </select>

                                </div>
                            </div>

                            <%--PLAN--%>
                            <div class="control-group">
                                <label for="ckPlan" class="control-label">
                                    Plan</label>
                                <div class="controls" style="text-align: left; text-align: center;">

                                    <asp:CheckBoxList ID="ckPlan" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                            <%--Observaciones--%>
                            <div class="control-group">
                                <label for="ckPlan" class="control-label">
                                    Observaciones</label>
                                <div class="controls">

                                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px"
                                        Wrap="true" placeholder="Observaciones" CssClass="input-block-level"></asp:TextBox>


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
                    <h3>Profesionales presentes en la evaluación</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>

                            <%-- cmb Origen Tratamiento --%>
                            <div class="control-group">
                                <label for="cmbServicioID" class="control-label">
                                    Servicio</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbServicioID" runat="server" CssClass="select2-me input-block-level"
                                        AutoPostBack="True" OnSelectedIndexChanged="cmbServicioID_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <%-- cmbTerapista --%>
                            <div class="control-group">
                                <label for="cmbTerapista" class="control-label">
                                    Especialista</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbTerapista" runat="server" CssClass="select2-me input-block-level">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <%-- Detalles de profesionales --%>
                            <div class="control-group">

                                <div class="controls">

                                    <button type="button" id="btnDetalles" runat="server" onserverclick="_SaveDetalles2"
                                        class="btn btn-green" validationgroup="pnlData">
                                        <i class="icon-arrow-down"></i>&nbsp Agregar
                                    </button>

                                </div>
                            </div>

                            <div class="control-group">
                                <div class="box-content nopadding">
                                </div>
                                <table class="table table-hover table-nomargin table-bordered dataTable-scroll-x dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">
                                    <thead>
                                        <tr>
                                            <th>Especialidad
                                            </th>
                                            <th>Profesional
                                            </th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpDetallesProfesionales" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("NOMBREESPECIALIDAD")%>
                                                            
                                                    </td>
                                                    <td>
                                                        <%# Eval("NOMBREESPECIALISTA")%>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnDeleteDet" CssClass="btn btn-red" runat="server"
                                                            CommandArgument='<%# Eval("ROWGUID")%>' OnClick="_RemoveProfesional">
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
</asp:Content>
