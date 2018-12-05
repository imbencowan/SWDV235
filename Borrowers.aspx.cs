using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
	 protected void Page_Load(object sender, EventArgs e)
	 {

	 }

	 protected void grdBorrower_PreRender(object sender, EventArgs e)
	 {
		  grdBorrower.HeaderRow.TableSection = TableRowSection.TableHeader;
	 }

	 protected void grdCategories_RowUpdated(object sender, GridViewUpdatedEventArgs e)
	 {
		  lblError.Text = "we at least made it here";
		  if (e.Exception != null)
		  {
				lblError.Text = DatabaseErrorMessage(e.Exception.Message);
				e.ExceptionHandled = true;
				e.KeepInEditMode = true;
		  }
		  else if (e.AffectedRows == 0)
		  {
				lblError.Text = ConcurrencyErrorMessage();
		  }
	 }

	 protected void grdBorrower_RowDeleted(object sender, GridViewDeletedEventArgs e)
	 {
		  if (e.Exception != null)
		  {
				lblError.Text = DatabaseErrorMessage(e.Exception.Message);
				e.ExceptionHandled = true;
		  }
		  else if (e.AffectedRows == 0)
		  {
				lblError.Text = ConcurrencyErrorMessage();
		  }
	 }

	 protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
	 {
		  if (e.Exception != null)
		  {
				lblError.Text = DatabaseErrorMessage(e.Exception.Message);
				e.ExceptionHandled = true;
		  }
		  else if (e.AffectedRows == 0)
		  {
				lblError.Text = ConcurrencyErrorMessage();
		  }
	 }


	 private string DatabaseErrorMessage(string errorMsg)
	 {
		  return $"<b>A database error has occurred:</b> {errorMsg}";
	 }
	 private string ConcurrencyErrorMessage()
	 {
		  return "Another user may have updated this item. Please try again";
	 }


}