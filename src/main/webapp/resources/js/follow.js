/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function addToFollow(userId, email) { 
    console.log("tesst")
    event.preventDefault();
    fetch("/FoodWebApp/api/follow",{
        method:'post',
        body:JSON.stringify({
            "userId":userId,
            "email":email,
        }),
        headers: {
            "Content-Type":"application/json" 
        }  
    }).then(function(res){
        return res.json();
    }).then(function(data){
    });
}

function deletefollow(endpoint, id) {
    console.log("tesssssssssssssst")
    let r = document.getElementById(`row${id}`);
    let load = document.getElementById(`load${id}`);
    let btn = document.getElementById(`btn${id}`);
    load.style.display= "block";
    btn.style.display = "none";
    fetch(endpoint, {
        method:'delete'
    }).then(function(res) {
        if(res.status !== 204)
            alert("Something wrong!!!");
        load.style.display = "none";
        r.style.display = "none";
    }).catch(function(err) {
        console.error(err);
        btn.style.display = "block";
        load.style.display = "none";
    });
}


