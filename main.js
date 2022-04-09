/* ------------ montrer le menu ------------ */
const showMenu = (toggleId, navId) => {
  //creation des variable avec les parametre
  const toggle = document.getElementById(toggleId),
    nav = document.getElementById(navId);

  //test si les veriables existe
  if (toggle && nav) {
    toggle.addEventListener("mousedown", () => {
      nav.classList.toggle("show-menu");
    });
  }
};
//on ajoute un eventlistener sur nav-menu quand on click sur nav-menu
showMenu("nav-toggle", "nav-menu");

/* --------- Retirer le menu sur mobile ----------- */
const navLink = document.querySelectorAll(".nav__link");

// fonction qui cache le menu qund activer
function linkAction() {
  // creation de la variable navMenu qui contien le menu
  const navMenu = document.getElementById("nav-menu");
  // cache le menu si on click sur un nav__link
  navMenu.classList.remove("show-menu");
}

// ajout des eventlistener sur tout les nav__link
navLink.forEach((n) => n.addEventListener("mousedown", linkAction));

/* ---------- Scroll jusqua la section actuelle ---------- */
// creation de la variable sections qui contient toute les section du site
const sections = document.querySelectorAll("section[id]");

// fonction qui scroll a la section active
function scrollActive() {
  const scrollY = window.pageYOffset;

  sections.forEach((current) => {
    const sectionHeight = current.offsetHeight;
    const sectionTop = current.offsetTop - 50;
    sectionId = current.getAttribute("id");

    if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
      document
        .querySelector(".nav__menu a[href*=" + sectionId + "]")
        .classList.add("active-link");
    } else {
      document
        .querySelector(".nav__menu a[href*=" + sectionId + "]")
        .classList.remove("active-link");
    }
  });
}
window.addEventListener("scroll", scrollActive);

/* ------------ montret la fleche scroll to top ------------*/
function scrollTop() {
  const scrollTop = document.getElementById("scroll-top");
  // When the scroll is higher than 560 viewport height, add the show-scroll class to the a tag with the scroll-top class
  if (this.scrollY >= 200) scrollTop.classList.add("show-scroll");
  else scrollTop.classList.remove("show-scroll");
}
window.addEventListener("scroll", scrollTop);