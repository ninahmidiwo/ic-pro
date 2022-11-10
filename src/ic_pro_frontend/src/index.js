import { ic_pro_backend } from "../../declarations/ic_pro_backend";

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const button = e.target.querySelector("button");

  const name = document.getElementById("userName").value.toString();

  button.setAttribute("disabled", true);

  // Interact with foo actor, calling the greet method
  const greeting = await ic_pro_backend.greet(name);

  button.removeAttribute("disabled");

  document.getElementById("profile").innerText = greeting;

  return false;
});
