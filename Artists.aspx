<%--Ben Cowan 2018-11-16
SWDV235 Project 3--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Artists.aspx.cs" Inherits="Artist" %>

<asp:Content id="mainContent" ContentPlaceHolderID="main" runat="server">
	 <div>
		  <h1>Artist</h1>

		  <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
				
				<%--here is the grid view that displays the table--%>
		  <asp:GridView ID="grdArtist" runat="server" AutoGenerateColumns="False" DataKeyNames="artistID" 
				DataSourceID="SqlDataSource1" CssClass="table table-bordered table-condensed" AllowSorting="True" 
				AllowPaging="True" PageSize="8" >
				<Columns>
					 <asp:BoundField DataField="fName" HeaderText="fName" SortExpression="fName" />
					 <asp:BoundField DataField="lName" HeaderText="lName" SortExpression="lName" />
					 <asp:BoundField DataField="groupName" HeaderText="groupName" SortExpression="groupName" />
					 <asp:BoundField DataField="artistType" HeaderText="artistType" SortExpression="artistType" />
					 <asp:CommandField ShowEditButton="True" />
					 <asp:CommandField ShowDeleteButton="True" />
				</Columns>
				<PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
	 </asp:GridView>

				<%--here is the data source, with it's methods and parameters--%>
	 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" 
				SelectCommand="SELECT * FROM [Artist]" ConflictDetection="CompareAllValues" 
			DeleteCommand="exec spDeleteArtist @original_artistID, @original_artistType, @original_fName, @original_lName, @original_groupName" 
			InsertCommand="exec spInsertArtist @artistType, @fName, @lName, @groupName" 
			OldValuesParameterFormatString="original_{0}" 
			UpdateCommand="exec spUpdateArtist @original_artistID, @artistType, @fName, @lName, @groupName, @original_artistType, @original_fName, @original_lName, @original_groupName">
		  <DeleteParameters>
				<asp:Parameter Name="original_artistID" Type="Int32" />
				<asp:Parameter Name="original_artistType" Type="Int32" />
				<asp:Parameter Name="original_fName" Type="String" />
				<asp:Parameter Name="original_lName" Type="String" />
				<asp:Parameter Name="original_groupName" Type="String" />
		  </DeleteParameters>
		  <InsertParameters>
				<asp:Parameter Name="artistType" Type="Int32" />
				<asp:Parameter Name="fName" Type="String" />
				<asp:Parameter Name="lName" Type="String" />
				<asp:Parameter Name="groupName" Type="String" />
		  </InsertParameters>
		  <UpdateParameters>
				<asp:Parameter Name="artistType" Type="Int32" />
				<asp:Parameter Name="fName" Type="String" />
				<asp:Parameter Name="lName" Type="String" />
				<asp:Parameter Name="groupName" Type="String" />
				<asp:Parameter Name="original_artistID" Type="Int32" />
				<asp:Parameter Name="original_artistType" Type="Int32" />
				<asp:Parameter Name="original_fName" Type="String" />
				<asp:Parameter Name="original_lName" Type="String" />
				<asp:Parameter Name="original_groupName" Type="String" />
		  </UpdateParameters>
		  </asp:SqlDataSource>
	 </div>

		  <%--and here is our insert section in a details view--%>
	 <asp:detailsview ID="detailsView1" defaultMode="Insert" runat="server" 
		  CssClass="table table-bordered table-condensed" AutoGenerateRows="False" 
		  DataSourceID="SqlDataSource1" OnItemInserted="DetailsView1_ItemInserted">
		  <HeaderTemplate>
				<p>Submit information for a new artist below.</p>
		  </HeaderTemplate>
		  <Fields>
				<asp:TemplateField HeaderText="Aritst Type" SortExpression="artistType">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxArtistType" runat="server" Text='<%# Bind("artistType") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbxArtistType" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="First Name" SortExpression="fName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxFName" runat="server" Text='<%# Bind("fName")  %>'></asp:TextBox>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Last Name" SortExpression="lName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxLName" runat="server" Text='<%# Bind("lName") %>'></asp:TextBox>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Group Name" SortExpression="groupName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxGroupName" runat="server" TextMode="email" Text='<%# Bind("groupName") %>'></asp:TextBox>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
		  </Fields>

	 </asp:detailsview>

</asp:Content>