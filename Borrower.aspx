<%--Ben Cowan 2018-11-16
SWDV235 Project 3--%>

<%@ Page Title="Borrower Entry" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Default2" %>


	 <%-- this will all go in the main of the Master --%>
<asp:Content id="mainContent" ContentPlaceHolderID="main" runat="server">
	 <h1>Borrower</h1>

	 <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
	 
				<%--here is the grid view that displays the table--%>
	 <asp:GridView ID="grdBorrower" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="borrowerID" 
		  CssClass="table table-bordered table-condensed" AllowSorting="True" AllowPaging="True" PageSize="8" 
		  OnRowDeleted="grdBorrower_RowDeleted" OnRowUpdated="grdCategories_RowUpdated" >
		  <Columns>
				<asp:BoundField DataField="fName" HeaderText="fName" SortExpression="fName" />
				<asp:BoundField DataField="lName" HeaderText="lName" SortExpression="lName" />
				<asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
				<asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
		  		<asp:CommandField ShowEditButton="True" />
				<asp:CommandField ShowDeleteButton="True" />
		  </Columns>
		  <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
	 </asp:GridView>

				<%--here is the data source, with it's methods and parameters--%>
	 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" 
		  ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="og_{0}"
		  SelectCommand="SELECT * FROM [Borrower]"
		  DeleteCommand="exec spDeleteBorrower @og_borrowerID, @og_fName, @og_lName, @og_email, @og_phone" 
		  InsertCommand="exec spInsertBorrower @fName, @lName, @email, @phone" 
		  UpdateCommand="exec spUpdateBorrower @og_borrowerID, @og_fName, @fName, @og_lName, @lName, @og_email, @email, @og_phone, @phone" >
		  <DeleteParameters>
				<asp:Parameter Name="og_borrowerID" Type="Int32" />
				<asp:Parameter Name="og_fName" Type="string" />
				<asp:Parameter Name="og_lName" Type="string" />
				<asp:Parameter Name="og_email" Type="string" />
				<asp:Parameter Name="og_phone" Type="string" />
		  </DeleteParameters>
	
	 	 <InsertParameters>
			  <asp:Parameter Name="fName" Type="String" />
			  <asp:Parameter Name="lName" Type="String" />
			  <asp:Parameter Name="email" Type="String" />
			  <asp:Parameter Name="phone" Type="String" />
		  </InsertParameters>
		  <UpdateParameters>
				<asp:Parameter Name="fName" Type="String" />
				<asp:Parameter Name="lName" Type="String" />
				<asp:Parameter Name="email" Type="String" />
				<asp:Parameter Name="phone" Type="String" />
				<asp:Parameter Name="og_borrowerID" Type="Int32" />
				<asp:Parameter Name="og_fName" Type="String" />
				<asp:Parameter Name="og_lName" Type="String" />
				<asp:Parameter Name="og_email" Type="String" />
				<asp:Parameter Name="og_phone" Type="String" />
		  </UpdateParameters>
	 </asp:SqlDataSource>
	 
		  <%--and here is our insert section in a details view--%>
	 <asp:detailsview ID="detailsView1" defaultMode="Insert" runat="server" 
		  CssClass="table table-bordered table-condensed" AutoGenerateRows="False" 
		  DataSourceID="SqlDataSource1" OnItemInserted="DetailsView1_ItemInserted">
		  <HeaderTemplate>
				<p>Submit information for a new borrower below.</p>
		  </HeaderTemplate>
		  <Fields>
				<asp:TemplateField HeaderText="First Name" SortExpression="fName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxFName" runat="server" Text='<%# Bind("fName") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbxFName" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Last Name" SortExpression="lName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxLName" runat="server" Text='<%# Bind("lName") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbxLName" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Email" SortExpression="email">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxEmail" runat="server" TextMode="email" Text='<%# Bind("email") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbxEmail" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
						  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
								ErrorMessage="Enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
								ControlToValidate="tbxEmail" ValidationGroup="Insert"></asp:RegularExpressionValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Phone" SortExpression="phone">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxPhone" runat="server" TextMode="phone" Text='<%# Bind("phone") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbxPhone" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
						  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter a number in the form 999-999-9999" 
								ControlToValidate="tbxPhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
								 ValidationGroup="Insert"></asp:RegularExpressionValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
		  </Fields>

	 </asp:detailsview>
	 	 

</asp:Content>

