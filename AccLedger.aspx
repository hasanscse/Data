<%@ Page Title="" Language="C#" MasterPageFile="~/ASITNew.Master" AutoEventWireup="true" CodeBehind="AccLedger.aspx.cs" Inherits="RealERPWEB.F_81_Hrm.F_90_PF.AccLedger" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<script runat="server">


</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="RealProgressbar">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="30">
                    <ProgressTemplate>
                        <div id="loader">
                            <div class="dot"></div>
                            <div class="dot"></div>
                            <div class="dot"></div>
                            <div class="dot"></div>
                            <div class="dot"></div>
                            <div class="dot"></div>
                            <div class="dot"></div>
                            <div class="dot"></div>
                            <div class="lading"></div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>

            <div class="card card-fluid mb-1">
                <div class="card-body">
                    <div class="row mb-2" style="margin:5px 0px 5px 0px">
                        <div class="col-md-4 pading5px">
                            <asp:RadioButtonList ID="rbtnList1" runat="server" BackColor="#155273" ForeColor="White" CssClass="btn btn-primary checkBox"
                                RepeatColumns="6" RepeatDirection="Horizontal">
                                <asp:ListItem>With Narration</asp:ListItem>
                                <asp:ListItem>Without Narattion</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-2" style="margin-right:12px;">
                            <asp:Label ID="lblDate" runat="server" CssClass="control-label" Text="Date"></asp:Label>
                            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control form-control-sm" Height="35px"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server"
                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtDateFrom"></cc1:CalendarExtender>
                        </div>

                        <div class="col-md-2">
                            <asp:Label ID="lblDateto" runat="server" CssClass="smLbl_to" Text="To"></asp:Label>
                            <asp:TextBox ID="txtDateto" runat="server" CssClass="form-control form-control-sm" Height="35px"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtDateto_CalendarExtender" runat="server"
                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtDateto"></cc1:CalendarExtender>
                        </div>

                        <div class="col-md-3" Style="margin-right:10px";>
                            <asp:Label ID="lblcontrolAccHead" runat="server" CssClass="control-label" Text="Get Acc. Heads"></asp:Label>
                            <asp:LinkButton ID="IbtnSearchAcc" runat="server" OnClick="IbtnSearchAcc_Click"><i class="fa fa-search"> </i></asp:LinkButton>
                            <asp:DropDownList ID="ddlConAccHead" runat="server" CssClass="chzn-select form-control inputTxt">
                            </asp:DropDownList>
                        </div>

                       <div class="col-md-2">
                            <asp:LinkButton ID="lnkShowLedger" runat="server" CssClass="btn btn-sm btn-primary primaryBtn" Style="margin-top: 24px;" OnClick="lnkShowLedger_Click">Show</asp:LinkButton>
                       </div>
                    </div>
                </div>
            </div>

            <asp:Panel ID="Panel1" runat="server" Visible="false" >
                <div class="card card-fluid mb-1">
                    <div class="card-body">
                         <div class="row mb-3">
                             <div class="col-md-3">
                                 <asp:Label ID="lblcontrolAccResCode" runat="server" CssClass="control-label" Text="Get Resource Heads"></asp:Label>
                                 <asp:LinkButton ID="ibtnFindRes" runat="server" OnClick="ibtnFindRes_Click"><i class="fa fa-search"> </i></asp:LinkButton>
                                 <asp:DropDownList ID="ddlConAccResHead" runat="server" CssClass="chzn-select form-control inputTxt">
                                 </asp:DropDownList>
                                 <asp:Label ID="lblmsg" CssClass="btn-danger btn disabled" runat="server" Visible="false"></asp:Label>
                             </div>

                             <div class="col-md-2" Style="margin: 30px 0px 0px 5px;">
                                 <asp:CheckBox ID="chkqty" runat="server" CssClass="checkBox" Text="With qty" />
                             </div>
                         </div>
                    </div>
                </div>
            </asp:Panel>

            <div class="card card-fluid mb-1">
                <div class="card-body">
                    <div class="row">
                        <asp:GridView ID="dgv2" runat="server" AutoGenerateColumns="False"
                            CssClass="table table-striped table-hover table-bordered grvContentarea"
                            BorderWidth="2px" ShowFooter="True" Width="908px"
                            OnRowDataBound="dgv2_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Vou.Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgvvoudate" runat="server" CssClass="GridLebel"
                                            Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "voudat1")) %>' widht="80px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Voucher No.">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HLgvVounum1" runat="server" Width="80px" CssClass="GridLebel"
                                            Text='<%# (Convert.ToString(DataBinder.Eval(Container.DataItem, "cactcode")).Trim().Length==12 ? DataBinder.Eval(Container.DataItem, "vounum1") : DataBinder.Eval(Container.DataItem, "cactcode")) %>'
                                            Font-Underline="False" Target="_blank" __designer:wfdid="w1"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cheque/Ref #">
                                    <ItemTemplate>
                                        <asp:Label ID="lblChequeNo" runat="server" CssClass="GridLebelL"
                                            Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "refnum")) %>'
                                            Width="85px"></asp:Label>

                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldescription0" runat="server" CssClass="GridLebelL"
                                            Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "cactdesc")) + (Convert.ToString(DataBinder.Eval(Container.DataItem, "resdesc")).Trim().Length > 0? "<br>" + DataBinder.Eval(Container.DataItem, "resdesc"):"") + DataBinder.Eval(Container.DataItem, "venar1")  + DataBinder.Eval(Container.DataItem, "venar2") %>'
                                            Width="250px"></asp:Label>

                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qty">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgvtrnqty" runat="server" CssClass="GridLebel"
                                            Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "trnqty")).ToString("#,##0.00;(#,##0.00); ") %>'
                                            Width="70px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgvtrnrate" runat="server" CssClass="GridLebel"
                                            Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "trnrate")).ToString("#,##0.00;(#,##0.00); ") %>' Width="70px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Dr. Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgvDrAmount0" runat="server" CssClass="GridLebel"
                                            Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "dram")).ToString("#,##0;(#,##0); ") %>' Width="80px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cr. Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgvCrAmount0" runat="server" CssClass="GridLebel"
                                            Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "cram")).ToString("#,##0;(#,##0); ") %>' Width="80px"></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Balance Amt.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgvBalamt" runat="server" CssClass="GridLebel"
                                            Text='<%# Convert.ToDouble(DataBinder.Eval(Container.DataItem, "balamt")).ToString("#,##0;(#,##0); ") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle />
                            <EditRowStyle />
                            <SelectedRowStyle />
                            <PagerStyle CssClass="gvPagination" />
                            <HeaderStyle BackColor="#236fad" ForeColor="#ffffff" />
                            <AlternatingRowStyle BackColor="" />
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <script type="text/javascript" language="javascript">
                $(document).ready(function () {
                    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);
                });
                function pageLoaded() {
                    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true });
                }

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

