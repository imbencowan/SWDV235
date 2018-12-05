<%@ Page Title="Check Out" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOutDisk.aspx.cs" Inherits="Default2" %>

<asp:Content id="mainContent" ContentPlaceHolderID="main" runat="server">


	 <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

	 <asp:DetailsView ID="DetailsView1" defaultMode="Insert" CssClass="table table-bordered table-condensed" 
		  runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" 
		  DataKeyNames="diskID" OnItemInserted="DetailsView1_ItemInserted">
		  <HeaderTemplate>
				<p>Enter a borrower and a disk to check out: </p>
		  </HeaderTemplate>
		  <Fields>
				<asp:TemplateField HeaderText="Disk ID" SortExpression="diskID">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxDiskID" runat="server" Text='<%# Bind("diskID") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbxDiskID" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
						  <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tbxDiskID" Operator="GreaterThan" 
								Type="Integer" ValueToCompare="0" ErrorMessage="* Disk ID must be an integer greater than 0"
								ValidationGroup="Insert"></asp:CompareValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Borrower ID" SortExpression="borrowerID">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxBorrowerID" runat="server" Text='<%# Bind("borrowerID") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbxBorrowerID" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
						  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="tbxBorrowerID" Operator="GreaterThan" 
								Type="Integer" ValueToCompare="0" ErrorMessage="* Borrower ID must be an integer greater than 0"
								ValidationGroup="Insert"></asp:CompareValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Check Out Date">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxBorrowDate" runat="server" Text='<%# Bind("borrowDate") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbxBorrowDate" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<%--<asp:TemplateField HeaderText="Disk Name" SortExpression="diskName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxDiskName" runat="server" Text='<%# Bind("diskName") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbxDiskName" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>--%>
				<%--<asp:TemplateField HeaderText="Borrower's First Name" SortExpression="fName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxBorrowerFName" runat="server" Text='<%# Bind("fName") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tbxBorrowerFName" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Borrower's Last Name" SortExpression="lName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxBorrowerLName" runat="server" Text='<%# Bind("lName") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbxBorrowerLName" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>--%>
				
				<asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
		  </Fields>
	 </asp:DetailsView>

	 <br />
	 <h3>Here are the disks that are currently available: </h3>

	 <asp:GridView ID="GridViewAvailable" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="diskID" 
		  CssClass="table table-bordered table-condensed" AllowSorting="True" AllowPaging="True" PageSize="6" >
		  <Columns>
				<asp:BoundField DataField="diskID" HeaderText="diskID" ReadOnly="True" SortExpression="diskID" />
				<asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
				<asp:BoundField DataField="diskName" HeaderText="diskName" SortExpression="diskName" />
				<asp:BoundField DataField="artistFullName" HeaderText="artistFullName" ReadOnly="True" SortExpression="artistFullName" />
				<asp:BoundField DataField="groupName" HeaderText="groupName" SortExpression="groupName" />
		  </Columns>
		  <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
	 </asp:GridView>

	 <br />
	 <br />
	 <h3>And here are the disks that are currently checked out, along with their due dates: </h3>

	 <asp:GridView ID="GridViewCheckedOut" runat="server" AutoGenerateColumns="False" DataKeyNames="diskID" DataSourceID="SqlDataSource2"
		  CssClass="table table-bordered table-condensed" AllowSorting="True" AllowPaging="True" PageSize="6" >
		  <Columns>
				<asp:BoundField DataField="diskID" HeaderText="diskID" ReadOnly="True" SortExpression="diskID" />
				<asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
				<asp:BoundField DataField="diskName" HeaderText="diskName" SortExpression="diskName" />
				<asp:BoundField DataField="artistFullName" HeaderText="artistFullName" ReadOnly="True" SortExpression="artistFullName" />
				<asp:BoundField DataField="groupName" HeaderText="groupName" SortExpression="groupName" />
				<asp:BoundField DataField="borrowerName" HeaderText="borrowerName" SortExpression="borrowerName" />
				<asp:BoundField DataField="dueDate" HeaderText="dueDate" SortExpression="dueDate" />
		  </Columns>
		  <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
	 </asp:GridView>


	 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" 
		  SelectCommand="SELECT [diskID], [description], [diskName], [artistFullName], [groupName], [borrowStatus], [borrowDate] FROM [DiskAndStatus] 
		  WHERE ([borrowStatus] = '0')"  
		  InsertCommand="exec spCheckOutDisk @diskID, @borrowerID, @borrowDate " >
		  <InsertParameters>
				<asp:Parameter Name="diskID" Type="Int16" />
				<asp:Parameter Name="borrowerID" Type="Int16" />
				<asp:Parameter DbType="Date" Name="borrowDate" />
		  </InsertParameters>
		  <SelectParameters>
				<asp:Parameter DefaultValue="&quot;0&quot;" Name="borrowStatus" Type="String" />
		  </SelectParameters>
	 </asp:SqlDataSource>

	 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" 
		  SelectCommand="SELECT [diskID], [description], [diskName], [artistFullName], [groupName], [borrowStatus], [fName], [lName], 
				[borrowerName], [dueDate] FROM [DiskAndStatus] WHERE ([borrowStatus] != '0')" >
		  <SelectParameters>
				<asp:Parameter DefaultValue="&quot;0&quot;" Name="borrowStatus" Type="String" />
		  </SelectParameters>
	 </asp:SqlDataSource>

</asp:Content>
