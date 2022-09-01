/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function delUser(endpoint, id){
    let d = document.getElementById("load" + id);
    d.style.display = "block";
    fetch(endpoint, {
        method: "delete"
    }).then(function(res){
        if(res.status === 204)
            location.reload();
    }).catch(function(err){
        console.error(err);
    });
}

function loadAdminUser(endpoint){
    fetch(endpoint).then(function(res){
        return res.json();
    }).then(function(data){
        console.info(data);
        let msg ="";
        let check ="";
        for (let i = 0; i<data.length; i++) {
            if(data[i].active === true){
                check = "checked";
            }
            if(data[i].active === false){
                check = "";
            }
            msg += `
            <tr>
                <td>${data[i].id}</td>
                <td>${data[i].username}</td>
                <td>${data[i].firstName}</td>
                <td>${data[i].lastName}</td>
                <td>${data[i].dateOfBirth}</td>
                <td>${data[i].phone}</td>
                <td>${data[i].email}</td>
                <td>${data[i].address}</td>
                <td>
                    <input type="checkbox" name="active" ${check} >
                </td>
                <td>${data[i].userRole}</td>
                <td>
                    <div class="spinner-border text-primary" style="display: none" id="load${data[i].id}"></div>
                    <button class="btn btn-danger" onclick="delUser('${endpoint + "/" + data[i].id}', ${data[i].id})" >xóa</button>
                </td>
            </tr>
            `
        }
        
        let d = document.getElementById("adminUser");
        d.innerHTML = msg;
        
        let d2 = document.getElementById("myLoading")
        d2.style.display = "none";
    })
}


