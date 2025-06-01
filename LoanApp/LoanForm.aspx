<%@ Page Title="" Language="C#" MasterPageFile="~/Loan.Master" AutoEventWireup="true" CodeBehind="LoanForm.aspx.cs" Inherits="LoanApp.LoanForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Full Name:</td>
            <td>
                <asp:TextBox ID="LoanFullName" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Date of Birth:</td>
            <td>
                <asp:TextBox ID="LoanDOB" runat="server" TextMode="Date" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
                <asp:DropDownList ID="LoanGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>
                <asp:TextBox ID="LoanEmail" runat="server" TextMode="Email" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td>
                <asp:TextBox ID="LoanPhone" runat="server" TextMode="Phone" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Address:</td>
            <td>
                <asp:TextBox ID="LoanAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Employment Type:</td>
            <td>
                <asp:DropDownList ID="LoanEmploymentType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Employment Type" Value="" />
                    <asp:ListItem Text="Salaried" Value="Salaried" />
                    <asp:ListItem Text="Self-Employed" Value="SelfEmployed" />
                    <asp:ListItem Text="Unemployed" Value="Unemployed" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Company Name:</td>
            <td>
                <asp:TextBox ID="LoanCompany" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Monthly Income:</td>
            <td>
                <asp:TextBox ID="LoanIncome" runat="server" TextMode="Number" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>Loan Type:</td>
            <td>
                <asp:DropDownList ID="LoanType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Loan Type" Value="" />
                    <asp:ListItem Text="Personal Loan" Value="Personal" />
                    <asp:ListItem Text="Home Loan" Value="Home" />
                    <asp:ListItem Text="Car Loan" Value="Car" />
                    <asp:ListItem Text="Education Loan" Value="Education" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Loan Amount:</td>
            <td>
                <asp:TextBox ID="LoanAmount" runat="server" TextMode="Number" CssClass="form-control" />
            </td>
        </tr>

    </table>

</asp:Content>
