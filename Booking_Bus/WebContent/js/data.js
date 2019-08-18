function addRowHandlers() {
    if(document.getElementById("table")!=null){
        var table = document.getElementById("table");
        var rows = table.getElementsByTagName('tr');
        var email = '';
        var role = '';
        for ( var i = 1; i < rows.length; i++) {

            rows[i].i = i;
            rows[i].onclick = function() {

                email = table.rows[this.i].cells[0].innerHTML;                
                role = table.rows[this.i].cells[1].innerHTML;  
//                alert('email: '+email+' role: '+role);
                $('input[name="email_edit"]').val(email);
            	$('input[name="role_edit"]').val(role);
            };
        }
    }
}

