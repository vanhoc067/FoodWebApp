/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
 

var firebaseConfig = {
    apiKey: "AIzaSyDSexUjjQVUAd_ZOOx7XTeKjrwHAkTm-Hg",
    authDomain: "realtime-507f2.firebaseapp.com",
    databaseURL: "https://realtime-507f2-default-rtdb.firebaseio.com",
    projectId: "realtime-507f2",
    storageBucket: "realtime-507f2.appspot.com",
    messagingSenderId: "169352533661",
    appId: "1:169352533661:web:f2095dc2f210391aa5a674"
  };


//function getFirebase(api, aut, data, pro, sto, mes, app){
//    firebaseConfig = {
//        apiKey: api,
//        authDomain: aut,
//        databaseURL: data,
//        projectId: pro,
//        storageBucket: sto,
//        messagingSenderId: mes,
//        appId: app
//    };
//}

/*Hàm Mở Form*/
function moForm() {
    document.getElementById("myForm").style.display = "block";
  }
  /*Hàm Đóng Form*/
  function dongForm() {
    document.getElementById("myForm").style.display = "none";
  }

firebase.initializeApp(firebaseConfig);

const db = firebase.database ();

const username = document.getElementById("name").innerHTML
document.getElementById ("message-form"). addEventListener ("submit", sendMessage);

function sendMessage(e) {
  e.preventDefault();

  // get values to be submitted
  const timestamp = Date.now();
  const messageInput = document.getElementById("message-input");
  const message = messageInput.value;

  // clear the input box
  messageInput.value = "";

  //auto scroll to bottom
  document
    .getElementById("messages")
    .scrollIntoView({ behavior: "smooth", block: "end", inline: "nearest" });

  // create db collection and send in the data
  db.ref("messages/" + timestamp).set({
    username,
    message,
  });
}

const fetchChat = db.ref("messages/");

fetchChat.on("child_added", function (snapshot) {
  const messages = snapshot.val();
  const message = `<li class=${
    username === messages.username ? "sent" : "receive"
  }><span>${messages.username}: </span>${messages.message}</li>`;
  // append the message on the page
  document.getElementById("messages").innerHTML += message;
});




