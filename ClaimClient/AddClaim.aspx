<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddClaim.aspx.cs" Inherits="ClaimClient.AddClaimForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 451px;
            height: 22px;
        }
        .auto-style2 {
            font-size: large;
            color: #000099;
            font-family: Tahoma;
        }
        .новыйСтиль2 {
            font-family: Tahoma;
        }
        .auto-style6 {
            font-family: Tahoma;
            width: 136px;
            height: 22px;
        }
        .auto-style7 {
            width: 451px;
        }
        .popupdiv{background-color:ivory;border:solid 1px skyblue;width:250px;display:block}
        .popupbg{background-color:gray; filter: alpha(opacity=60); opacity:0.60}
        .hidelbl{display:none;}
    </style>    
    <link href="ClaimStyles.css" rel="stylesheet" type="text/css" />
</head>

<body>
    
    
    <form id="form1" runat="server">
    
   
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>
    <div>         
        <table class="addClaimHeader" style="border-spacing: 0">
            <tr>
                <td class="addClaimHeader" style="width: 200px;"><a href="AddClaim" class="anchor_div">Новая заявка</a></td>
                <td class="infoHeader" style="width: 200px;"><a href="ClaimInfo" class="anchor_div">Узнать статус заявки</a></td>
                <td class="listHeader" style="width: 200px;"><a href="ClaimList" class="anchor_div">Отчет по заявкам</a></td>
            </tr>
        </table>
    <div class="addClaimHeader"><strong  >Регистрация заявки</strong></div>
    <table class="table1">
        <tr>
            <td class="auto-style6" >
                Фамилия:</td>
            <td class="auto-style1">
                <asp:TextBox ID="LastNameTextBox" runat="server" Width="283px" MaxLength="50"></asp:TextBox>
               </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Имя:</td>
            <td class="auto-style7">
                <asp:TextBox ID="FirstNameTextBox" runat="server" Width="283px" MaxLength="50"></asp:TextBox>
              </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Отчество:</td>
            <td class="auto-style7">
                <asp:TextBox ID="SecondNameTextBox" runat="server" Width="283px" MaxLength="50"></asp:TextBox>
               </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Адрес:</td>
            <td class="auto-style7">
                <asp:TextBox ID="AddressTextBox" runat="server" Width="283px" MaxLength="200"></asp:TextBox>
               </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Серия паспорта:</td>
            <td class="auto-style7">
                <asp:TextBox ID="PassSeriesTextBox" runat="server" Width="114px" MaxLength="4"></asp:TextBox>
                 </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Номер паспорта:</td>
            <td class="auto-style7">
                <asp:TextBox ID="PassNumberTextBox" runat="server" Width="114px" MaxLength="6"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Дата выдачи паспорта:</td>
            <td class="auto-style7">
                <asp:TextBox ID="PassDateDDTextBox" runat="server" Width="38px" MaxLength="2"></asp:TextBox>
               <asp:DropDownList ID="PassDateMMDropDownList" runat="server">
                    <asp:ListItem>Январь</asp:ListItem>
                    <asp:ListItem>Февраль</asp:ListItem>
                    <asp:ListItem>Март</asp:ListItem>
                    <asp:ListItem>Апрель</asp:ListItem>
                    <asp:ListItem>Май</asp:ListItem>
                    <asp:ListItem>Июнь</asp:ListItem>
                    <asp:ListItem>Июль</asp:ListItem>
                    <asp:ListItem>Август</asp:ListItem>
                    <asp:ListItem>Сентябрь</asp:ListItem>
                    <asp:ListItem>Октябрь</asp:ListItem>
                    <asp:ListItem>Ноябрь</asp:ListItem>
                    <asp:ListItem>Декабрь</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="PassDateYYYYTextBox" runat="server" Width="83px" MaxLength="4"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Кем выдан:</td>
            <td class="auto-style7">
                <asp:TextBox ID="PassAgencyTextBox" runat="server" Width="283px" MaxLength="200"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style6">
                 СНИЛС:</td>
            <td class="auto-style7">
                <asp:TextBox ID="TpinTextBox" runat="server" Width="283px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style2">
                <asp:Button ID="AddClaimButton" runat="server" OnClick="Button1_Click1" style="text-align: center" Text="Зарегистрировать заявку" Width="536px" Font-Bold="True" Font-Names="Tahoma" Font-Size="Medium" />
            </td>
            
        </tr>
        <tr>
             <td colspan="2" class="auto-style2">
                 <asp:Label ID="ClaimIdLabel" runat="server" style="text-align: left"  Font-Bold="True" Font-Names="Tahoma" Font-Size="Medium" Height="28px"></asp:Label>
            </td>
        </tr>
    </table>
  
   
   
    <!--маски для контролов ввода-->
    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server" TargetControlID="PassSeriesTextBox"  Mask="9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"  OnInvalidCssClass="MaskedEditError" MaskType="Number" Enabled="True" UserDateFormat="None" PromptCharacter=" " />
    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender5" runat="server" TargetControlID="PassNumberTextBox"  Mask="999999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"  OnInvalidCssClass="MaskedEditError" MaskType="Number" Enabled="True" UserDateFormat="None" PromptCharacter=" " />        
    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server" TargetControlID="TpinTextBox"  Mask="999-999-999 99" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"  OnInvalidCssClass="MaskedEditError" MaskType="Number" Enabled="True" UserDateFormat="None" PromptCharacter="_" />
    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="PassDateDDTextBox"  Mask="99" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"  OnInvalidCssClass="MaskedEditError" MaskType="Number" Enabled="True" UserDateFormat="None" PromptCharacter=" " />
    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" TargetControlID="PassDateYYYYTextBox"  Mask="9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"  OnInvalidCssClass="MaskedEditError" MaskType="Date" Enabled="True" UserDateFormat="None" PromptCharacter=" " />
 
              
   
  
          
    </div>
   
    </form>
</body>
</html>
