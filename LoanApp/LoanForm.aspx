<%@ Page Title="" Language="C#" MasterPageFile="~/Loan.Master" AutoEventWireup="true" CodeBehind="LoanForm.aspx.cs" Inherits="LoanApp.LoanForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            width: 90%;
            margin: auto;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            padding: 8px 12px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

            .btn-submit:hover {
                background-color: #218838;
            }

        .gridview-container {
            margin-top: 40px;
            overflow-x: auto;
        }

        .asp-grid {
            width: 100%;
            min-width: 1000px;
            border-collapse: collapse;
        }

            .asp-grid th, .asp-grid td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: left;
            }

            .asp-grid th {
                background-color: #343a40;
                color: white;
            }

            .asp-grid tr:nth-child(even) {
                background-color: #f2f2f2;
            }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel CssClass="form-container" runat="server">
        <div class="form-title">Loan Application Form</div>

        <div class="form-group">
            <label class="form-label">Full Name:</label>
            <asp:TextBox ID="LoanFullName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanFullName" runat="server" ErrorMessage="Required Name" ControlToValidate="LoanFullName" Display="None"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label class="form-label">Date of Birth:</label>
            <asp:TextBox ID="LoanDOB" runat="server" TextMode="Date" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanDOB" runat="server"
                ErrorMessage="Date of Birth is required" ControlToValidate="LoanDOB"
                Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Gender:</label>
            <asp:DropDownList ID="LoanGender" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Gender" Value="0" />
                <asp:ListItem Text="Male" Value="1" />
                <asp:ListItem Text="Female" Value="2" />
                <asp:ListItem Text="Other" Value="3" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfLoanGender" runat="server"
                ErrorMessage="Gender is required" ControlToValidate="LoanGender"
                InitialValue="" Display="None" ValidationGroup="LoanForm" />

        </div>

        <div class="form-group">
            <label class="form-label">Email:</label>
            <asp:TextBox ID="LoanEmail" runat="server" TextMode="Email" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanEmail" runat="server"
                ErrorMessage="Email is required" ControlToValidate="LoanEmail"
                Display="None" ValidationGroup="LoanForm" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                ControlToValidate="LoanEmail"
                ErrorMessage="Invalid Email Format"
                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Phone:</label>
            <asp:TextBox ID="LoanPhone" runat="server" TextMode="Phone" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanPhone" runat="server"
                ErrorMessage="Phone is required" ControlToValidate="LoanPhone"
                Display="None" ValidationGroup="LoanForm" />
            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                ControlToValidate="LoanPhone"
                ErrorMessage="Invalid Phone Number"
                ValidationExpression="^\d{10}$"
                Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Address:</label>
            <asp:TextBox ID="LoanAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanAddress" runat="server"
                ErrorMessage="Address is required" ControlToValidate="LoanAddress"
                Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Employment Type:</label>
            <asp:DropDownList ID="LoanEmploymentType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Employment Type" Value="0" />
                <asp:ListItem Text="Salaried" Value="1" />
                <asp:ListItem Text="Self-Employed" Value="2" />
                <asp:ListItem Text="Unemployed" Value="3" />



            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfLoanEmploymentType" runat="server"
                ErrorMessage="Employment type is required" ControlToValidate="LoanEmploymentType"
                InitialValue="" Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Company Name:</label>
            <asp:TextBox ID="LoanCompany" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanCompany" runat="server"
                ErrorMessage="Company name is required" ControlToValidate="LoanCompany"
                Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Monthly Income:</label>
            <asp:TextBox ID="LoanIncome" runat="server" TextMode="Number" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanIncome" runat="server"
                ErrorMessage="Monthly income is required" ControlToValidate="LoanIncome"
                Display="None" ValidationGroup="LoanForm" />
            <asp:RegularExpressionValidator ID="revIncome" runat="server"
                ControlToValidate="LoanIncome"
                ErrorMessage="Invalid Income Format"
                ValidationExpression="^\d+(\.\d{1,2})?$"
                Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Loan Type:</label>
            <asp:DropDownList ID="LoanType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Loan Type" Value="0" />
                <asp:ListItem Text="Personal Loan" Value="1" />
                <asp:ListItem Text="Home Loan" Value="2" />
                <asp:ListItem Text="Car Loan" Value="3" />
                <asp:ListItem Text="Education Loan" Value="" />

            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfLoanType" runat="server"
                ErrorMessage="Loan type is required" ControlToValidate="LoanType"
                InitialValue="" Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group">
            <label class="form-label">Loan Amount:</label>
            <asp:TextBox ID="LoanAmount" runat="server" TextMode="Number" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfLoanAmount" runat="server"
                ErrorMessage="Loan amount is required" ControlToValidate="LoanAmount"
                Display="None" ValidationGroup="LoanForm" />
            <asp:RegularExpressionValidator ID="revLoanAmount" runat="server"
                ControlToValidate="LoanAmount"
                ErrorMessage="Invalid Loan Amount"
                ValidationExpression="^\d+(\.\d{1,2})?$"
                Display="None" ValidationGroup="LoanForm" />
        </div>

        <div class="form-group" style="text-align: center;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" ValidationGroup="LoanForm" />
        </div>

        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                HeaderText="Please fix the following errors:"
                ShowMessageBox="true" ShowSummary="false"
                ValidationGroup="LoanForm" />
        </div>
        <div class="gridview-container">
            <div style="overflow-x: auto;">
                <asp:GridView ID="gvloan" runat="server" AutoGenerateColumns="false" CssClass="asp-grid table table-bordered" OnRowCommand="gvloan_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Full Name">
                            <ItemTemplate><%# Eval("FullName") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date of Birth">
                            <ItemTemplate><%# Eval("DateOfBirth", "{0:dd-MM-yyyy}") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate><%# Eval("gendervalue") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate><%# Eval("Email") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <ItemTemplate><%# Eval("PhoneNumber") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate><%# Eval("Address") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employment Type">
                            <ItemTemplate><%# Eval("empt") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate><%# Eval("CompanyName") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Income">
                            <ItemTemplate><%# Eval("MonthlyIncome") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Loan Type">
                            <ItemTemplate><%# Eval("lt") %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" CommandName="delly" CommandArgument='<%# Eval("Id") %>' Text="Delete" ForeColor="Red" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btnedt" CommandName="edt" CommandArgument='<%# Eval("Id") %>' ForeColor="Blue" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </asp:Panel>
</asp:Content>
