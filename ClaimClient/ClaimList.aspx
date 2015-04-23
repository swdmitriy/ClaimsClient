<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimList.aspx.cs" Inherits="ClaimClient.ClaimList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
    </style>
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
        <div class="listHeader"><strong>Отчет по заявкам</strong></div>  
        <div></div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Bold="False" Font-Names="Tahoma" ShowHeader="false">
            <Columns>
                <asp:BoundField DataField="ClaimId" HeaderText="Номер заявки" ReadOnly="True" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="StatusDate" HeaderText="Дата изменения статуса" ReadOnly="True" DataFormatString="{0:d}" >
                <ItemStyle Width="270px" />
                </asp:BoundField>
                <asp:BoundField DataField="StatusName" HeaderText="Статус" ReadOnly="True" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="CitizenName" HeaderText="ФИО заявителя" ReadOnly="True" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle Font-Bold="False" />
            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
