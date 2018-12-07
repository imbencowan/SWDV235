<%@ Page Title="Check Out" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOutDisk.aspx.cs" Inherits="Default2" %>

<asp:Content id="mainContent" ContentPlaceHolderID="main" runat="server">

	 <h1>Check Out</h1>

	 <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

	 <asp:DetailsView ID="DetailsView1" defaultMode="Insert" CssClass="table table-bordered table-condensed" 
		  runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" 
		  DataKeyNames="diskID" OnItemInserted="DetailsView1_ItemInserted">
		  <HeaderTemplate>
				<h5>Enter a borrower and a disk to check out: </h5>
				<p class="indent smaller">Below you can view which disks are available, and which are checked out, along with their due dates.</p>
		  </HeaderTemplate>
		  <Fields>

				<asp:TemplateField HeaderText="Select a Disk">
						<InsertItemTemplate>
							<asp:DropDownList id="ddlDisk" datasourceid="SqlDataSource3"
								datatextfield="diskName" DataValueField="diskID" runat="server" 
								 SelectedValue='<%# Bind("diskID") %>' >
							</asp:DropDownList>
						</InsertItemTemplate>
			  </asp:TemplateField>

				<asp:TemplateField HeaderText="Select a Borrower">
						<InsertItemTemplate>
							<asp:DropDownList id="ddlBorrower" datasourceid="SqlDataSource4"
								datatextfield="fullName" DataValueField="borrowerID" runat="server" 
								 SelectedValue='<%# Bind("borrowerID") %>' >
							</asp:DropDownList>
						</InsertItemTemplate>
			  </asp:TemplateField>
				<asp:TemplateField HeaderText="Check Out Date">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxBorrowDate" runat="server" Text='<%# Bind("borrowDate") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbxBorrowDate" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				
				<asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
		  </Fields>
	 </asp:DetailsView>

	 <br />
	 <h3>Here are the disks that are currently available: </h3>

	 <asp:GridView ID="GridViewAvailable" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="diskName" 
		  CssClass="table table-bordered table-condensed" AllowSorting="True" AllowPaging="True" PageSize="6" >
		  <Columns>
				<asp:BoundField DataField="diskName" HeaderText="diskName" SortExpression="diskName" />
				<asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
				<asp:BoundField DataField="artistFullName" HeaderText="artistFullName" ReadOnly="True" SortExpression="artistFullName" />
				<asp:BoundField DataField="groupName" HeaderText="groupName" SortExpression="groupName" />
		  </Columns>
		  <PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
	 </asp:GridView>

	 <br />
	 <br />
	 <h3>And here are the disks that are currently checked out, along with their due dates: </h3>

	 <asp:GridView ID="GridViewCheckedOut" runat="server" AutoGenerateColumns="False" DataKeyNames="diskName" DataSourceID="SqlDataSource2"
		  CssClass="table table-bordered table-condensed" AllowSorting="True" AllowPaging="True" PageSize="6" >
		  <Columns>
				<asp:BoundField DataField="diskName" HeaderText="diskName" SortExpression="diskName" />
				<asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
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
		  SelectCommand="SELECT [description], [diskName], [artistFullName], [groupName], [borrowStatus], [fName], [lName], 
				[borrowerName], [dueDate] FROM [DiskAndStatus] WHERE ([borrowStatus] != '0')" >
		  <SelectParameters>
				<asp:Parameter DefaultValue="&quot;0&quot;" Name="borrowStatus" Type="String" />
		  </SelectParameters>
	 </asp:SqlDataSource>

	 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" SelectCommand="SELECT [diskID], [diskName] FROM [Disk] WHERE ([borrowStatus] = '0')"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" SelectCommand="SELECT * FROM [BorrowerWithName]"></asp:SqlDataSource>

	 </asp:Content>
