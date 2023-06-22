<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="Lab6.ViewCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Cart</title>
    <style>
        #container {
            padding: 50px;
            margin: auto;
            border-style: solid;
            border-width: thin;
            height: 237px;
            background-color: #C0C0C0;
            width: 258px;
            position: relative;
            text-align: center; 
        }
        #CartList{
            width: 100px;
            display: block;
            margin: 0 auto;
        }
        
        #button-container {
            margin-top: 20px; 
            display: block; 
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Cart</h1>
            <div>
                <asp:ListBox ID="CartList" runat="server"></asp:ListBox>
            </div>
            <div id="button-container">
                <asp:Button ID="ContinueShoppingButton" runat="server" Text="Shop" OnClick="ContinueShopping_Click" style="margin-right: 15px;"/>
                <asp:Button ID="EmptyCartButton" runat="server" Text="Empty" OnClick="EmptyCart_Click" style="margin-left: 15px;"/>
            </div>
        </div>
    </form>
</body>
</html>
