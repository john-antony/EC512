<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab5.Default" %>

<!DOCTYPE html>

<html>
<head>
    <title>Cast Your Vote</title>
    <style>
        body {
            
            background-color: #d2efcb;
        }
        #container {
            max-width: 200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #e7efe5;
            border: 1px solid #ddd;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 36px;
            text-align: center;
        }

        label {

            margin-bottom: 10px;
            font-size: 24px;
            padding: 5px;
        }

        input[type="submit"] {
            font-size: 14px;
            padding: 10px 15px;
            background-color: #7ba870;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        input[type="submit"]:hover {
            background-color: #54724c;
        }

         #lblError {
            color: red;
            margin-top: 20px;
            font-size: 18px;

         }
    </style>
</head>
<body>
    <h1>Cast Your Vote</h1>
    <form id="form1" runat="server">
        <div id="container">
                <asp:RadioButtonList ID="rbCandidates" runat="server" RepeatDirection="Vertical" DataSourceID="SqlDataSource1" 
                    DataTextField="CandidateName" DataValueField="Id" AutoPostBack="false" style="margin: 0 auto; display: block;">
                </asp:RadioButtonList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Candidate.mdf;Integrated Security=True"
                    SelectCommand="SELECT * FROM Candidates" UpdateCommand="UPDATE Candidates SET VoteCount = VoteCount + 1 WHERE Id = @CandidateId">
                    <UpdateParameters>
                        <asp:Parameter Name="CandidateId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            <div style="padding-top: 10px;">
                <asp:Button runat="server" Text="Vote" OnClick="btnVote_Click" />
            </div>
            <asp:Label ID="lblError" runat="server" />

        </div>
    </form>
</body>
</html>
