<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab4.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>John Antony's Currency Converter</title>
    <style>
        body {
            
            background-color: #d2efcb;
        }
        #container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #e7efe5;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        h1 {
            font-size: 36px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-top: 0;
        }
        label {
            font-size: 18px;
            font-weight: bold;
            color: #666;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], select {
            font-size: 18px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
            margin-bottom: 20px;
        }
        input[type="button"] {
            font-size: 18px;
            padding: 10px 20px;
            background-color: #7ba870;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            
        }
        input[type="button"]:hover {
            background-color: #54724c;
        }
        #result {
            font-size: 24px;
            font-weight: bold;
            color: #54724c;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container" style="display: flex; flex-direction: column; align-items: center;">
            <h1>Currency Converter</h1>
            <div style="text-align: center">
                <label for="ddlCurrency">Currency:</label>
                <asp:DropDownList ID="ddlCurrency" runat="server"></asp:DropDownList>
            </div>
            <div style="text-align: center">
                <label for="txtAmount">Amount:</label>
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            </div>
            <div style="display: flex; justify-content: center;">
                <input type="button" value="To USD" onclick="toUSD()" />
                <input type="button" value="From USD" onclick="fromUSD()" />
            </div>
            <div id="result">
                <label for="lblResult">Result:</label>
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </div>
        </div>
    </form>
<script>
    function toUSD() {
        var amount = document.getElementById('<%= txtAmount.ClientID %>').value.trim();
        if (!/^\d*\.?\d+$/.test(amount)) {
            document.getElementById('<%= lblResult.ClientID %>').innerHTML = "Please enter a valid decimal value";
            document.getElementById('<%= lblResult.ClientID %>').style.color = "red";
            return;
        }
        amount = parseFloat(amount);
        var rate = parseFloat(document.getElementById('<%= ddlCurrency.ClientID %>').value);
        var result = amount / rate;
        document.getElementById('<%= lblResult.ClientID %>').innerHTML = result.toFixed(2) + " USD";
        document.getElementById('<%= lblResult.ClientID %>').style.color = "#54724c";
    }

    function fromUSD() {
        var amount = document.getElementById('<%= txtAmount.ClientID %>').value.trim();
        if (!/^\d*\.?\d+$/.test(amount)) {
            document.getElementById('<%= lblResult.ClientID %>').innerHTML = "Please enter a valid decimal value";
            document.getElementById('<%= lblResult.ClientID %>').style.color = "red";
            return;
        }
        amount = parseFloat(amount);
        var rate = parseFloat(document.getElementById('<%= ddlCurrency.ClientID %>').value);
        var result = amount * rate;
        document.getElementById('<%= lblResult.ClientID %>').innerHTML = result.toFixed(2) + " " + document.getElementById('<%= ddlCurrency.ClientID %>').options[document.getElementById('<%= ddlCurrency.ClientID %>').selectedIndex].text;
        document.getElementById('<%= lblResult.ClientID %>').style.color = "#54724c";
    }
</script>
</body>
</html>