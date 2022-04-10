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

/* ---------------- dark/light theme ------------------------*/
const themeButton = document.getElementById("theme-button");
const darkTheme = "dark-theme";
const iconTheme = "bx-sun";

// theme actuelement actif
const selectedTheme = localStorage.getItem("selected-theme");
const selectedIcon = localStorage.getItem("selected-icon");

// recuperation du theme actif
const getCurrentTheme = () =>
  document.body.classList.contains(darkTheme) ? "dark" : "light";
const getCurrentIcon = () =>
  themeButton.classList.contains(iconTheme) ? "bx-moon" : "bx-sun";

// We validate if the user previously chose a topic
if (selectedTheme) {
  // If the validation is fulfilled, we ask what the issue was to know if we activated or deactivated the dark
  document.body.classList[selectedTheme === "dark" ? "add" : "remove"](
    darkTheme
  );
  themeButton.classList[selectedIcon === "bx-moon" ? "add" : "remove"](
    iconTheme
  );
}

// Activate / deactivate the theme manually with the button
themeButton.addEventListener("click", () => {
  // Add or remove the dark / icon theme
  document.body.classList.toggle(darkTheme);
  themeButton.classList.toggle(iconTheme);
  // We save the theme and the current icon that the user chose
  localStorage.setItem("selected-theme", getCurrentTheme());
  localStorage.setItem("selected-icon", getCurrentIcon());
});

/* ---------------- GENERER LE PDF ------------------------*/
// mettre le CV au format A4
function scaleCV() {
  document.body.classList.add("scale-cv");
}
// retier les changement apres le telechargement
function unScaleCV() {
  document.body.classList.remove("scale-cv");
}
// gerenre le pdf
let areaCV = document.getElementById("cv-area");
let buttonCV = document.getElementById("cv-button");
// option html2pdf
let opt = {
  margin: 0,
  filename: "CV_Amine_BOUJEMAAOUI.pdf",
  image: { type: "jpeg", quality: 0.98 },
  html2canvas: { scale: 4 },
  jsPDF: { format: "a4", orientation: "portrait" },
};
// fonction qui appele html2pdf
function generatePDF() {
  html2pdf(areaCV, opt);
}
// eventlistener sur le bouton
buttonCV.addEventListener("click", () => {
  // 1. ajout de la class .scale-cv
  scaleCV();
  // 2. on genere le pdf
  generatePDF();
  // on retire la classe apres 5 seconde
  setTimeout(unScaleCV, 5000);
});
