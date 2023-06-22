<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab3.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Primes by John Antony</title>
    <style>
        #mainFrame {
            background-color: #00FFFF;
            border-style: solid;
            border-width: 1px;
            margin: auto;
            width: 263px;
            padding: 10px;
            height: 297px;
        }
        
        #heading {
            text-align: center;
            
        }
        
        #listBox {
            position: relative;
            left: 98px;
            top: 10px;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mainFrame">
            <h1 id="heading">Primes</h1>
            <asp:ListBox ID="listBox" runat="server" Rows="10"></asp:ListBox>
        </div>
    </form>
</body>
</html>
