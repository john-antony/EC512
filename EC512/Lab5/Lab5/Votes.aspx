<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Votes.aspx.cs" Inherits="Lab5.Votes" %>

<!DOCTYPE html>
<html>
<head>
    <title>Vote Results</title>
    <style>
        body {
            
            background-color: #c0dce9;
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
            text-align: center;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 100%;
            max-width: 600px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 2px solid #7e9ead;
        }

        th {
            background-color: #7e9ead;
            color: white;
        }

        input[type="submit"] {
            font-size: 14px;
            padding: 10px 15px;
            background-color: #9cc6d9;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        input[type="submit"]:hover {
            background-color: #7e9ead;
        }
    </style>
</head>
<body>
    <h1>Thank you for voting!</h1>
    <form id="form1" runat="server">
        <div id="container" style="display: flex; flex-direction: column; align-items: center;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Candidate.mdf;Integrated Security=True" 
    SelectCommand="SELECT CandidateName, VoteCount FROM Candidates ORDER BY VoteCount DESC"></asp:SqlDataSource>
            <table>
                <tr>
                    <th>Candidate</th>
                    <th>Votes</th>
                </tr>
                <asp:ListView ID="lvCandidates" runat="server" ItemPlaceholderID="trCandidates" DataSourceID="SqlDataSource1">
                    <LayoutTemplate>
                        <tbody>
                            <asp:PlaceHolder ID="trCandidates" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("CandidateName") %></td>
                            <td><%# Eval("VoteCount") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </table>
            <asp:Button ID="btnReturn" runat="server" Text="Return to Voting Page" OnClick="btnReturn_Click"/>

        </div>
    </form>
</body>
</html>
