/**
 * 
 */
   function goPopup(){
      var pop = window.open("popup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
   }
   
   function jusoCallBack(roadAddrPart1,addrDetail){
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      document.register.userAddress.value = roadAddrPart1;
      document.register.userAddrdetail.value = addrDetail;
      
      
}
   
   function check(){
      let form = document.register;
      if(!form.userId.value){
         alert("아이디를 입력하세요!");
         form.userId.focus();
         return false;

      }
      if(!form.userPasswd.value){
         alert("비밀번호를 입력하세요!");
         form.userPasswd.focus();
         return false;
      }
      
      let pw = form.userPasswd.value;
      let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{8,12}$/;
      
      if (!pwRegex.test(pw)) {
          alert("비밀번호는 8~12자, 영문자/숫자/특수문자를 각각 1개 이상 포함해야 합니다.");
          form.userPasswd.value = "";
          form.userPasswd2.value = "";
          form.userPasswd.focus();
          return false;
      }
      
      if(form.userPasswd.value != form.userPasswd2.value){
         alert("비밀번호가 일치하지 않습니다! 다시 입력하세요");         
         form.userPasswd.value="";
         form.userPasswd2.value="";
         form.userPasswd.focus();
         return false;
      }
      
      if(!form.userEmail.value){
         alert("이메일을 입력하세요!");
         form.userEmail.focus();
         return false;
      }
      
      if(!form.userName.value){
         alert("이름을 입력하세요!");
         form.userName.focus();
         return false;
      }
      
      if(!form.userBirth.value){
         alert("생년월일을 입력하세요!");
         form.userBirth.focus();
         return false;
      }
      
      if (!form.userGender.value) {
          alert("성별을 선택하세요!");
          return false;
      }
      
      if(!form.userPhone.value){
         alert("전화번호를 입력하세요!");
         form.userPhone.focus();
         return false;
      }

      
      form.submit();
   }