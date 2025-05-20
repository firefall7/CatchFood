/**
 * 
 */
function passwordCheck(){
	let form = document.passwordForm;
	if(!form.newPassword.value){
	         alert("비밀번호를 입력하세요!");
	         form.newPassword.focus();
	         return false;
	      }
		  
	let pw = form.newPassword.value;
	let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{8,12}$/;
		       
	if (!pwRegex.test(pw)) {
		alert("비밀번호는 8~12자, 영문자/숫자/특수문자를 각각 1개 이상 포함해야 합니다.");
		form.newPassword.value = "";
		form.newPasswordCheck.value = "";
		form.newPassword.focus();
		return false;
	}
		       
	if(form.newPassword.value != form.newPasswordCheck.value){
		alert("비밀번호가 일치하지 않습니다! 다시 입력하세요");         
		form.newPassword.value="";
		form.newPasswordCheck.value="";
		form.newPassword.focus();
		return false;
	}
	
	form.submit();		  	  
}