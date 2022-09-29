/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function loadStoreComments(endpoint) {
    fetch(endpoint).then(function(res){
        return res.json();
    }).then(function(data){
        let c = document.getElementById("store-comments");
        let h = "";
        for(let d of data)
            h += `  
            <div class="d-flex text-muted pt-3">
                <h1 class="pb-3 mb-0  lh-sm border-bottom">
                    <img style="width:30px" class="rounded-circle" src=${d.user.image} />
                    <strong class=" text-gray-dark">${d.user.username} </strong> đã bình luận <strong class=" text-gray-dark"> ${moment(d.createdDate).locale("vi").fromNow()}</strong> 
                    <p>${d.content}</>
                </h1>
            </div>
            `
        c.innerHTML = h;
    })
} 

function addStoreComment(endpoint, storeId) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("contentId").value,
            "storeId": storeId
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

