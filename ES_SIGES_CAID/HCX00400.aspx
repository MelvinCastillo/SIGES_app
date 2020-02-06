<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCX00400.aspx.cs" Inherits="CAID.HCX00400" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    
                        
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
                            <i class="icon-table"></i>CONSULTAS EXTERNAS
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Paciente
                                    </th>
                                    <th class="hidden-480">
                                        Fecha
                                    </th>
                                    <th style="width: 1%;">
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("NOMBRE")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("ROWCDTE")).ToString("dd-MM-yyyy")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
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
    <%--Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
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
                        <h3>
                            <i class="icon-edit"></i>Registro de Consultas Externas</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                            AutoPostBack="true" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Objetivo --%>
                                <div class="control-group">
                                    <label for="cmbObjetivo" class="control-label" style="color: Red">
                                        Objetivo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="1">-- NINGUNO --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator7" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- EVOLUCION--%>
                                <div class="control-group">
                                    <label for="txtEvolucion" class="control-label" style="color: Red">
                                        Evolución</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtEvolucion" TextMode="MultiLine" Height="100px" CssClass="input-block-level"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtEvolucion" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- DIAGNOSTICO 1--%>
                                <div class="control-group">
                                    <label for="cmbDiagnostico" class="control-label" style="color: Red">
                                        Diagnóstico</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbDiagnostico" name="cmbDiagnostico" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="1">-- NINGUNO --</option>
                                        </select>
                                        <br />
                                        <asp:TextBox ID="txtDiagnostico" TextMode="MultiLine" Height="100px" CssClass="input-block-level"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbDiagnostico" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valcmbDiagnostico" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- LABORATORIOS--%>
                                <div class="control-group">
                                    <label for="txtLaboratorios" class="control-label" style="color: Red">
                                        Analíticas de Laboratorios</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbLaboratorios" name="cmbLaboratorios" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                            <option value="1">-- NINGUNO --</option>
                                        </select>
                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_Save" class="btn btn-green"
                                            validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                        <br />
                                        <asp:TextBox ID="txtLaboratorios" TextMode="MultiLine" Height="100px" CssClass="input-block-level"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtLaboratorios" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- IMAGENES--%>
                                <div class="control-group">
                                    <label for="txtImagenes" class="control-label" style="color: Red">
                                        Estudios de Imágenes</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbImagenes" name="cmbImagenes" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                            <option value="1">-- NINGUNO --</option>
                                        </select>
                                        <button type="button" id="Button1" runat="server" onserverclick="_Save" class="btn btn-green"
                                            validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                        <br />
                                        <asp:TextBox ID="txtImagenes" TextMode="MultiLine" Height="100px" CssClass="input-block-level"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtImagenes" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator4" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- RECETA--%>
                                <div class="control-group">
                                    <label for="txtReceta" class="control-label" style="color: Red">
                                        Indicaciones</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbReceta" name="cmbReceta" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                            <option value="1">-- NINGUNO --</option>
                                        </select>
                                        <button type="button" id="Button2" runat="server" onserverclick="_Save" class="btn btn-green"
                                            validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                        <br />
                                        <asp:TextBox ID="txtReceta" TextMode="MultiLine" Height="100px" CssClass="input-block-level"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtReceta" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
