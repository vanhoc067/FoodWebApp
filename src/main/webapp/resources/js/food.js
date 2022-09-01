   /* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function deleteFood(endpoint, id, btn) {  
    let r = document.getElementById(`row${id}`);
    let load = document.getElementById(`load${id}`);
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



function getFood(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data){
        let d = document.getElementById("myFood");
        if(d !== null) {
            let h = "";
            for(let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td><img src="${data[i].image}" width="120" /></td>
                    <td>${data[i].name}</td>
                    <td>${data[i].quantity}</td>
                    <td>${data[i].price}</td>
                    <td>
                        <div class="spinner-border text-primary" style="display:none" id="load${data[i].id}"></div>
                        <button class="btn btn-outline-primary" onclick="deleteFood('${endpoint + "/" + data[i].id}', ${data[i].id},this)">Xoa</button>
                    </td>
                </tr>`;
        
            d.innerHTML = h;
        }
        let d2 = document.getElementById("mySpinner");
        d2.style.display = "none" ;
        
        
        
    }).catch(function(err) {
        console.error(err);
    });
}
function loadComments(endpoint) {
    fetch(endpoint).then(function(res){
        return res.json();
    }).then(function(data){
        let c = document.getElementById("comments");
        let h = "";
        for(let d of data)
            h += `  
            <div class="d-flex text-muted pt-3">
                <h1 class="pb-3 mb-0  lh-sm border-bottom">
                    <strong class=" text-gray-dark">${d.user.username} </strong> da binh luan khoang <strong class=" text-gray-dark"> ${moment(d.createdDate).locale("vi").fromNow()}</strong> 
                    <p>${d.content}</>
                </h1>
            </div>
            `
        c.innerHTML = h;
    })
} 

function addComment(endpoint, foodId) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("contentId").value,
            "foodId": foodId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res) {
        return res.json();
    }).then(function(data) {
        let d = document.querySelector("#comments li: first-child");
        let h = `
            <div class="d-flex text-muted pt-3">
                <h1 class="pb-3 mb-0  lh-sm border-bottom">
                    <strong class=" text-gray-dark">${data.user.username} </strong> da binh luan khoang <strong class=" text-gray-dark"> ${moment(data.createdDate).locale("vi").fromNow()}</strong> 
                    <p>${data.content}</>
                </h1>
            </div>
        `
        d.insertAdjacentHTML("beforebegin",h) ;
    })
}





