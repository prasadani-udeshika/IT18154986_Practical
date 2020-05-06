$(document).ready(function()
{
 $("#alertSuccess").hide();
 $("#alertError").hide();
});

$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	 $("#alertSuccess").text("");
	 $("#alertSuccess").hide();
	 $("#alertError").text("");
	 $("#alertError").hide(); 
	 
	// Form validation-------------------
	 var status = validateItemForm();
	 if (status != true)
	  {
	  $("#alertError").text(status);
	  $("#alertError").show();
	  return;
	  }
	 // If valid-------------------------
	 var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";

	 $.ajax(
			 {
			  url : "registerAPI",
			  type : type,
			  data : $("#formItem").serialize(),
			  dataType : "text",
			  complete : function(response, status)
			  {
			  onItemSaveComplete(response.responseText, status);
			  }
			 });
});


function onItemSaveComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully saved User Details.");
 $("#alertSuccess").show();
 $("#divItemsGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while saving.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while saving..");
 $("#alertError").show();
 }
 $("#hidItemIDSave").val("");
 $("#formItem")[0].reset();
}

// UPDATE =========================================
$(document).on("click", ".btnUpdate", function(event)
		{
		 $("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
		 $("#UName").val($(this).closest("tr").find('td:eq(0)').text());
		 $("#NIC").val($(this).closest("tr").find('td:eq(1)').text());
		 $("#userPhon").val($(this).closest("tr").find('td:eq(2)').text());
		 $("#email").val($(this).closest("tr").find('td:eq(3)').text());
		 $("#passw").val($(this).closest("tr").find('td:eq(4)').text());
		 $("#cpass").val($(this).closest("tr").find('td:eq(5)').text());
		});
// REMOVE =========================

$(document).on("click", ".btnRemove", function(event)
		{
		 $.ajax(
		 {
		 url : "registerAPI",
		 type : "DELETE",
		 data : "UCode=" + $(this).data("itemid"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onItemDeleteComplete(response.responseText, status);
		 }
		 });
		});
// DELETE ====================================

function onItemDeleteComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully deleted User Details. ");
 $("#alertSuccess").show();
 $("#divItemsGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while deleting.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while deleting..");
 $("#alertError").show();
 }
}


//CLIENTMODEL=========================================================================
function validateItemForm()
{
// User Name
if ($("#UName").val().trim() == "")
 {
 return "Please Enter User Name";
 }
// User NIC

var tmpnic = $("#NIC").val().trim();
if ($("#NIC").val().trim() == "")
 {
 return "Please Enter NIC.";
 } if(!(tmpnic.length == 10) &&(!(tmpnic.lastletter=='V'))){
	 return "Check and Enter  Valid NIC  ";
	 
 }
// USER Phone -----------------------
if ($("#userPhon").val().trim() == "")
 {
 return "Please Enter User Phone ";
 }
// is numerical value
var tmpPhon = $("#userPhon").val().trim();
if (!$.isNumeric(tmpPhon))
 {
 return "Insert a numerical value for user phone.";
 }
if(!(tmpPhon.length == 10)){
	
	return "Enter 10 Numbers for Phone Number "; 
}
// Email validation ======================

if ($("#email"))
{
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
 
        var emailaddressVal = $("#email").val();
        if(emailaddressVal == '') {
            return 'Please enter your email address.';
           
        }
 
        else if(!emailReg.test(emailaddressVal)) {
            return 'Enter a valid email address.';
            
        }
 
        
 
  
}

// Password Validation ========================

if ($("#passw").val().trim() == "")
{
return "Please enter Password";
}

  
   if($(cpass)){
	   var passw = $("#passw").val();
	   var cpass = $("#cpass").val();
	   if(cpass==''){
		   return 'Please enter your  Confirm password ';  
	   }else if(passw != cpass){
		   return "Passwords are not match";  
	   }
	   
   } 


return true;
}

$(document).ready(function(){
	
	 $('.flexslider').flexslider({
       animation: "slide",
       start: function(slider){
         $('body').removeClass('loading');
       }
     });

});
/**
* Handles toggling the navigation menu for small screens.
*/
( function() {
	var button = document.getElementById( 'topnav' ).getElementsByTagName( 'div' )[0],
	    menu   = document.getElementById( 'topnav' ).getElementsByTagName( 'ul' )[0];

	if ( undefined === button )
		return false;

	// Hide button if menu is missing or empty.
	if ( undefined === menu || ! menu.childNodes.length ) {
		button.style.display = 'none';
		return false;
	}

	button.onclick = function() {
		if ( -1 == menu.className.indexOf( 'srt-menu' ) )
			menu.className = 'srt-menu';

		if ( -1 != button.className.indexOf( 'toggled-on' ) ) {
			button.className = button.className.replace( ' toggled-on', '' );
			menu.className = menu.className.replace( ' toggled-on', '' );
		} else {
			button.className += ' toggled-on';
			menu.className += ' toggled-on';
		}
	};
} )();


