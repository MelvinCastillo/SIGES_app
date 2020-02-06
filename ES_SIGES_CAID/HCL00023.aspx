<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00023.aspx.cs" Inherits="CAID.HCL00023" %>

<%--Acto Médico: Anamnesis--%>
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
            <div class="box box-condensed">
                <div class="box-title">
                    <h3>
                        <i class="icon-reorder"></i>
                        Asignación de Objetivos y Actividades/Estrategias
                    </h3>

                </div>

                <div class="box-content nopadding">
                    <div class='form-horizontal form-striped'> 
                        <%-- Paciente --%>
                        <div class="control-group">
                            <label for="txtNombre" class="control-label">
                                Record No.</label>
                            <div class="controls">
                               <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                    validationgroup="pnlSearch">
                                    <i class="icon-search"></i>&nbsp Buscar Record</button>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="cmbPaciente" class="control-label" style="color: Red">
                                Paciente</label>
                            <div class="controls">
                                <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                    data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                            </div>
                        </div>

                        <%--Especialidad--%>
                        <div class="control-group">
                            <label for="cmbTipo" class="control-label">
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

                        <%--Tipo--%>
                        <div class="control-group">
                            <label for="cmbTipoOBJ" class="control-label">
                                <strong>Área</strong></label>
                            <div class="controls">
                                <asp:DropDownList ID="cmbTipoOBJ" runat="server" CssClass="select2-me input-block-level"
                                    data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="_FillObj">
                                </asp:DropDownList>

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


                                                <asp:Repeater ID="rpActividades" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Eval("NOMBRE")%>
                                                            </td>

                                                            <td>


                                                                <asp:LinkButton ID="bntSave" CssClass="btn btn-green" runat="server"
                                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName='<%# Eval("NOMBRE")%>' OnClick="_Save">
                                                        <i class="icon-ok"></i>
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
                                        <h3>Agregadas al Plan
                                        </h3>
                                    </div>
                                    <div class="box-content nopadding">
                                        <table class=" table table-bordered ">
                                            <thead>
                                                <tr>

                                                    <th>Actividad
                                                    </th>
                                                    <th>Acciones
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpAsignadas" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Eval("NOMBRE")%> 
                                                            </td>

                                                            <td>
                                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server"
                                                                    CommandArgument='<%# Eval("ROWGUID")%>' OnClick="_DeleteActividad">
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




</asp:Content>













