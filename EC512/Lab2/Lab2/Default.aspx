<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 2 - John Antony's Hexadecimal Converter</title>
</head>
<body>
    <form runat="server">
        <div style="width: 400px; margin: auto; border-style: solid; background-color: #bbe6b9">
            <h1 style="text-align:center;">Hexadecimal Conversion Tool</h1>
            <div style="display: flex; justify-content: space-between; text-align: center; padding-left: 10px">
                <div>
                    <label for="decInput">Decimal:</label>
                    <asp:TextBox ID="decInput" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="hexInput">Hexadecimal:</label>
                    <asp:TextBox ID="hexInput" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />
            <div style="text-align: center;">
                <asp:Label ID="errorLabel" runat="server" ForeColor="Red" BackColor="White"></asp:Label>
            </div>
            <br />
            <div style="padding: 10px; text-align: center;">
                <asp:Button ID="convertBtn" runat="server" Text="Convert" OnClick="convertBtn_Click" />
                <asp:Button ID="clearBtn" runat="server" Text="Clear" OnClick="clearBtn_Click" />
            </div>
        </div>
    </form>
</body>
</html>
