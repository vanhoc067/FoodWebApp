/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var firebaseConfig = {
  apiKey: "AIzaSyBmu4ktn7tq4m97FP57dIc5japA92ny5Zo",
  authDomain: "chat-realtime-aa198.firebaseapp.com",
  databaseURL: "https://chat-realtime-aa198-default-rtdb.firebaseio.com",
  projectId: "chat-realtime-aa198",
  storageBucket: "chat-realtime-aa198.appspot.com",
  messagingSenderId: "28073263411",
  appId: "1:28073263411:web:991c9d3e842085b7c3be46",
};  


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


/*Hàm Mở Form*/
function moForm() {
    document.getElementById("myForm").style.display = "block";
  }
  /*Hàm Đóng Form*/
  function dongForm() {
    document.getElementById("myForm").style.display = "none";
  }

