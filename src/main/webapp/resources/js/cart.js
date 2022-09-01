/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function order() {
    if(confirm("Ban xac nhan dat hang ?") == true) {
        fetch("/FoodWebApp/api/order",{
            method:"post"
        }).then(function(res){
            return res.json();
        }).then(function(code){
            console.info(code);
            location.reload();
        })
    }
}

function addToCart(id, name, price) {   
    event.preventDefault();
    fetch("/FoodWebApp/api/cart",{
        method:'post',
        body:JSON.stringify({
            "foodId":id,
            "foodName":name,
            "price":price,
            "quantity":1
        }),
        headers: {
            "Content-Type":"application/json" 
        }  
    }).then(function(res){
        return res.json();
    }).then(function(data){
        let counter = document.getElementById("cartCounter");
        counter.innerText = data;
    });
}

function updateCart(obj,foodId) {
    fetch("/FoodWebApp/api/cart",{
        method:'put',
        body:JSON.stringify({
            "foodId":foodId,
            "foodName":"",
            "price":0,
            "quantity":obj.value
        }),
        headers: {
            "Content-Type":"application/json" 
        } 
    }).then(function(res){
        return res.json()
    }).then(function(data){
        let counter = document.getElementById("cartCounter");
        counter.innerText = data.counter;
        let amount = document.getElementById("amountCart");
        amount.innerText = data.amount; 
    })  
}

function deleteCart(foodId) {
    Swal.fire({
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, delete it!'
}).then((result) => {
  if (result.isConfirmed) {
    fetch(`/FoodWebApp/api/cart/${foodId}`,{
        method:'delete'
    }).then(function(res){
        return res.json()
    }).then(function(data) {
        let counter = document.getElementById("cartCounter");
        counter.innerText = data.counter;
        let amount = document.getElementById("amountCart");
        amount.innerText = data.amount;  
        let row = document.getElementById(`food${foodId}`);
        row.style.display = "none";
    })  
    Swal.fire(
      'Deleted!',
      'Your food has been deleted.',
      'success'
    )
  }
})


    
}