<%--Ben Cowan 2018-11-16
SWDV235 Project 3--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Disks.aspx.cs" Inherits="Disk" %>

<asp:Content id="mainContent" ContentPlaceHolderID="main" runat="server">
	 <div>
		  <h1>Disk</h1>
		  <p>&nbsp;</p>

		  <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
		  
				<%--here is the grid view that displays the table--%>
		  <asp:GridView ID="GridDisk" runat="server" AutoGenerateColumns="False" DataKeyNames="diskID" DataSourceID="SqlDataSource1" 
			  CssClass="table table-bordered table-condensed" AllowSorting="True" AllowPaging="True" PageSize="8" 
				OnRowDeleted="grdBorrower_RowDeleted" OnRowUpdated="grdCategories_RowUpdated"  >
				<Columns>
					 <asp:BoundField DataField="diskTypeID" HeaderText="diskTypeID" SortExpression="diskTypeID" />
					 <asp:BoundField DataField="genreID" HeaderText="genreID" SortExpression="genreID" />
					 <asp:BoundField DataField="diskName" HeaderText="diskName" SortExpression="diskName" />
					 <asp:BoundField DataField="releaseDate" HeaderText="releaseDate" SortExpression="releaseDate" />
					 <asp:BoundField DataField="borrowStatus" HeaderText="borrowStatus" SortExpression="borrowStatus" />
					 <asp:CommandField ShowEditButton="True" />
					 <asp:CommandField ShowDeleteButton="True" />
				</Columns>
				<PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
		  </asp:GridView>

				<%--here is the data source, with it's methods and parameters--%>
		  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>"
				DeleteCommand="exec spDeleteDisk @original_diskID, @original_diskTypeID, @original_genreID, @original_diskName, @original_releaseDate, @original_borrowStatus" 
				InsertCommand="exec spInsertDisk @diskTypeID, @genreID, @diskName, @releaseDate, '0'" 
				OldValuesParameterFormatString="original_{0}" 
				SelectCommand="SELECT * FROM [Disk]" 
				UpdateCommand="exec spUpdateDisk @original_diskID, @diskTypeID, @genreID, @diskName, @releaseDate, @borrowStatus, @original_diskTypeID, @original_genreID, @original_diskName, @original_releaseDate, @original_borrowStatus">
				<DeleteParameters>
					 <asp:Parameter Name="original_diskID" Type="Int32" />
					 <asp:Parameter Name="original_diskTypeID" Type="Int32" />
					 <asp:Parameter Name="original_genreID" Type="Int32" />
					 <asp:Parameter Name="original_diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="original_releaseDate" />
					 <asp:Parameter Name="original_borrowStatus" Type="String" />
				</DeleteParameters>
				<InsertParameters>
					 <asp:Parameter Name="diskTypeID" Type="Int32" />
					 <asp:Parameter Name="genreID" Type="Int32" />
					 <asp:Parameter Name="diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="releaseDate" />
					 <%--<asp:Parameter Name="borrowStatus" Type="String" />--%>
				</InsertParameters>
				<UpdateParameters>
					 <asp:Parameter Name="diskTypeID" Type="Int32" />
					 <asp:Parameter Name="genreID" Type="Int32" />
					 <asp:Parameter Name="diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="releaseDate" />
					 <asp:Parameter Name="borrowStatus" Type="String" />
					 <asp:Parameter Name="original_diskID" Type="Int32" />
					 <asp:Parameter Name="original_diskTypeID" Type="Int32" />
					 <asp:Parameter Name="original_genreID" Type="Int32" />
					 <asp:Parameter Name="original_diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="original_releaseDate" />
					 <asp:Parameter Name="original_borrowStatus" Type="String" />
				</UpdateParameters>
		  </asp:SqlDataSource>

	 </div>

		  <%--and here is our insert section in a details view--%>
	 <asp:detailsview ID="detailsView1" defaultMode="Insert" runat="server" 
		  CssClass="table table-bordered table-condensed" AutoGenerateRows="False" 
		  DataSourceID="SqlDataSource1" OnItemInserted="DetailsView1_ItemInserted">
		  <HeaderTemplate>
				<p>Submit information for a new disk below.</p>
		  </HeaderTemplate>
		  <Fields>
				<asp:TemplateField HeaderText="Disk Type ID" SortExpression="diskTypeID">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxTypeID" runat="server" Text='<%# Bind("diskTypeID") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbxTypeID" 
								runat="server" ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="GenreID" SortExpression="genreID">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxGenreID" runat="server" Text='<%# Bind("genreID") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbxGenreID" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Disk Name" SortExpression="diskName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxDiskName" runat="server" Text='<%# Bind("diskName") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbxDiskName" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Release Date" SortExpression="releaseDate">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxRelease" runat="server" Text='<%# Bind("releaseDate") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbxRelease" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<%--<asp:TemplateField HeaderText="Borrow Status" SortExpression="borrowStatus">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxBorrowStatus" runat="server" Text='<%# Bind("borrowStatus") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tbxBorrowStatus" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>--%>
				<asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
		  </Fields>

	 </asp:detailsview>
	 	 

</asp:Content>