<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab6.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Store by John Antony</title>
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
        #ItemList{
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
            <div class="header">
                <h1>Store</h1>
            </div>
            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Items.mdf;Integrated Security=True" SelectCommand="SELECT [ItemName] FROM [Item]"></asp:SqlDataSource>
                <asp:ListBox ID="ItemList" runat="server" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemName"></asp:ListBox>
                <div id="button-container">
                    <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" OnClick="AddToCartButton_Click" style="margin-right: 15px;"/>
                    <asp:Button ID="ViewCartButton" runat="server" Text="View Cart" OnClick="ViewCartButton_Click" style="margin-left: 15px;"/>
                </div>
                <br />
                <asp:Label ID="StatusLabel" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>