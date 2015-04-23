<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimInfo.aspx.cs" Inherits="ClaimClient.ClaimInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="ClaimStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>        
        <table class="addClaimHeader" style="border-spacing: 0">
            <tr>
                <td class="addClaimHeader" style="width: 200px;"><a href="AddClaim" class="anchor_div">Новая заявка</a></td>
                <td class="infoHeader" style="width: 200px;"><a href="ClaimInfo" class="anchor_div">Узнать статус заявки</a></td>
                <td class="listHeader" style="width: 200px;"><a href="ClaimList" class="anchor_div">Отчет по заявкам</a></td>
            </tr>
        </table>
    <div class="infoHeader"><strong  >Информация о заявке</strong></div>
    
    </div>
        <br />
        <div>Номер заявки: <asp:TextBox ID="itemIdTextBox" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="itemIdTextBox" Display="Dynamic" ErrorMessage="Необходимо ввести номер заявки" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="itemIdTextBox" Display="Dynamic" ErrorMessage="Номер заявки состоит только из цифр (0-9)" ValidationExpression="^[0-9]+$" ValidationGroup="AllValidators">Недопустимый номер заявки</asp:RegularExpressionValidator></div>
        <div><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Узнать статус" Font-Bold="True" Font-Names="Tahoma" ValidationGroup="AllValidators" Width="206px" /><br /></div>
        <br />
        <div style="width:470px; display: block; text-align:center;"><asp:Label ID="ResultLabel" runat="server" Text="Label"></asp:Label></div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="false">
            <Columns>
                <asp:BoundField DataField="statusDate" DataFormatString="{0:d}">
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="StatusName">
                <HeaderStyle Height="0px" />
                <ItemStyle Width="270px" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle Height="0px" />
        </asp:GridView>
    </form>
</body>
</html>
