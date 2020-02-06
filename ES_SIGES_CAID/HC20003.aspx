<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HC20003.aspx.cs" Inherits="CAID.HC20003" %>

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
            <div class="span8">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Revisión por Sistemas</h3>
                    </div>
                    <div class="box-content">
                        <div class='form-vertical'>                            
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Sistema Constitucional</label>
                                <div class="controls">
                                    <div class="span1">
                                        <div class="check-demo-col">
                                            <div class="check-line">
                                                <input type="checkbox" id="Checkbox1" class='icheck-me' data-skin="square" data-color="blue">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span11">
                                        <asp:TextBox ID="txtSISTEMA1" runat="server" TextMode="MultiLine" Height="70px" Wrap="true"
                                            placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Sistema Nervioso</label>
                                <div class="controls">
                                    <div class="span1">
                                        <div class="check-demo-col">
                                            <div class="check-line">
                                                <input type="checkbox" id="Checkbox2" class='icheck-me' data-skin="square" data-color="blue">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span11">
                                        <asp:TextBox ID="txtSISTEMA2" runat="server" TextMode="MultiLine" Height="70px" Wrap="true"
                                            placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Sistema Cardio-Pulmonar</label>
                                <div class="controls">
                                    <div class="span1">
                                        <div class="check-demo-col">
                                            <div class="check-line">
                                                <input type="checkbox" id="Checkbox3" class='icheck-me' data-skin="square" data-color="blue">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span11">
                                        <asp:TextBox ID="txtSISTEMA3" runat="server" TextMode="MultiLine" Height="70px" Wrap="true"
                                            placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Sistema Gastrointestinal</label>
                                <div class="controls">
                                    <div class="span1">
                                        <div class="check-demo-col">
                                            <div class="check-line">
                                                <input type="checkbox" id="Checkbox4" class='icheck-me' data-skin="square" data-color="blue">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span11">
                                        <asp:TextBox ID="txtSISTEMA4" runat="server" TextMode="MultiLine" Height="70px" Wrap="true"
                                            placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Sistema Genito-Urinario</label>
                                <div class="controls">
                                    <div class="span1">
                                        <div class="check-demo-col">
                                            <div class="check-line">
                                                <input type="checkbox" id="Checkbox5" class='icheck-me' data-skin="square" data-color="blue">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span11">
                                        <asp:TextBox ID="txtSISTEMA5" runat="server" TextMode="MultiLine" Height="70px" Wrap="true"
                                            placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Sistema Musculo-Esquelético</label>
                                <div class="controls">
                                    <div class="span1">
                                        <div class="check-demo-col">
                                            <div class="check-line">
                                                <input type="checkbox" id="Checkbox6" class='icheck-me' data-skin="square" data-color="blue">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span11">
                                        <asp:TextBox ID="txtSISTEMA6" runat="server" TextMode="MultiLine" Height="70px" Wrap="true"
                                            placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Sistema Piel y Tegmentario</label>
                                <div class="controls">
                                    <div class="span1">
                                        <div class="check-demo-col">
                                            <div class="check-line">
                                                <input type="checkbox" id="Checkbox7" class='icheck-me' data-skin="square" data-color="blue">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span11">
                                        <asp:TextBox ID="txtSISTEMA7" runat="server" TextMode="MultiLine" Height="70px" Wrap="true"
                                            placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                                <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                                    Regresar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span4">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <h3>
                                <i class="icon-table"></i>Histórico</h3>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <div class="box-content nopadding">
                                <%--<table class="table table-hover table-nomargin dataTable table-bordered">--%><table class="table table-bordered dataTable dataTable-scroll-x">
                                    <thead>
                                        <tr>
                                            <th>
                                                Fecha
                                            </th>
                                            <th class="hidden-1024">
                                                Detalles
                                            </th>
                                            <th class="hidden-1024">
                                                Usuario
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="_Historico" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FECHA")%>' CommandArgument='<%# Eval("ID")%>'
                                                            CommandName="History" OnClick="_Select"></asp:LinkButton>
                                                        </th>
                                                        <td class="hidden-1024">
                                                            <%# Eval("DETALLES")%>
                                                        </td>
                                                        <td class="hidden-1024">
                                                            <%# Eval("USUARIO")%>
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
