<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00034.aspx.cs" Inherits="CAID.HCL00034" %>

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
                        <i class="icon-edit"></i>Servicio de Intervención Grupal</h3>
                    <ul class="tabs">
                        <li class="active"><a href="#t1" data-toggle="tab">Intervención</a> </li>
                        <li><a href="#t2" data-toggle="tab">Agenda</a> </li>
                    </ul>
                </div>
                <div class="box-content">
                    <div class="tab-content">
                      <div class="tab-pane active" id="t1">
                            <div class="nopadding">
                                <div class='form-horizontal'>
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
                                    <%-- Objetivo --%>
                                    <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Objetivo</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>

                                    <%-- Citados --%>
                                    <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Paciente</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="cmbCitados" runat="server" 
                                                CssClass='select2-me input-block-level' AutoPostBack="True" 
                                                onselectedindexchanged="cmbCitados_SelectedIndexChanged">
                                            </asp:DropDownList>

                                           
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbCitados" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <div class="box box-bordered">
                                            <div class="control-group">
                                                <label for="cmbObjetivo" class="control-label">
                                                    Participantes</label>
                                                <div class="controls">
                                                    <asp:TextBox ID="txtDATOS1" runat="server" TextMode="MultiLine" Height="200px" ValidationGroup="pnlData"
                                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="txtDATOS1" Display="Dynamic" ErrorMessage="Requerido!"
                                                        ForeColor="Red" ID="txtDATOS1val" runat="server" SetFocusOnError="True" />
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label for="cmbObjetivo" class="control-label">
                                                    Comentarios</label>
                                                <div class="controls">
                                                    <asp:TextBox ID="txtDATOS2" runat="server" TextMode="MultiLine" Height="200px" ValidationGroup="pnlData"
                                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="txtDATOS2" Display="Dynamic" ErrorMessage="Requerido!"
                                                        ForeColor="Red" ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                          <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                            validationgroup="pnlData" style="width: 128px; height: 48px">
                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="t2">
                            <div class="nopadding">
                                <table class="table table-bordered dataTable-scroll-x dataTable-tools">
                                    <thead>
                                        <tr>
                                            <th>
                                                Horario
                                            </th>
                                            <th>
                                                Lunes
                                            </th>
                                            <th>
                                                Martes
                                            </th>
                                            <th>
                                                Miércoles
                                            </th>
                                            <th>
                                                Jueves
                                            </th>
                                            <th>
                                                Viernes
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpData" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Convert.ToDateTime( Eval("HORAINI")).ToString("hh:mm tt") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("LUNES")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("MARTES")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("MIERCOLES")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("JUEVES")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("VIERNES")%>
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
