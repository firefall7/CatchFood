/**
 * 
 */
document.addEventListener("DOMContentLoaded", function () {
	let selectedDate = null;
		
	flatpickr("#datePicker", {
		dateFormat: "Y-m-d",
		minDate: "today",
		maxDate: new Date().fp_incr(14),
		onChange: function(selectedDates, dateStr) {
		selectedDate = dateStr;
		document.getElementById("final").textContent = "";
		document.getElementById("reservationDate").value = "";
		}
	});
		
	document.querySelectorAll(".time-slot").forEach(button => {
		button.addEventListener("click", function () {
			if (!selectedDate) {
		    	alert("날짜를 먼저 선택해주세요.");
		        return;
		    }
		        
			document.querySelectorAll(".time-slot").forEach(btn => btn.classList.remove("selected"));
			this.classList.add("selected"); 
			   
		    const time = this.value;
		    const fullDateTime = selectedDate + " " + time;
		    document.getElementById("reservationDate").value = fullDateTime;
		    document.getElementById("final").textContent = fullDateTime;
		});
	});
		    
	document.querySelectorAll(".people").forEach(button => {
		button.addEventListener("click", function () {
			const reservationDateValue = document.getElementById("reservationDate").value;
			
			if (!reservationDateValue) {
				alert("날짜와 시간을 먼저 선택해주세요.");
				return;
			}
						
			document.querySelectorAll(".people").forEach(btn => btn.classList.remove("selected"));
			this.classList.add("selected");
			
			const people = this.value;
			document.getElementById("reservationNumber").value = people;
		
			// 최종 선택 문장 만들기
			const finalText = reservationDateValue + " / " + people + "명";
			document.getElementById("final").textContent = finalText;
		});
	});
	
	function showCategory(categoryId) {
		document.querySelectorAll('.menu-category').forEach(el => el.classList.remove('active'));
		document.getElementById(categoryId).classList.add('active');
		
		document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('selected'));
	  	document.querySelectorAll('.category-btn').forEach(btn => {
	    	if (btn.textContent === categoryIdName(categoryId)) {
	      	btn.classList.add('selected');
	    	}
	  	});
	}
	
	function categoryIdName(id) {
	  switch (id) {
	    case 'korean': return '한식';
	    case 'western': return '양식';
	    case 'chinese': return '중식';
	    case 'japanese': return '일식';
	  }
	}
	
	window.showCategory = showCategory; // <- 이거 안 하면 JSP에서 함수 못 씀
	showCategory('korean');
			
	function updateMenuHiddenFields() {
		const checkedMenus = document.querySelectorAll('input[name="selectedMenus"]:checked');
	
		let menuNames = [];
		let menuPrices = [];
		let total = 0;
	
		checkedMenus.forEach(menu => {
		const menuNum = menu.value;
		const name = menu.dataset.name;
		const price = parseInt(menu.dataset.price);
		const countInput = document.querySelector(`input[name="count_${menuNum}"]`);
		
		if (!countInput) return;  // null이면 아래 코드 실행 안 하고 빠져나감
		const count = parseInt(countInput.value);
	
		// 여기서 수량 0이면 건너뛰는 것도 좋음
		if (isNaN(count) || count < 1) return;
				    
		menuNames.push(`${name} x${count}`);
		menuPrices.push(price * count);
		total += price * count;
		});
	
		document.getElementById("menuNames").value = menuNames.join(", ");
		document.getElementById("menuPrices").value = menuPrices.join(", ");
		document.getElementById("totalPrice").value = total;
	}
		
		
	document.querySelectorAll('input[name="selectedMenus"]').forEach(cb => {
		cb.addEventListener("change", function () {
			const reservationDate = document.getElementById("reservationDate").value;
			const reservationNumber = document.getElementById("reservationNumber").value;

			if (!reservationDate || !reservationNumber) {
				alert("위 항목을 먼저 선택해주세요.");
				cb.checked = false; // 체크 해제
				return;
			}

			updateMenuHiddenFields();
		});
	});

	
	
	document.querySelectorAll('input[type="number"][name^="count_"]').forEach(input => {
		input.addEventListener("input", updateMenuHiddenFields);
	});
				
				
	document.querySelector("form").addEventListener("submit", function (e) {
		const selectedMenus = document.querySelectorAll("input[name='selectedMenus']:checked");
		  if (selectedMenus.length === 0) {
		    alert("음식을 한 가지 이상 선택해주세요!");
		    e.preventDefault(); // 폼 제출 막기
		    return;
		  }
		
		// 기존 hidden 제거
		document.querySelectorAll(".menu-data").forEach(el => el.remove());
	
		document.querySelectorAll("input[name='selectedMenus']:checked").forEach(cb => {
			const form = cb.form;
				    
		// 이름
		const nameInput = document.createElement("input");
		nameInput.type = "hidden";
		nameInput.name = "menuName";
		nameInput.value = cb.dataset.name;
		nameInput.classList.add("menu-data");
		form.appendChild(nameInput);
	
		// 가격
		const priceInput = document.createElement("input");
		priceInput.type = "hidden";
		priceInput.name = "menuPrice";
		priceInput.value = cb.dataset.price;
		priceInput.classList.add("menu-data");
		form.appendChild(priceInput);
		});
	});
});

document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.quantity-container').forEach(container => {
    const input = container.querySelector('.qty-input');
    const plusBtn = container.querySelector('.plus');
    const minusBtn = container.querySelector('.minus');

    plusBtn.addEventListener('click', () => {
      input.value = parseInt(input.value) + 1;
    });

    minusBtn.addEventListener('click', () => {
      if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
      }
    });
  });
});
